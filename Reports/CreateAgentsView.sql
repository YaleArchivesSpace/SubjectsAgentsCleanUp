use Prod20160215;
start transaction;
create temporary table agents_view
SELECT 
    NULL accession_id,
    NULL resource_id,
    ao.id archival_object_id,
    ao.repo_id repo_id,
    ap.id agent_person_id,
    NULL agent_corporate_body_id,
    NULL agent_family_id
FROM
    archival_object ao
        LEFT JOIN
    linked_agents_rlshp lar ON lar.archival_object_id = ao.id
        LEFT JOIN
    agent_person ap ON lar.agent_person_id = ap.id
WHERE
    ao.id IS NOT NULL AND ap.id IS NOT NULL 
UNION ALL SELECT 
    NULL, NULL, ao.id, ao.repo_id, NULL, ace.id, NULL
FROM
    archival_object ao
        LEFT JOIN
    linked_agents_rlshp lar ON lar.archival_object_id = ao.id
        LEFT JOIN
    agent_corporate_entity ace ON lar.agent_corporate_entity_id = ace.id
WHERE
    ao.id IS NOT NULL AND ace.id IS NOT NULL 
UNION ALL SELECT 
    NULL, NULL, ao.id, ao.repo_id, NULL, NULL, af.id
FROM
    archival_object ao
        LEFT JOIN
    linked_agents_rlshp lar ON lar.archival_object_id = ao.id
        LEFT JOIN
    agent_family af ON lar.agent_family_id = af.id
WHERE
    ao.id IS NOT NULL AND af.id IS NOT NULL 
UNION ALL SELECT 
    a.id, NULL, NULL, a.repo_id, ap.id, NULL, NULL
FROM
    accession a
        LEFT JOIN
    linked_agents_rlshp lar ON lar.accession_id = a.id
        LEFT JOIN
    agent_person ap ON lar.agent_person_id = ap.id
WHERE
    a.id IS NOT NULL AND ap.id IS NOT NULL 
UNION ALL SELECT 
    a.id, NULL, NULL, a.repo_id, NULL, ace.id, NULL
FROM
    accession a
        LEFT JOIN
    linked_agents_rlshp lar ON lar.accession_id = a.id
        LEFT JOIN
    agent_corporate_entity ace ON lar.agent_corporate_entity_id = ace.id
WHERE
    a.id IS NOT NULL AND ace.id IS NOT NULL 
UNION ALL SELECT 
    a.id, NULL, NULL, a.repo_id, NULL, NULL, af.id
FROM
    accession a
        LEFT JOIN
    linked_agents_rlshp lar ON lar.accession_id = a.id
        LEFT JOIN
    agent_family af ON lar.agent_family_id = af.id
WHERE
    a.id IS NOT NULL AND af.id IS NOT NULL 
UNION ALL SELECT 
    NULL, r.id, NULL, r.repo_id, ap.id, NULL, NULL
FROM
    resource r
        LEFT JOIN
    linked_agents_rlshp lar ON lar.resource_id = r.id
        LEFT JOIN
    agent_person ap ON lar.agent_person_id = ap.id
WHERE
    r.id IS NOT NULL AND ap.id IS NOT NULL 
UNION ALL SELECT 
    NULL, r.id, NULL, r.repo_id, NULL, ace.id, NULL
FROM
    resource r
        LEFT JOIN
    linked_agents_rlshp lar ON lar.resource_id = r.id
        LEFT JOIN
    agent_corporate_entity ace ON lar.agent_corporate_entity_id = ace.id
WHERE
    r.id IS NOT NULL AND ace.id IS NOT NULL 
UNION ALL SELECT 
    NULL, r.id, NULL, r.repo_id, NULL, NULL, af.id
FROM
    resource r
        LEFT JOIN
    linked_agents_rlshp lar ON lar.resource_id = r.id
        LEFT JOIN
    agent_family af ON lar.agent_family_id = af.id
WHERE
    r.id IS NOT NULL AND af.id IS NOT NULL;
    commit;