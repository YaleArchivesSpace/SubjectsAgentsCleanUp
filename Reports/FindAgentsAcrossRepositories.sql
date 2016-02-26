start transaction;
drop  table if exists agents_across_repositories;
CREATE TABLE agents_across_repositories (
    INDEX (agent_person_id , agent_family_id , agent_corporate_body_id)
) SELECT * FROM
    agents_view
WHERE
    agent_person_id IN (SELECT 
            T1.agent_person_id
        FROM
            agents_view T1
                INNER JOIN
            agents_view T2 ON T1.agent_person_id = T2.agent_person_id
        WHERE
            T1.repo_id <> T2.repo_id) 
UNION ALL SELECT 
    *
FROM
    agents_view
WHERE
    agent_family_id IN (SELECT 
            T1.agent_family_id
        FROM
            agents_view T1
                INNER JOIN
            agents_view T2 ON T1.agent_family_id = T2.agent_family_id
        WHERE
            T1.repo_id <> T2.repo_id) 
UNION ALL SELECT 
    *
FROM
    agents_view
WHERE
    agent_corporate_body_id IN (SELECT 
            T1.agent_corporate_body_id
        FROM
            agents_view T1
                INNER JOIN
            agents_view T2 ON T1.agent_corporate_body_id = T2.agent_corporate_body_id
        WHERE
            T1.repo_id <> T2.repo_id);
            commit;