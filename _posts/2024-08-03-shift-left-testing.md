---
layout: post
title: Test från vänster åt högre och tillbaka igen
passions: Test, DevOps
summary: Shift Left Testing och dess motpart Shift Right Testing representerar två strategier för att förbättra testningen av mjukvaruapplikationer. Båda metoderna bidrar till att skapa en kultur av ökat samarbete inom utvecklingsteamen.
language: sv
banner-image: test-samlad.png
---

Test inom om mjukvaruutveckling har traditionellt handlat om att man i en separat test-fas av utvecklingscykeln, efter att utvecklarna har avslutat sin kodning, kontrollera att det jobb som utvecklarna har gjort fungera som tänkt i förhållande till dom krav som är satt av produktäger eller en kravavdelning. I början på 2000-talet såg [Manifestet för Agil Systemutveckling](https://agilemanifesto.org/iso/sv/manifesto.html) dagens ljus och litet senare tog [Scrum](https://www.scrum.org/learning-series/what-is-scrum/) IT-branschen med storm (på gott och ont), sedan dess har branschen pratat om Agil Systemutveckling, men men trots detta ser processen i många bolag inte mycket annorlunda ut idag, än man ofta beskriver en vattenfallsprocess, dock med litet kortare iterationer och utan dokumentation. Först krav, sen utveckling, test och slutligen release, i var sin process.

> QA är en dyr metod för att hitta buggar. Faktum är att QA är den sämsta av alla möjliga metoder för att hitta buggar (förutom alla de andra metoden, förstås).
> 
> \- [Larry Smith](https://www.drdobbs.com/shift-left-testing/184404768)

En utvecklingsprocess vart testerna jobbar på detta viset, i en isolerat test-fas, kunna vi kalla **"test efter utveckling"**, i denna test-fas utför testarna oftast som en kombination av manuella och automatiserade-tester, för att identifiera buggar och kvalitetsproblem i den färdiga produkten. Testerna fokuserar alltså på att verifiera funktionalitet i förhållande till krav, säkerställa att programvaran fungerar som avsett och att befintlig funktionalitet inte har skadas under utvecklingen. Fel som upptäcks i test-fasen bollas tillbaka till utvecklings-fasen (ibland kallat [vattenfall med feedback](https://www.researchgate.net/figure/Waterfall-model-with-Royces-iterative-feedback-When-referring-to-the-waterfall-model-in_fig1_220631422)), och utvecklarna måste sen åtgärda felen vilket kan leda till förseningar i projektet.

 ![Graf som visar test efter utveckling](/img/posts/test-fokus_testefterutveckling.png)

Riskerna med "test efter utveckling"-metodiken inkluderar:

1. **Ökad kostnad och förseningar i projektet**: Om buggar upptäcks sent i utvecklingscykeln måste utvecklarna avsätta tid för att åtgärda problemen, vilket kan leda till förseningar i release av produkten. Att åtgärda fel efter att utvecklingen är klar kan bli [kostsamt](https://www.functionize.com/blog/the-cost-of-finding-bugs-later-in-the-sdlc), särskilt om problemen är komplexa eller kräver omfattande förändringar.
2. **Test-fasen bliver en flaskhals:** När tester genomförs i slutet av utvecklingscykeln kan de [ofta bli en flaskhals](https://shows.acast.com/the-quality-podcast/episodes/ep-7-why-is-qa-testing-often-a-bottleneck) i hela processen. Om testarna identifierar stora mängder buggar eller problem, kan deras arbetsbelastning öka dramatiskt.
3. **Stort avstånd mellan testare och kravställare:** När dessa två grupper arbetar isolerade från varandra kan bristande kommunikation och missförstånd kring kravspecifikationerna leda till att testerna inte alltid speglar användarnas verkliga beteende.
4. **Brist­fäll­ig överlämning emellan faser:** Varje fas blir en silo och emellan varje silo måste där vara en överlämning (muntlig eller på skrift), den stora risk är här att kommunikationen inte är tillräcklig bra och att förståelsen för vad som ska testas och hur det ska göras inte överföras effektivt, vilket kan leda till [en rad problem](http://www.diva-portal.org/smash/get/diva2:504444/FULLTEXT01.pdf).
5. **Teknisk skuld**: Om testerna inte ser systemet i en större helhet kan det kan det leda till att [teknisk skuld](https://www.testdevlab.com/blog/understanding-technical-debt-from-a-quality-assurance-perspective) byggs upp, vilket gör framtida underhåll och utveckling svårare. [Dålig test teckning](https://www.softwaretestinghelp.com/technical-debt-and-qa/) är också en sorts teknisk skuld.
6. **Otestbart system**: Om systemet har utvecklats [utan att ta hänsyn till testbarhet](https://medium.com/slalom-build/on-untestable-software-6e64c34bfbad) från början kan det sakna nödvändiga gränssnitt, data, loggning eller dokumentation som krävs för effektiv testning. 

Ett sätt att hantera dissa risker är att genom att låta testerna i alla faser innan test-fasen i stället för att vänta på att implementations- och bygg-faserna är klara, att göra detta kallas Shift Left Testing (förflytta åt vänster).

## Vad är Shift Left Testing?

När mjukvaruutvecklingsprocessen betraktas som en sekventiell process från vänster till höger, kan det att utföra tester tidigare ses som att "förflytta åt vänster", på engelska Shift Left Testing och kan sporas [tillbaka till 2001](https://www.drdobbs.com/shift-left-testing/184404768). Begreppet kan självklart ses som en missvisande term, eftersom vi inte bara "flyttar" testar utan istället utför tester i alla faser av processen (och påverkar med ett test tänk), så man kan säga att det i högre utsträck handlar om att utöka testarna fokus till nu att täcka mer av vänstra sida, tanken är att genom vara med tidigt i process kan testarna vara med och skapa en bättre förutsättning för högre kvalitet och system som är enklare att testa. Detta spara tid i test-fasen, som sen får ett mindra fokus. 

![Graf som visar test efter utveckling och shift left](/img/posts/test-fokus_shitleft.png)

Ibland känns det som att inte mycket har hänt sen manifestet för Agil systemutveckling kom fram, men att utöka testerna fokus och därigenom bryta ner silos handlar om det första av dom fyra agila-värden: "Individer och interaktioner framför processer och verktyg". **Shift Left Testing** främjar samarbete och kommunikation mellan teammedlemmar, och ökar chansen till att bli "riktigt" agila.

I grunden handlar [Shift Left Testing](https://testfully.io/blog/shift-left-testing/) om kontinuerligt engagemang och återkoppling.

Genom att kombinera utveckling och kvalitetskontroll tidigare och djupare i en projektplan kan man utöka sitt testprogram och minska behovet av arbetskraft och utrustning senare i processen. Att få med testerna med redan i kravskrivningen minskar risken för otestbara system och ökar chansen för ökad automatisering av testerna, oftast genom att testerna öppet ställer frågan: "Hur ska vi kunna verifiera att denna funktionalitet fungera som tänkt?" och tillsammans med utvecklarna skåpar förutsättningarna för automatiska testar och enklare test rutiner.  

Fördelarna med att omfamna Shift Left Testing kan vara många, både förtestarna själva men för organisationen i stort:

- **Högre mjukvarukvalitet**: Proaktiva teststrategier ger en förbättrad produktkvalitet.
- **Tidigare defektdetektering**: Fel hittas tidigare och fler fel hittas, speciellt fel som rör flödet, som annars först upphittas av användarna när produkten är i produktion.
- **Förbättrad samarbete**: Genom att bryta ner silos mellan utvecklings- och testteam förbättras kommunikationen och feedbacklooparna. Teamet blir helt enkelt mer agilt.
- **Kompetensutveckling**: Testare och systemutvecklare bör sträva efter att lära sig nya färdigheter som gör dem mångsidiga, eller T-formade.
- **Effektivare resursanvändning**: Genom att identifiera och åtgärda problem tidigt sparar man tid och resurser. Eftersom man tar bort dödtiden som ofta uppstår är testerna väntar på utvecklarna och andra hållet också.

## TDD och BDD till undsättning

Att komma på gång med Shift Left Testing är inte helt enkelt, såklart kan test bara börja att dela i krav och utvecklarnas vardag och ställa jobbiga frågor, om dom har tid, men det bästa är om man har någon typ av process till att understötta detta, och här kan metoderna TDD och BDD vara två bra förslag.

[TDD](https://martinfowler.com/bliki/TestDrivenDevelopment.html) ligger mycket på systemutvecklarnas bord, och handlar om att man skriver tester innan man skriver själva koden, vilket gör att utvecklaren vet att koden alltid kommer att fungera så som det var tanken och att dom inte gör sönder något. Testerna skapar också ett internt kontrakt för hur olika delar av koden ska fungera, dissa testar är oftast mycket små, vilket gör dom snabba att utveckla och köra.

[BDD](https://cucumber.io/docs/bdd/) är åt andra sidan en affärsorienterat utvecklingsprocess som uppmuntra samarbete på tvärs av roller för att skapa en gemensam förståelse för det problem som ska lösas, inklusive intressenter och affärsanalytiker, är involverade i att definiera systemets beteende. Inom BDD jobbar man mer termen [The Three Amigos](https://cucumber.io/docs/bdd/who-does-what/), som är en term för tre roller som alltid måste vara med när krav diskuteras. Dom tre rollar är: Produkt Ägaren, Testaren och Systemutvecklaren.

## Förändrad roll för mjukvarutestare

I Shift Left-kulturen förändras testarnas roll i grunden. De går från att vara den sista utposten för kvalitetskontroll till att bli en integrerad del av kravställning och implementering. Testarna samarbetar nu nära med utvecklarna, vilket främjar bättre samarbete och snabbare feedback. 

Detta skifte kräver att testarna anpassar sig och utvecklar nya färdigheter, såsom testautomatisering och förståelse för kontinuerlig integration. De behöver även få insikt i hur utvecklare arbetar. 

Samtidigt måste systemutvecklarna vänja sig vid att se testarna som en resurs som kan stödja dem i deras arbete. Testerna bidrar till att säkerställa en adekvat testtäckning och ger råd om den bästa vägen framåt för testerna.

## "Shift left"s (onda) tvilling

Precis som andra superhjältar har även Shift Left Testing en (ond) tvilling, kallad "[Shift Right Testing](https://www.stickyminds.com/article/testing-unexpected-shift-right-devops-testing)". Fokus här ligger på att flytta testning och utvärdering till senare faser av utvecklingscykeln, efter att produkten har distribuerats till användarna.

![Graf som visar shift left och shift right](/img/posts/test-fokus_shitright.png)

Målsättningen att testa i produktionsmiljön för saker som inte låter sig testa fullgott i utvecklings och testmiljöer, så som prestanda och motståndskraft. Något annat som finns i ett produktionsmiljö som inte finns i riktiga användare, och genom att involvera användarna mer aktivt med användartester och [A/B-tester](https://devopedia.org/a-b-testing), blir det möjligt för att anpassa och optimera produkten baserat på verklig användardata. Denna strategi bidrar till en mer dynamisk och användarcentrerad utvecklingsprocess, och går igen hand i hand med dom agila värden: "Kundsamarbete framför kontraktsförhandling".

En annan tillgång till Shift Right Testing är [Chaos Engineering](https://devopedia.org/chaos-engineering), detta handlar om att medvetet introducera fel och osäkerheter i ett system för att testa dess robusthet och återhämtningsförmåga. Detta gör det möjligt för teamet att förstå hur systemet reagerar under verkliga förhållanden. Genom att simulera oväntade händelser i produktionsmiljön kan teamet identifiera svagheter och lära sig hur man snabbt kan åtgärda problem innan de påverkar användarna. Samtidigt ger det även värdefulla insikter om hur man kan optimera systemarkitekturen för framtida behov.

Genom att genomföra tester och analyser i produktionsmiljön kan team identifiera användarproblem, prestandaflaskhalsar och andra kritiska buggar som kanske inte framkommit under tidigare testfaser. 

## Sammanfattning

"Shift Left Testing" och dess motpart "Shift Right Testing" representerar två strategier för att förbättra testningen av mjukvaruapplikationer. Båda metoderna bidrar till att skapa en kultur av ökat samarbete inom utvecklingsteamen.

Medan "Shift Left" fokuserar på att förflytta testning och kvalitetskontroll tidigare i utvecklingscykeln för att minska kostnader och förbättra effektivitet, med fokus på systems funktionalitet. Handlar "Shift Right" om att testa i produktionsmiljön för att identifiera och åtgärda problem som bara uppstår under verkliga användarförhållanden. 

Båda metoderna har sina fördelar och nackdelar, men gemensamt är att de syftar till att förbättra programvarans kvalitet och användarupplevelse. Genom att kombinera dessa metoder kan utvecklingsteam uppnå en mer balanserad och effektiv teststrategi som möter både tekniska och affärsmässiga mål.

Det är viktigt att vara medveten om att detta också innebär nya krav på kompetenser och företagets samarbetskultur innan man går vidare.
