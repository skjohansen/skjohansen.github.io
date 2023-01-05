---
gist-sync: 2023-01-05T12:24:59
gist-link: https://gist.github.com/skjohansen/01a4bc472eff47422e964919a3c3dbb2
repo-link: https://github.com/skjohansen/example-cake_and_docker
layout: post
title: "Cake and Docker"
tags: DevOps
---

![Banner with Cake and Docker](/img/posts/cd-banner-20230104.png)

# Cake and Docker


With [Cake](https://cakebuild.net/) is it possible to define build-scripts, using a C# / .NET syntax, to simplify and standardize the build of a project. And in this blog-post will I show how you can use Cake to build a Docker image.

[Cake](https://cakebuild.net/) is build automation system. A .NET equivalent to the Linux Make. And the point of having a system like Cake (or Make) is to make is easy to build a project, and make sure that it's always build the same way, so that the build output at one computer is simular to the build output at an other computer.

I have create a git-repo with the examples shown below, so that you easily can try it out by yourself: [Example: Cake and Docker](https://github.com/skjohansen/example-cake_and_docker).

You will need to install [.NET 7 SDK](https://dotnet.microsoft.com/en-us/download) and [Cake.Tool](https://www.nuget.org/packages/Cake.Tool) to follow the examples. After installing .NET can Cake.Tool easily be installed by `dotnet tool restore` (within the repo).

I assume that you have a basic knowledge on Cake.

## Building Docker images using Cake

Sometimes when working with Docker you get a quite long build command (due to arguments and settings), where support from a script tool like Make, sh, ps1 or Cake can make the process of building simpler.

Cake can be used to standardize the build and make sure the image is build with the same arguments each time. And at the same time limit the number of commands the developer need to remeber, and the amount of documentation needed to read in order to understand how to build the project.

There is an official Cake [add-in](https://cakebuild.net/docs/fundamentals/extensions/addins) for working with Docker. But what you will need to do is to create a file called *build.cake* with the follow content. And it will build a *dockerfile* in the same directory. The main magic is within the method-alias [DockerBuild](https://cakebuild.net/api/Cake.Docker/DockerAliases/F49509D6) and the class [DockerImageBuildSettings](https://cakebuild.net/api/Cake.Docker/DockerImageBuildSettings/).

```cake
#addin nuget:?package=Cake.Docker&version=1.1.2
var target = Argument("target", "Docker information");
string [] dockerTags = new string[]  {  $"api_local"};
string containerPort = "4567";

Task("Build Docker Image")
.Does(() => {
    var settings = new DockerImageBuildSettings { 
        Tag=dockerTags
    };
    DockerBuild(settings, ".");
});

Task("Docker information").IsDependentOn("Build Docker Image").Does(()=>{
    Information($"Run the image by running:");
    foreach (var dockerTag in dockerTags)
    {
        Information($"\tdocker run -it -p {containerPort}:80 {dockerTag}");
    }    
});

RunTarget(target);
```

The script can now be executed using: `dotnet cake`

And when starting a container based on the image (as stated in the end of the script), can the API be access at: http://localhost:4567/WeatherForecast

> Note: There are also Cake-methods for pushing docker images to a registry, and in that way can the whole build process be done within the Cake-script.

## Reading environment variables with Cake

Sometimes you are in a situation where you have some variables stored in a *.env* (dotenv) file which you would like to use as part of your build process. It could be a username or some API-key which is used as part of the docker build process (or login to a Docker registry).

An example of the content of a *.env*-file (in the repo is the *.env* in *.gitignore*, so there is no file):

```env
USERNAME=someuser
APIKEY=8vx...3nb
```

As we are using Cake can we parse the *.env*-file, as with any .NET application.

With Cake is it possible to use any NuGet package within the build-script, we simply need reference it within the script, the syntax is a bit different from what is normally used within C#, but Cake-referencing is shown within NuGet.org.

![dotenv.net at Nuget.org](/img/posts/image-20230104170415458.png)

By adding the *dotenv.net* NuGet-package to the script we did previously, can we then parse the *.env*-file, and parse the variables to our docker build as arguments:

```cake
#addin nuget:?package=Cake.Docker&version=1.1.2
#addin nuget:?package=dotenv.net&version=3.1.2
var target = Argument("target", "Docker information");
var envVars = dotenv.net.DotEnv.Read();
string [] dockerTags = new string[]  {  $"api_local"};
string containerPort = "4567";

Task("Build Docker Image")
.WithCriteria(() => envVars.ContainsKey("USERNAME"), ".env file need a USERNAME entry")
.WithCriteria(() => envVars.ContainsKey("APIKEY"), ".env file need a APIKEY entry")
.Does(() => {
    string [] arguments = new string[]  {  $"USERNAME={envVars["USERNAME"]}", $"APIKEY={envVars["APIKEY"]}"};
    Information("Building : Docker Image");
    var settings = new DockerImageBuildSettings { 
        Tag=dockerTags,
        BuildArg = arguments
    };
    DockerBuild(settings, ".");
});

Task("Docker information").IsDependentOn("Build Docker Image").Does(()=>{
    Information($"Run the image by running:");
    foreach (var dockerTag in dockerTags)
    {
        Information($"\tdocker run -it -p {containerPort}:80 {dockerTag}");
    }    
});

RunTarget(target);
```

To run this build-script run: `dotnet cake .\build-env.cake`

To the task *Build Docker Image* is added to criteria's to make sure the variables is actually included in the *.env*-file. Sadly [WithCriteria](https://cakebuild.net/docs/writing-builds/tasks/criteria) is not conditional, meaning the script will continue running but just skipping the *Build Docker Image*-task (a possibility to enable WithCriteria to be conditional is currently a [suggested feature](https://github.com/cake-build/cake/issues/514)). 

> Note: To see the messages from Criteria you will need set the Cake verbosity to either Verbose or Diagnostic, eg.:  `dotnet cake .\build-env.cake -v Verbose`

## More ressouses

* Video (30 min): [A Piece of Cake - C# Powered Cross-platform Build Automation](https://www.youtube.com/watch?v=o38glTSZsVg)
* [How to build Docker Containers with Cake](https://garywoodfine.com/how-to-build-docker-containers-with-cake/)
