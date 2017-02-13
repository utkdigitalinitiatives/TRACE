INSERT
INTO trace_workflow_namespace_role( rid, namespace) 
(SELECT rid, 'ALL'
FROM role
WHERE name LIKE 'administrator'
)