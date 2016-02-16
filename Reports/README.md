Reports
=======
Information from ArchivesSpace to assist in Yale cleanup efforts.  
Some queries require crosstab reports -- Excel will probably be the best tool for these.

Agent Queries
--------------
* What agents are associated with each agent type?
* Among agents of each type, what sources are recorded? What rules?
* How many records are published?
* Which records are published?
* Which records are unpublished?
* How many records have multiple Name Forms?
* Which records have multiple Name Forms?
* How many records have at least one Name Form with a URI in Authority ID?
* Which records have a name form with a URI in Authority ID?
* How many name forms have associated dates of name use? If > 0 , which ones?
* How many name forms have data in name fields other than primary part of name? If > 0 , which ones?
* Which agents are only linked to records from a single repository? Run this for each repository.
* Which agents are only linked to BRBL accessions?
* How many records have associated dates of existence?
* Which records have associated dates of existence?
* Which records have associated Contact Details other than Contact Name?
* How many records have associated Notes? If > 0 , which ones?
* How many records have associated Related Agents? If > 0 , which ones?
* How many records have associated External Documents? If > 0 , which ones?
* How many records have associated Rights Statements? If > 0 , which ones?

Master Field List for Agents
----------------------------
* URL,
* person,
* sort name,
* primary name,
* name title,
* name prefix,
* rest of name,
* name suffix,
* name number,
* name dates,
* name qualifier,
* date expression,
* date begin,
* date end,
* salutation,
* contact name,
* address 1,
* address 2,
* address 3,
* city,
* region,
* country,
* post code,
* email,
* email signature,
* note,
* authority id,
* source,
* rules,
* note,
* externalDocTitle,
* externalDocLocation,
* agent id,
* publish,
* related,
* relatedTo,
* rightsStatement

Subject Queries
----------------
* What subjects are associated with each subject type?
* Among subjects of each type, what sources are recorded?
* How many records have a URI in Authority ID? If more than zero, which records?
* What subject types have no records?
* How many subjects have subdivisions?
* Which subjects have subdivisions?
* Which subjects have no subdivisions?
* Do any subjects have associated external documents?
* How many subjects are not linked to any records? If so, which ones?
* Which subjects are a string match for each subvision (normalizing for the presence or absence of a trailing period)?
* Among string matches, which share the same source value?
* Which subjects are only linked to records from a single repository. Run this for each repository.
* Which subject types in ArchivesSpace are not found in our data?
