import QtQuick

SourcesForm {
    property string section : ""
    property var references: { "depression" :
                               [
                                    "Chris Williams, Graeme Whitfield, Written and computer-based self-help treatments for depression, British Medical Bulletin, Volume 57, Issue 1, March 2001, Pages 133–144, <a href=\"https://doi.org/10.1093/bmb/57.1.133\">doi.org/10.1093/bmb/57.1.133</a>",
                                    "Buntrock C, Ebert DD, Lehr D, et al. Effect of a Web-Based Guided Self-help Intervention for Prevention of Major Depression in Adults With Subthreshold Depression: A Randomized Clinical Trial. JAMA. 2016;315(17):1854–1863. doi:10.1001/jama.2016.4326",
                                    "Edenfield TM, Saeed SA. An update on mindfulness meditation as a self-help treatment for anxiety and depression. Psychol Res Behav Manag. 2012;5:131-141. doi:10.2147/PRBM.S34937",
                                    "Jorm AF, Christensen H, Griffiths KM, Rodgers B. Effectiveness of complementary and self-help treatments for depression. Med J Aust. 2002 May 20;176(10):S84-96. doi: 10.5694/j.1326-5377.2002.tb04508.x. PMID: 12065003.",
                                    "Gilbert, P. (2009). Overcoming Depression 3rd Edition: A self-help guide using cognitive behavioural techniques. Little, Brown Book Group.",
                                    "Amy J. Morgan, & Anthony F. Jorm (2009). Self-help strategies that are helpful for sub-threshold depression: A Delphi consensus study. Journal of Affective Disorders, 115(1), 196-200.",
                                    "Mind March (2019). Self-care. Mind, the Mental Health Charity - Help for Mental Health Problems. <a href=\"https://www.mind.org.uk/information-support/types-of-mental-health-problems/depression/self-care/\">mind.org.uk/information-support/types-of-mental-health-problems/depression/self-care/</a> ",
                               ],

                                "panic" :
                               [
                                    "Treatment | Anxiety and Depression Association of America, ADAA. (2021).  <a href=\"https://adaa.org/understanding-anxiety/panic-disorder/treatment\">adaa.org/understanding-anxiety/panic-disorder/treatment</a>",
                                    "Practical, Effective Self-Help Strategies for Mild Anxiety. (2021). American Psychiatric Association.  <a href=\"https://www.psychiatry.org/news-room/apa-blogs/apa-blog/2016/09/practical-effective-self-help-strategies-for-mild-anxiety\">psychiatry.org/news-room/apa-blogs/apa-blog/2016/09/practical-effective-self-help-strategies-for-mild-anxiety</a>",
                                    "Coping with a Disaster or Traumatic Event. (2021). Centers for Disease Control and Prevention.  <a href=\"https://www.cdc.gov/mentalhealth/tools-resources/disaster/index.htm\">cdc.gov/mentalhealth/tools-resources/disaster/index.htm</a>",
                                    "Cuijpers, Pim, and Josien Schuurmans. Self-help interventions for anxiety disorders: an overview. Current psychiatry reports 9.4 (2007): 284-290.",
                                    "NHS website. (2021, November 24). Anxiety, fear and panic. National Health Service. a href=\"https://www.nhs.uk/mental-health/feelings-symptoms-behaviours/feelings-and-symptoms/anxiety-fear-panic/\">nhs.uk/mental-health/feelings-symptoms-behaviours/feelings-and-symptoms/anxiety-fear-panic/</a>",
                               ],

                                "selfHarm" :
                               [
                                    "Mind March (2019). Self-harm. Mind, the Mental Health Charity - Tips for coping with urges to self-harm right now. <a href=\"https://www.mind.org.uk/information-support/types-of-mental-health-problems/self-harm/helping-yourself-now/\">mind.org.uk/information-support/types-of-mental-health-problems/self-harm/helping-yourself-now/</a>",
                                    "Keren Skegg (2005). Self-harm. The Lancet, 366(9495), 1471-1483.",
                                    "Pengelly, Nicky, et al. Harm minimisation after repeated self-harm: Development of a trust handbook. Psychiatric Bulletin 32.2 (2008): 60-63.",
                                    "Allen, Catherine. Helping with deliberate self-harm: Some practical guidelines. Journal of mental health 4.3 (1995): 243-250."

                               ],

                                "suicide" :
                               [
                                    "Mishara, B., and A. J. F. M. Kerkhof, eds. Suicide prevention and new technologies: evidence based practice. Springer, 2013.",
                                    "Help Yourself. (2021). National Suicide Prevention Lifeline. <a href=\"https://suicidepreventionlifeline.org/help-yourself/\">suicidepreventionlifeline.org/help-yourself/</a>",
                                    "Goldney, Robert D. Suicide prevention. Oxford University Press, 2013.",
                                    "Kostenuik, Marcia, and Mohana Ratnapalan. Approach to adolescent suicide prevention. Canadian family physician 56.8 (2010): 755."
                               ],

                                "food" :
                               [
                                    "Mind March (2019). Self-harm. Mind, the Mental Health Charity - Recovery and self-care for eating problems. <a href=\"https://www.mind.org.uk/information-support/types-of-mental-health-problems/eating-problems/recovery-self-care/\">mind.org.uk/information-support/types-of-mental-health-problems/eating-problems/recovery-self-care/</a>",
                                    "Self-care for eating disorders. (2021). The Royal Australian and New Zealand College of Psychiatrists. <a href=\"https://www.yourhealthinmind.org/mental-illnesses-disorders/eating-disorders/self-care\">.yourhealthinmind.org/mental-illnesses-disorders/eating-disorders/self-care\</a>",
                                    "Cockell, Sarah J., Shannon L. Zaitsoff, and Josie Geller. Maintaining change following eating disorder treatment. Professional Psychology: Research and Practice 35.5 (2004): 527.",
                                    "Schmidt, Ulrike, et al. The MOSAIC study-comparison of the Maudsley Model of Treatment for Adults with Anorexia Nervosa (MANTRA) with Specialist Supportive Clinical Management (SSCM) in outpatients with anorexia nervosa or eating disorder not otherwise specified, anorexia nervosa type: study protocol for a randomized controlled trial. Trials 14.1 (2013): 1-10.",
                                    "Lock, James, et al. Parental guided self‐help family based treatment for adolescents with anorexia nervosa: A feasibility study. International Journal of Eating Disorders 50.9 (2017): 1104-1108.",
                                    "Fichter, Manfred, et al. Guided self-help for binge eating/purging anorexia nervosa before inpatient treatment. Psychotherapy Research 18.5 (2008): 594-603."

                               ]
                             }

    Connections {
        target: sourceList
        Component.onCompleted: {
            var refs = references[section];
            sourceList.model = refs.length;
            for (var i = 0; i < refs.length; i++) {
                sourceList.itemAt(i).text = refs[i];
        }}
}}
