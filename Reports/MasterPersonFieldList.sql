use yale_prod;
SELECT 
    CONCAT('https://archivesspace.library.yale.edu/agents/agent_person/',
            ap.id) URL,
    'person',
    np.sort_name 'sort name',
    np.primary_name 'primary name',
    np.title 'name title',
    np.prefix 'name prefix',
    np.rest_of_name 'rest of name',
    np.suffix 'name suffix',
    np.number 'name number',
    np.dates 'name dates',
    np.qualifier 'name qualifier',
    date.expression 'date expression',
    date.begin 'date begin',
    date.end 'date end',
    salutation.value 'salutation',
    ac.name 'contact name',
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
    nai.authority_id 'authority id',
    source.value source,
    rules.value rules,
    CAST(note.notes AS CHAR (10000) CHARACTER SET UTF8) note,
    ed.title externalDocTitle,
    ed.location externalDocLocation,
	ap.id 'agent id',
    ap.publish,
    related.id related,
    relatedto.id relatedTo,
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