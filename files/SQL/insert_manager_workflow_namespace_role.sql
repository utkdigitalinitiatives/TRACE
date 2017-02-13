INSERT
INTO trace_workflow_namespace_role( rid, namespace) 
(SELECT rid, 'utk.ir.td'
FROM role
WHERE name LIKE 'manager-role')