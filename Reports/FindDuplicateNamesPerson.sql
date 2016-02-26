SELECT 
    CONCAT('https://archivesspace.library.yale.edu/agents/agent_person/',
            agent_person_id) record,
    COUNT(agent_person_id) 'number of names'
FROM
    all_agents
GROUP BY agent_person_id
HAVING COUNT(agent_person_id) > 1