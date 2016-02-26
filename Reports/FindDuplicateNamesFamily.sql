SELECT 
    CONCAT('https://archivesspace.library.yale.edu/agents/agent_family/',
            agent_family_id) URL,
    COUNT(agent_family_id) 'number of names'
FROM
    all_agents
GROUP BY agent_family_id
HAVING COUNT(agent_family_id) > 1