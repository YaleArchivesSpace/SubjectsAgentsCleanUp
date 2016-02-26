SELECT 
    CONCAT('https://archivesspace.library.yale.edu/agents/agent_corporate_entity/',
            agent_corporate_entity_id) URL,
    COUNT(agent_corporate_entity_id) 'number of names'
FROM
    all_agents
GROUP BY agent_corporate_entity_id
HAVING COUNT(agent_corporate_entity_id) > 1