<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Student_record_has_been_updated</fullName>
        <description>Student record has been updated</description>
        <protected>false</protected>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Student_Email_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Student_Married_Flag</fullName>
        <field>Married__c</field>
        <literalValue>1</literalValue>
        <name>Update Student Married Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Student_Is_Married_If_Wife_Name_Present</fullName>
        <actions>
            <name>Update_Student_Married_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Student__c.WifeName__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Student_Should_Get_Mail_on_record_update</fullName>
        <actions>
            <name>Student_record_has_been_updated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Student__c.Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
