INSERT INTO `drupal7`.`trace_workflow_namespace_policies` 
(`namespace`, `submitted_policy`, `accepted_policy`, `published_policy`) 
VALUES ('utk.ir.td', 
'<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<Policy xmlns=\"urn:oasis:names:tc:xacml:1.0:policy\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" PolicyId=\"islandora-xacml-editor-v1\" RuleCombiningAlgId=\"urn:oasis:names:tc:xacml:1.0:rule-combining-algorithm:first-applicable\">
    <Target>
        <Subjects>
            <AnySubject/>
        </Subjects>
        <Resources>
            <AnyResource/>
        </Resources>
        <Actions>
            <AnyAction/>
        </Actions>
    </Target>
    <Rule RuleId=\"permit-owner-submitted\" Effect=\"Permit\">
        <Target>
            <Subjects>
                <AnySubject/>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-addDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-addDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-adminPing</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-compareDatastreamChecksum</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-describeRepository</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-dsstate</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>    
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-findObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminatorHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminators</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-getNextPid</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProfile</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProperties</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectXML</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-ingest</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listMethods</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInFieldSearchResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  	
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInResourceIndexResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                	
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDatastreamByReference</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action> 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDatastreamByValue</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                       
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyObject</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-reloadPolicies</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-resolveDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-riFindObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                   
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-serverStatus</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDatastreamState</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDatastreamVersionable</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDisseminatorState</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action> 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-upload</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action> 
            </Actions>
        </Target>
        <Condition FunctionId=\"urn:oasis:names:tc:xacml:1.0:function:and\">
            <Apply FunctionId=\"urn:oasis:names:tc:xacml:1.0:function:string-at-least-one-member-of\">
                <SubjectAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:subject:loginId\" MustBePresent=\"false\" DataType=\"http://www.w3.org/2001/XMLSchema#string\" />
                <ResourceAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:resource:object:owner\" MustBePresent=\"false\" DataType=\"http://www.w3.org/2001/XMLSchema#string\" />
            </Apply>
        </Condition> 
    </Rule>
    <Rule RuleId=\"permit-manager-submitted\" Effect=\"Permit\">
        <Target>
            <Subjects>
                <Subject>
                    <SubjectMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">manager-role</AttributeValue>
                        <SubjectAttributeDesignator AttributeId=\"fedoraRole\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </SubjectMatch>
                </Subject>
                <Subject>
                    <SubjectMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">thesis_manager_role</AttributeValue>
                        <SubjectAttributeDesignator AttributeId=\"fedoraRole\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </SubjectMatch>
                </Subject>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-addDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-addDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-adminPing</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-compareDatastreamChecksum</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-describeRepository</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-dsstate</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-findObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminatorHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminators</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-getNextPid</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProfile</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProperties</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectXML</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listMethods</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInFieldSearchResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  	
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInResourceIndexResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                	
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDatastreamByReference</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action> 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDatastreamByValue</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                       
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyObject</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-reloadPolicies</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-resolveDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-riFindObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                   
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-serverStatus</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDatastreamState</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDatastreamVersionable</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDisseminatorState</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action> 
            </Actions>
        </Target>
    </Rule>
    <Rule RuleId=\"permit-admin-submitted\" Effect=\"Permit\">
        <Target>
            <Subjects>
                <Subject>
                    <SubjectMatch
                        MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">fedoraAdmin</AttributeValue>
                        <SubjectAttributeDesignator DataType=\"http://www.w3.org/2001/XMLSchema#string\" MustBePresent=\"false\" AttributeId=\"urn:fedora:names:fedora:2.1:subject:loginId\"/>
                    </SubjectMatch>
                </Subject>
                <Subject>
                    <SubjectMatch
                        MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">admin</AttributeValue>
                        <SubjectAttributeDesignator DataType=\"http://www.w3.org/2001/XMLSchema#string\" MustBePresent=\"false\" AttributeId=\"urn:fedora:names:fedora:2.1:subject:loginId\"/>
                    </SubjectMatch>
                </Subject>
                <Subject>
                    <SubjectMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">administrator</AttributeValue>
                        <SubjectAttributeDesignator AttributeId=\"fedoraRole\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </SubjectMatch>
                </Subject>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <AnyAction/>
            </Actions>
        </Target>
    </Rule>
    <Rule RuleId=\"deny-everything-else-submitted\" Effect=\"Deny\">
        <Target>
            <Subjects>
                <AnySubject/>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <AnyAction/>
            </Actions>
        </Target>
    </Rule>
</Policy>
', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<Policy xmlns=\"urn:oasis:names:tc:xacml:1.0:policy\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" PolicyId=\"islandora-xacml-editor-v1\" RuleCombiningAlgId=\"urn:oasis:names:tc:xacml:1.0:rule-combining-algorithm:first-applicable\">
    <Target>
        <Subjects>
            <AnySubject/>
        </Subjects>
        <Resources>
            <AnyResource/>
        </Resources>
        <Actions>
            <AnyAction/>
        </Actions>
    </Target>
    <Rule RuleId=\"permit-owner-accepted\" Effect=\"Permit\">
        <Target>
            <Subjects>
                <AnySubject/>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-adminPing</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-compareDatastreamChecksum</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-describeRepository</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-dsstate</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-findObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminatorHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminators</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProfile</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProperties</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectXML</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listMethods</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInFieldSearchResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  	
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInResourceIndexResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-reloadPolicies</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-resolveDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-riFindObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                   
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-serverStatus</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                                                                     	                                                              
            </Actions>
        </Target>
        <Condition FunctionId=\"urn:oasis:names:tc:xacml:1.0:function:and\">
            <Apply FunctionId=\"urn:oasis:names:tc:xacml:1.0:function:string-at-least-one-member-of\">
                <SubjectAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:subject:loginId\" MustBePresent=\"false\" DataType=\"http://www.w3.org/2001/XMLSchema#string\" />
                <ResourceAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:resource:object:owner\" MustBePresent=\"false\" DataType=\"http://www.w3.org/2001/XMLSchema#string\" />
            </Apply>
        </Condition> 
    </Rule>
    <Rule RuleId=\"permit-manager-accepted\" Effect=\"Permit\">
        <Target>
            <Subjects>
                <Subject>
                    <SubjectMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">manager-role</AttributeValue>
                        <SubjectAttributeDesignator AttributeId=\"fedoraRole\" MustBePresent=\"false\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </SubjectMatch>
                </Subject>
                <Subject>
                    <SubjectMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">thesis_manager_role</AttributeValue>
                        <SubjectAttributeDesignator AttributeId=\"fedoraRole\" MustBePresent=\"false\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </SubjectMatch>
                </Subject>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-addDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-addDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-adminPing</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-compareDatastreamChecksum</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-describeRepository</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-dsstate</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-findObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminatorHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminators</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProfile</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProperties</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectXML</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listMethods</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInFieldSearchResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  	
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInResourceIndexResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                	
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDatastreamByReference</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action> 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDatastreamByValue</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                       
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyObject</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-reloadPolicies</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-resolveDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-riFindObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                   
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-serverStatus</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDatastreamState</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDatastreamVersionable</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDisseminatorState</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action> 
            </Actions>
        </Target>
    </Rule>
    <Rule RuleId=\"permit-admin-accepted\" Effect=\"Permit\">
        <Target>
            <Subjects>
                <Subject>
                    <SubjectMatch
                        MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">fedoraAdmin</AttributeValue>
                        <SubjectAttributeDesignator DataType=\"http://www.w3.org/2001/XMLSchema#string\" MustBePresent=\"false\" AttributeId=\"urn:fedora:names:fedora:2.1:subject:loginId\"/>
                    </SubjectMatch>
                </Subject>
                <Subject>
                    <SubjectMatch
                        MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">admin</AttributeValue>
                        <SubjectAttributeDesignator DataType=\"http://www.w3.org/2001/XMLSchema#string\" MustBePresent=\"false\" AttributeId=\"urn:fedora:names:fedora:2.1:subject:loginId\"/>
                    </SubjectMatch>
                </Subject>
                <Subject>
                    <SubjectMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">administrator</AttributeValue>
                        <SubjectAttributeDesignator AttributeId=\"fedoraRole\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </SubjectMatch>
                </Subject>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <AnyAction/>
            </Actions>
        </Target>
    </Rule>
    <Rule RuleId=\"deny-everything-else-accepted\" Effect=\"Deny\">
        <Target>
            <Subjects>
                <AnySubject/>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <AnyAction/>
            </Actions>
        </Target>
    </Rule>
</Policy>
', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<Policy xmlns=\"urn:oasis:names:tc:xacml:1.0:policy\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" PolicyId=\"islandora-xacml-editor-v1\" RuleCombiningAlgId=\"urn:oasis:names:tc:xacml:1.0:rule-combining-algorithm:first-applicable\">
    <Target>
        <Subjects>
            <AnySubject/>
        </Subjects>
        <Resources>
            <AnyResource/>
        </Resources>
        <Actions>
            <AnyAction/>
        </Actions>
    </Target>
    <Rule RuleId=\"permit-public-published\" Effect=\"Permit\">
        <Target>
            <Subjects>
                <AnySubject/>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>              
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-adminPing</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-compareDatastreamChecksum</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-describeRepository</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-dsstate</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-findObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminators</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProfile</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProperties</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectXML</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listMethods</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInFieldSearchResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  	
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInResourceIndexResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-oai</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-resolveDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-riFindObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                   
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-serverStatus</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
			</Actions>
        </Target>
    </Rule>
    <Rule RuleId=\"permit-manager-published\" Effect=\"Permit\">
        <Target>
            <Subjects>
                <Subject>
                    <SubjectMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">manager-role</AttributeValue>
                        <SubjectAttributeDesignator AttributeId=\"fedoraRole\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </SubjectMatch>
                </Subject>
                <Subject>
                    <SubjectMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">thesis_manager_role</AttributeValue>
                        <SubjectAttributeDesignator AttributeId=\"fedoraRole\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </SubjectMatch>
                </Subject>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-addDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-addDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-adminPing</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-compareDatastreamChecksum</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-describeRepository</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-dsstate</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-findObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreamHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDissemination</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminatorHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getDisseminators</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-getNextPid</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectHistory</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProfile</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectProperties</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-getObjectXML</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listDatastreams</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
                        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">urn:fedora:names:fedora:2.1:action:id-listMethods</AttributeValue>
                        <ActionAttributeDesignator AttributeId="urn:fedora:names:fedora:2.1:action:id" DataType="http://www.w3.org/2001/XMLSchema#string"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInFieldSearchResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  	
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-listObjectInResourceIndexResults</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                	
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDatastreamByReference</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action> 
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDatastreamByValue</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                       
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyDisseminator</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-modifyObject</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-reloadPolicies</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-resolveDatastream</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-riFindObjects</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                   
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-serverStatus</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>                  
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDatastreamState</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDatastreamVersionable</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action>
                <Action>
                    <ActionMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">urn:fedora:names:fedora:2.1:action:id-setDisseminatorState</AttributeValue>
                        <ActionAttributeDesignator AttributeId=\"urn:fedora:names:fedora:2.1:action:id\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </ActionMatch>
                </Action> 
            </Actions>
        </Target>
    </Rule>
    <Rule RuleId=\"permit-admin-published\" Effect=\"Permit\">
        <Target>
            <Subjects>
                <Subject>
                    <SubjectMatch
                        MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">fedoraAdmin</AttributeValue>
                        <SubjectAttributeDesignator DataType=\"http://www.w3.org/2001/XMLSchema#string\" MustBePresent=\"false\" AttributeId=\"urn:fedora:names:fedora:2.1:subject:loginId\"/>
                    </SubjectMatch>
                </Subject>
                <Subject>
                    <SubjectMatch
                        MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">admin</AttributeValue>
                        <SubjectAttributeDesignator DataType=\"http://www.w3.org/2001/XMLSchema#string\" MustBePresent=\"false\" AttributeId=\"urn:fedora:names:fedora:2.1:subject:loginId\"/>
                    </SubjectMatch>
                </Subject>
                <Subject>
                    <SubjectMatch MatchId=\"urn:oasis:names:tc:xacml:1.0:function:string-equal\">
                        <AttributeValue DataType=\"http://www.w3.org/2001/XMLSchema#string\">administrator</AttributeValue>
                        <SubjectAttributeDesignator AttributeId=\"fedoraRole\" MustBePresent=\"false\" DataType=\"http://www.w3.org/2001/XMLSchema#string\"/>
                    </SubjectMatch>
                </Subject>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <AnyAction/>
            </Actions>
        </Target>
    </Rule>
    <Rule RuleId=\"deny-everything-else-published\" Effect=\"Deny\">
        <Target>
            <Subjects>
                <AnySubject/>
            </Subjects>
            <Resources>
                <AnyResource/>
            </Resources>
            <Actions>
                <AnyAction/>
            </Actions>
        </Target>
    </Rule>
</Policy>
');
