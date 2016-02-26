use Prod20160215;
start transaction;
drop temporary table if exists all_agents;
create table all_agents
(index(name_person_id, agent_person_id, name_family_id, agent_family_id,name_corporate_entity_id, agent_corporate_entity_id))
SELECT 
    CONCAT('https://archivesspace.library.yale.edu/agents/agent_person/',
            ap.id) URL,
    'person' AS 'agent_type',
    np.sort_name 'sort_name',
    np.primary_name 'primary_name',
    NULL 'subordinate_name_1(ce)',
    NULL 'subordinate_name_2(ce)',
    np.title 'name_title',
    np.prefix 'name_prefix',
    np.rest_of_name 'rest_of_name',
    np.suffix 'name_suffix',
    np.number 'name_number',
    np.dates 'name_dates',
    np.qualifier 'name_qualifier',
    date.expression 'date_expression',
    date.begin 'date_begin',
    date.end 'date_end',
    salutation.value 'salutation',
    ac.name 'contact_name',
    ac.address_1,
    ac.address_2,
    ac.address_3,
    ac.city,
    ac.region,
    ac.country,
    ac.post_code,
    ac.email,
    ac.email_signature,
    ac.note 'contact_note',
    nai.authority_id 'authority_id',
    source.value source,
    rules.value rules,
    CAST(note.notes AS CHAR (10000) CHARACTER SET UTF8) note,
    ed.title external_doc_title,
    ed.location external_loc_location,
    np.id name_person_id,
    ap.id agent_person_id,
    NULL name_family_id,
    NULL agent_family_id,
    NULL name_corporate_entity_id,
    NULL agent_corporate_entity_id,
    ap.publish,
    related.id related,
    relatedto.id related_to,
    rs.id rightsStatement
FROM
    name_person np
        LEFT JOIN
    name_authority_id nai ON np.id = nai.name_person_id
        LEFT JOIN
    enumeration_value source ON source.id = np.source_id
        LEFT JOIN
    enumeration_value rules ON rules.id = np.rules_id
        LEFT JOIN
    agent_person ap ON ap.id = np.agent_person_id
        LEFT JOIN
    date ON date.agent_person_id = ap.id
        LEFT JOIN
    agent_contact ac ON ac.agent_person_id = ap.id
        LEFT JOIN
    enumeration_value salutation ON ac.salutation_id = salutation.id
        LEFT JOIN
    note ON note.agent_person_id = ap.id
        LEFT JOIN
    related_agents_rlshp related ON related.agent_person_id_0 = ap.id
        LEFT JOIN
    related_agents_rlshp relatedto ON relatedto.agent_person_id_1 = ap.id
        LEFT JOIN
    external_document ed ON ed.agent_person_id = ap.id
        LEFT JOIN
    rights_statement rs ON rs.agent_person_id = ap.id 
UNION ALL SELECT 
    CONCAT('https://archivesspace.library.yale.edu/agents/agent_family/',
            af.id) URL,
    'family',
    nf.sort_name ,
    nf.family_name ,
    NULL,
    NULL,
    NULL,
    nf.prefix ,
    NULL,
    NULL,
    NULL,
    nf.dates ,
    nf.qualifier ,
    date.expression ,
    date.begin,
    date.end ,
    salutation.value ,
    ac.name ,
    ac.address_1,
    ac.address_2,
    ac.address_3,
    ac.city,
    ac.region,
    ac.country,
    ac.post_code,
    ac.email,
    ac.email_signature,
    ac.note,
    nai.authority_id ,
    source.value source,
    rules.value rules,
    CAST(note.notes AS CHAR (10000) CHARACTER SET UTF8) note,
    ed.title externalDocTitle,
    ed.location externalDocLocation,
    null,
    null,
    nf.id,
    af.id ,
    null,
    null,
    af.publish,
    related.id related,
    relatedto.id relatedTo,
    rs.id rightsStatement
FROM
    name_family nf
        LEFT JOIN
    name_authority_id nai ON nf.id = nai.name_family_id
        LEFT JOIN
    enumeration_value source ON source.id = nf.source_id
        LEFT JOIN
    enumeration_value rules ON rules.id = nf.rules_id
        LEFT JOIN
    agent_family af ON af.id = nf.agent_family_id
        LEFT JOIN
    date ON date.agent_family_id = af.id
        LEFT JOIN
    agent_contact ac ON ac.agent_family_id = af.id
        LEFT JOIN
    enumeration_value salutation ON ac.salutation_id = salutation.id
        LEFT JOIN
    note ON note.agent_family_id = af.id
        LEFT JOIN
    related_agents_rlshp related ON related.agent_family_id_0 = af.id
        LEFT JOIN
    related_agents_rlshp relatedto ON relatedto.agent_family_id_1 = af.id
        LEFT JOIN
    external_document ed ON ed.agent_family_id = af.id
        LEFT JOIN
    rights_statement rs ON rs.agent_family_id = af.id 
UNION ALL SELECT 
    CONCAT('https://archivesspace.library.yale.edu/agents/agent_corporate_entity/',
            ace.id) URL,
    'corporate body',
    nce.sort_name ,
    nce.primary_name ,
    nce.subordinate_name_1 ,
    nce.subordinate_name_2 ,
    NULL,
    NULL,
    NULL,
    NULL,
    nce.number ,
    nce.dates ,
    nce.qualifier ,
    date.expression ,
    date.begin ,
    date.end ,
    salutation.value ,
    ac.name ,
    ac.address_1,
    ac.address_2,
    ac.address_3,
    ac.city,
    ac.region,
    ac.country,
    ac.post_code,
    ac.email,
    ac.email_signature,
    ac.note,
    nai.authority_id ,
    source.value source,
    rules.value rules,
    CAST(note.notes AS CHAR (10000) CHARACTER SET UTF8) note,
    ed.title externalDocTitle,
    ed.location externalDocLocation,
    null,
    null,
    null,
    null,
    nce.id,
    ace.id ,
    ace.publish,
    related.id related,
    relatedto.id relatedTo,
    rs.id rightsStatement
FROM
    name_corporate_entity nce
        LEFT JOIN
    name_authority_id nai ON nce.id = nai.name_corporate_entity_id
        LEFT JOIN
    enumeration_value source ON source.id = nce.source_id
        LEFT JOIN
    enumeration_value rules ON rules.id = nce.rules_id
        LEFT JOIN
    agent_corporate_entity ace ON ace.id = nce.agent_corporate_entity_id
        LEFT JOIN
    date ON date.agent_corporate_entity_id = ace.id
        LEFT JOIN
    agent_contact ac ON ac.agent_corporate_entity_id = ace.id
        LEFT JOIN
    enumeration_value salutation ON ac.salutation_id = salutation.id
        LEFT JOIN
    note ON note.agent_corporate_entity_id = ace.id
        LEFT JOIN
    related_agents_rlshp related ON related.agent_corporate_entity_id_0 = ace.id
        LEFT JOIN
    related_agents_rlshp relatedto ON relatedto.agent_corporate_entity_id_1 = ace.id
        LEFT JOIN
    external_document ed ON ed.agent_corporate_entity_id = ace.id
        LEFT JOIN
    rights_statement rs ON rs.agent_corporate_entity_id = ace.id;
    commit;