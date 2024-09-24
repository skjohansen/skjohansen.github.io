---
layout: post
title: Embracing a Zero Bug Strategy - Why Fixing Bugs Immediately Wins the Race
passions: Test, Software development
summary: Adopt a Zero Bug Strategy by fixing bugs immediately instead of backlogging them. This is a blog post inspired by the tale of the Hare and the Tortoise, which teaches a tortoise approach to ensure higher quality, reduce costs, and increase customer satisfaction. The point is that this can be done by embracing a steady, proactive bug-fixing method which leads to more successful and sustainable software projects.
language: en
banner-image: hare-bug-header.png
---

*“Slow and steady wins the race.”* – A timeless lesson from the tale of the [Hare and the Tortoise](https://read.gov/aesop/025.html). In the fast-paced world of software development, this classic fable offers more than just a moral about humility and perseverance — it provides valuable insights into how we should handle bugs in our projects.

As decision-makers in software development, you’re constantly balancing [the four variables: resources, scope, quality, and time](https://wiki.c2.com/?FourVariables). One critical decision is whether to fix bugs immediately or to backlog them for later resolution. The blog post tries to explore why adopting a **Zero Bug Strategy** (fixing bugs as they arise) might just be the tortoise-like approach that ensures your project’s success, backed by some straightforward reasoning.

### Bugs and defects
First we need to get our diffinations alinged. Bugs are in general more a word from everyday language, while defect is more formal, but in my opinion does it covers different puropses.

A **defect** is in my opionion when you are building something that works, but disagrees with the specification. By adopting [BDD](https://cucumber.io/docs/bdd/) and/or [TDD](https://martinfowler.com/bliki/TestDrivenDevelopment.html) do we eleminate defects.

A **bug** on the other hand is when we are building something that follows specification, but dosent work. Bugs occour whenever our systems is subject of exploratory testing, showcases, users and people with malicuois intents. Functionality not covered by the specification is also considered as bugs.

In the rest of this post do we make the assumption that we have the *defects* under control, so we leave those out of the scope and focus on the *bugs*.

## The Hare’s Temptation: Backlogging Bugs

Imagine your project is like the software developing Hare from our classic fable. Fast, energetic, and eager to push features out, you might be tempted to backlog bugs—cataloging them for future fixes, you may even have a deadline you need to catch. At first glance, this seems efficient. You’re moving quickly, delivering features, and keeping the sprint velocity high. But just like the Hare’s overconfidence, this approach can lead to unexpected pitfalls.

The most common pitfall of focusing on high speed are low quality, of both requirements, code and architecture. A drive for high velocity can lead to developers cutting corners. This often results in poorly written code, skipped code reviews, insufficient testing, or incomplete documentation. Over time, this [technical debt](https://stackoverflow.blog/2023/12/27/stop-saying-technical-debt/) can grow, making the codebase fragile and more difficult to maintain.

Another risk that we prioritize only short-term development, forget to think of the long term and cut too many corners, in that case do we end up with a [big ball of mud](http://www.laputan.org/mud/mud.html#BigBallOfMud) which is expensive to maintain.

## The Tortoise’s Wisdom: Zero Bugs Strategy

On the other hand, the Tortoise represents a methodical, steady approach — akin to the Zero Bugs Strategy aka [Zero Bug Policy](https://sookocheff.com/post/process/zero-bug-policy/). The Zero Bugs Strategy is not a new thing, one of the first usage in a large scale was at Microsoft where a [Zero-defects code memo](https://sriramk.com/memos/zerodef.pdf) was send out on 20th of June 1989, the main point in this memo being that *done* should mean *done-done*.

This is also pointed out by Joel Spolsky in his [12 Steps to Better Code](https://www.joelonsoftware.com/2000/08/09/the-joel-test-12-steps-to-better-code/), see step 5: *Do you fix bugs before writing new code?*

The Zero Bugs Strategy strategy emphasizes fixing bugs immediately rather than deferring them. You might wonder, “Why spend time fixing bugs right away when we can address them later?” Let’s break it down.

## Why Fixing Bugs Immediately Makes Sense

Delaying bug fixes can lead to increased costs down the line. Imagine each bug as a small hole in a boat. Ignoring one might not sink you, but ignoring many can lead to bigger problems. The longer a bug remains unfixed, the more complex and costly it becomes to address. Fixing bugs promptly prevents these escalating costs, ensuring your project remains on budget. Additionally, unresolved bugs can affect user experience, leading to dissatisfaction and potential loss of customers. By adopting a Zero Bugs Strategy, you maintain high-quality standards, fostering trust and loyalty among your users.

> If a bug was addressed on the same day it was created, it would take an hour to fix; three weeks later, it would take *twenty-four* hours. It didn't matter if the bug was big or small, complicted or simple - it always took twenty-four times longer three weeks later.
> - *"Scrum - The art of doing twice the work in half the time", Sutherland and Sutherland (2014, p. 100)*

Moreover, backlogging bugs is one factor contributes to technical debt — the future work required to fix issues that weren’t addressed promptly. Even a litle technical debt can slow down development, making future changes more difficult and time-consuming. Addressing bugs immediately helps keep your codebase clean and manageable. Some bugs can trigger additional issues, creating a domino effect of problems. Fixing bugs as they arise helps prevent these cascade effects, ensuring that one issue doesn’t lead to many more.

Rather than fixing bugs, agile methods strive to prevent them. https://www.jamesshore.com/v2/books/aoad1/no_bugs

## The "Scrum" Conundrum: Why Bugs Don’t Belong in Story Points

Many organizations which implements Scrum, a popular agile framework, the temptation to estimate bugs using story points can be particularly strong (even though Scrum is not mentioning this). However, this practice can undermine the very foundation of your team's productivity and morale. Bugs should be viewed as indicators of quality issues rather than tasks to be quantified and added to the backlog. When bugs are estimated and assigned story points, it inadvertently signals that poor quality is acceptable and can be accounted for within the team’s velocity. This approach can create a misleading sense of progress, as the team’s velocity might appear higher while masking the underlying quality problems that need immediate attention.

Furthermore, estimating bugs often leads to inaccuracies because the time required to fix them is inherently uncertain. Unlike feature development, where requirements are clear and tasks are more predictable and the essential complexity \\((X_e)\\) is understood, bugs are mainly driven by accentendtial complexity \\((X_a)\\). Attempting to assign story points to bugs can disrupt the sprint planning process, as the team struggles to accommodate unpredictable workloads. Instead of inflating velocity metrics with unresolved issues, it makes more sense to address bugs directly. This focus not only improves product quality but also provides a more accurate reflection of the team’s true velocity, fostering a healthier and more transparent development environment.

To quoute the [The 2020 Scrum Guide](https://scrumguides.org/scrum-guide.html#product-backlog): *"The Product Backlog is an emergent, ordered list of what is needed to improve the product"*, a bug is not an improvement but a symptom of work not being *done* and should therefor not be in the backlog.
A backlog is also used to predict value to the customers, the fix of bug does not give any value to the customers only removes a pain, and start introducing bugs to the backlog will give us a misleading picture of us delivering value to the customer while we dont. Just like spitting into the wind.

Should we against all recomendations start to backlog our bugs, is it important realize that this is risky buisness, that will most likely lead to an ever growing number of bugs and increacing accentendtial complexity \\((X_a)\\). If we take these risks, should we treate the bugs as any other kind of work, meaning that there should be no difference in bugs and PBIs, and that the bugs should be priotitized by the customers like any other work in the application in the name of Agile.

### Leacy systems and zero bugs

Even on a legacy system with a long list of known bugs can we start to introduce a zero bug strategy. In order to do this should we fist set a baseline of the current number of bugs, and agree that we should never have more bugs than within our baseline. It dosent need to be accatly these bugs just this number.

After some time showning that this is possible should agree on a number by which we start to lower the number of bugs, per iteration, and at the same time move the baseline downwards.

https://blog.crisp.se/2018/02/05/yassalsundman/stop-managing-bugs-start-focusing-on-quality

## The Mathematical Backbone: Simple Logic, Big Impact

You don’t need to be a mathematician to understand the logic here. Think of it this way:

- **Immediate Fixing Costs \\((C_f)\\)**: The cost of fixing a bug right away.
- **Backlogging Costs \\((C_b + R(D))\\)**: The cost of backlogging a bug includes the initial delay \\(C_b\\) plus the rising costs over time \\(R(D)\\).

When you fix bugs immediately, your total cost is straightforward and predictable. However, when you backlog bugs, not only do you incur the initial delay, but the costs also grow over time as the bugs potentially worsen or affect other parts of the project.

Mathematically, it’s clear:
\\[ \text{Cumulative Cost of Backlogging} \geq \text{Cost of Immediate Fixing} \\]

In simple terms, fixing bugs as they come saves you more money and headaches in the long run.

## The Moral of the Story

Just like the Tortoise’s steady pace won the race, the Zero Bugs Strategy—fixing bugs immediately—ensures a smoother, more cost-effective journey for your software projects. While the Hare’s speed is admirable, it’s the consistent, reliable approach of the Tortoise that leads to sustained success.

## Conclusion

In the race of software development, don’t let the temptation to backlog bugs make you the Hare who loses focus. Embrace the Zero Bugs Strategy and adopt the Tortoise’s wisdom. By fixing bugs immediately, you enhance quality, reduce costs, and ensure your project stays on track to victory.

Remember, in the world of software, slow and steady not only wins the race—it builds a product that stands the test of time.


## P.S. The Mathematical Resonation of a Zero Bugs Strategy

For those interested in the detailed reasoning that underpins the Zero Bugs Strategy, here's a mathematical explanation demonstrating why fixing bugs immediately is more cost-effective than backlogging them.

### Assumptions and Definitions

Let’s define the following variables:

- \\( X_e \\): Essential complexity, the actuall complexity in fixing the bug.
- \\( X_a \\): Accecendential complexity, the things that makes it hard to fix the bog (bad code, other bugs, bad architecture)
- \\( C_f \\): Cost of fixing a bug.
- \\( C_b \\): Cost of **backlogging** (estimating, describing and priotizing) a bug.
- \\( FD \\): Feature delay, the delay of new feature due to bug fixing
- \\( C(FD) \\): Additional costs incurred due to the delay \( FD \), such as lost revenue. 
- \\( BD \\): The backlog delay between identifying a bug and its eventual fix, if backlogged.
- \\( C(BD) \\): Additional costs incurred due to the delay \( BD \), such as increased support, customer dissatisfaction, or further bugs.
- \\( N \\): Total number of bugs identified in the project.

### Scenario 1: Fixing Bugs Immediately

To find and fix the actuall bug involves some kind of complexity this is the essential complexity, but when we start to fix the bug will we often (especially in larger and older codes bases) experience that other tings is making it hard, sometimes almost impossible to fix the bug, this is the accendential (or unplanned) complexity.

\\[
C_f = X_e + X_a
\\]

Our hope is always that \\( X_a \\) is so close to zero as possible.

When bugs are fixed as they are found, the total cost for a given number of bugs when fixed imediatly is:

\\[
C_{\text{total\_f}} = \sum_{i=1}^{N} C_fi + C(FD_i)
\\]

This represents the straightforward cost of addressing each bug when they are identified.

<!-- Update below -->

### Scenario 2: Backlogging Bugs

When bugs are backlogged, the total cost comprises the initial backlog cost plus the additional costs incurred over time due to the delay:

\\[
C_{\text{total\_b}} = N \times C_b + \sum_{i=1}^{N} C(BD_i)
\\]

Here, \\( R(D_i) \\) represents the additional cost for each bug \\( i \\) based on its specific delay \\( D_i \\).

### Comparing the Two Scenarios

To determine which approach is more cost-effective, we compare the total costs:

\\[
C_{\text{total\_b}} < C_{\text{total\_f}}
\\]

Substituting the expressions:

\\[
N \times C_b + \sum_{i=1}^{N} R(D_i) < N \times C_f
\\]

Dividing both sides by \\( N \\):

\\[
C_b + \frac{1}{N} \sum_{i=1}^{N} R(D_i) < C_f
\\]

### Proving Non-Rentability of Backlogging

To show that backlogging is **not** cost-effective, we need to prove:

\\[
C_b + \frac{1}{N} \sum_{i=1}^{N} R(D_i) \geq C_f
\\]

**Reasoning:**

1. **Cost of Backlogging (\\( C_b \\))**: Typically, \\( C_b \\) includes overhead costs such as tracking, estimating, and prioritizing bugs. It often equals or exceeds \\( C_f \\), the cost of immediate fixing.

2. **Additional Costs (\\( R(D) \\))**: The function \\( R(D) \\) is designed to capture the escalating costs associated with delays. Commonly, \\( R(D) \\) is a **non-decreasing function** of \\( D \\), meaning costs grow as delays increase. For example, \\( R(D) = k \ln(D) \\), where \\( k \\) is a constant, models how costs increase logarithmically with delay.

Given these points:

- \\( C_b \geq C_f \\): The initial cost of backlogging is at least as much as fixing immediately.
- \\( R(D) \\) increases with \\( D \\): Any delay introduces additional costs.

Thus:

\\[
C_b + \frac{1}{N} \sum_{i=1}^{N} R(D_i) \geq C_f + \frac{1}{N} \sum_{i=1}^{N} R(D_i) > C_f
\\]

This inequality shows that the **total cost of backlogging** is always **greater than or equal to** the cost of fixing bugs immediately.

### Conclusion of the Mathematical Proof

The mathematical analysis confirms that backlogging bugs leads to higher or equal total costs compared to fixing them right away. This is primarily due to the inherent overhead of managing a backlog and the additional expenses that arise from delaying bug fixes. Therefore, adopting a **Zero Bugs Strategy**—where bugs are addressed immediately—ensures greater cost efficiency and maintains higher quality standards within your software projects.

By integrating this mathematical perspective, it's clear that the Zero Bugs Strategy not only aligns with practical development best practices but also stands on solid economic ground, making it the superior choice for successful and sustainable software development.
