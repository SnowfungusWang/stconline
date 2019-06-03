-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: njustc
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2502',1,'/home/czf/桌面/stconline/server/target/classes/processes/Entrust.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2503',1,'/home/czf/桌面/stconline/server/target/classes/processes/EntrustProcess.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2504',1,'/home/czf/桌面/stconline/server/target/classes/processes/Entrust.Entrust.png','2501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�g\"\0\0*�IDATx\�\�\��\\e�7�\�*��Km�ReQ�JQEaY,��e\�.�ee�L�tO&��Q \�x\�2K��P�B��*���P(���(�	1�bH !&$!$!�@r����u�\�}.\�}~���z����\�93\���\��!C��<�\����Oy~\�\�ny�<�hʺ��?���/��ϻ2��kϋ\�D���\�\��\�Ϟ^\\���mʿ7d����yC\0h,�\���\�/�ۉ\�y\�Z�/��Z�|�~fj?�\�\��\�t\��՟;ss�OK��K\���vx\�y+��\�\�\�mɯO���\0\r\�<�v\�g����-\��n?z\�m�_\�%4\�ImFj?�\�M/�ۇ.�\�\�E�\�𼱵\�\�M\��T~���6���j4\�(\���MO\�\�\�\��̆جs{j�I\�릭^�n��\�~2oKl\Z�6�\�5\���X\��s�?��>徵��jAr\����\�\�ڈ 6-��Qq�xl\��\�\�׾�:�?Ě}jǤ�\��\�:��\�EG~Ã�gNݔ?��6\��c;>�:�\�\�dt\��.z6n�;\�\�*\rЀ������]��<:�?��?{\�oW�������_�\��kϻz�k\���?�l�&6��\�O\�����\�\�\�\�H�gg�\�K�[U\Z���N��\��\�5�Y�=�\��sf-ϟ�\��\��\�\�6k\���k���\r�u�\�\�\��\�x\�Ol��{�a�}&�F�\Z+\0ڪ�~�\Z;o\�\�UO\���\�vdj���ѵ�\���ԎJ_̩>�\�\�>�{�;��0/\�/O�\��\��\�>�V\�\�\�_��g\�1*\�X!��կ?�|�ϽwM�\�w/�\�\�߮~\"O-�|����\�0}��I�[��\�.�\�\�82��\�k�}t\�\��\�\�\�Tk�_ D\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\��a�\���o�\���&M\����=\�\�\�\�G��wvv\�_�\�W�	&l��\�_\Z;v\�\�T�,[��\�\�[o}�+_�J~\�\�\�?���Gy$_�|y�q\�\�<l޼9_�re�\�c�\�\�v[~\�9\�\�cƌ\�:~���\�\���\�|k�GL�6m��矟�5�|\�ܹ=��ޚ?~�F\r�\�g���Q\�\�*\n\�Dk�\�^{\�\�q\�\�\�s\�\�\�ĳ\�>��;6���rWW\�a�\��֭[7v	�u\�]����\�y_�\�F�z\�wޫ64� \�\�+�\�\�z뭼�\�x\�1\"xe\�С��6@�}\0�	(\�\��#\0j��\�|\�ȑ�U��\�N\�\�\�W��v�i\�s\�\�Z.�ǩ:@�\�@qP4bgqGG\��\0\Z@����K/�t�#\�Q}�Agǉ`5\n�y\�g�4x\�Nb�A4y�\�\�ƙ���3xW����dYv��\00Hb.��\nb0\\}�\�o�1b��\00Hb2��h0<��\�o�Xb)\0��\r4&��W�ޚB�\�R\0$1\rtm6Ё\�\�TԖ� �Nx0	�At\�g\�H`�\0D_�\�\�m��ʕ+7\�\'\00�.�\�\��::\���\�_\�\� �At\�%�,��&L��\�y\0�h\�ر_�k\�\�1m�3�?��\�A�gώMA\�l^x\�W]uՀ��\�ѣW�E�\�\��\�/n�?�����\�\�1\np=�1f̘	qa����\�o���R�lve1�s\�9\�,��\��s\'�\��+�,[�\�\0\r&vҦ�\�n��?�`\���\��\Z\�\�\�\'\�h\� =z�\�\�|\�;��\r�l\�y\�;��\�\0\�A\�\�ٹ�K_�\�֧�z\�w\�>�\�d\0\�Db\�\�ȑ#ߺ袋ތ0ؗMD�?���\�\�P=\n\�N`�fk\�i-��6?jԨ��&Mzcƌo�X�bK\\�6hL����� \�L\�\��\�<\0�\0ZD\�\�;S��\�\�q}༮u\�6�\�f\�T\�(F0\�\'N<X%\0\n\Z�G�>T%\0\n\Z\�\�\���\0\���v�8R{�J\04�,{�J\0P�\\\�\�\�\�v�J\07�W	�\Z1b\�[\�\�\�V	�b�@\\,�#*P\�(�J\'�@�\�\�\�Ç��J\03�\�\�\��U%\0\nhĈ�J�\�0�\0(flLm�J\03\�(\'*P\�X�Q	�b���\�\�T	�*�˯��%�\0(\�H\�\�\�\�S	�b�֦6N%\0�9X�\�7T��#�եR\�\�*P̑�\�\�&�@1C`E�e�@1C`yj��@�Q�\�J�r�J\0s$�\�r�|�J\03^L\�z�\0(�,\�V*�U��#�\�\�\��T��!���\0\��gR��J\0P�e�Sܮ\0\���)\�P	�J0\'�;U��!�Dj�V	�b����ݣ\0\��\�Y�ݧ\0\��?���\0T.�g���\0A�\0\��ɱIH%\0��\�\�a�\0(�R��\�r��G�\0(fܝB\�q�\0(f�*���T���,�ň#�R	�b��\�R\�S	�JpkjO�@ť%\��*P\��A\\l^%\0\n�R�ܘe\�B�\0(�4\n�>�U��\�\��\�)��\0T�T�ʲl�J\0s$py\Z	,S	�b�.I#�*P\��(��J�\0(f�O!�J%\0\n�T*]0bĈ5*P\��j�\\~E%\0\n(�\�K\�U�\0(�4\n�Rj��@1Gg��N%\0����W	�*\')\�P	�b����Q%\0\n�R�|>˲M*P\��l\Z	t�@�\�\�SRlV	�b��\'�\0@A\�N\�\��=�%*Кk��\�)J�\�i*P\�\��bhaY�M\�Utttd*\����u���\�L$.\�1\�\��*P� x�.\\]�HҚ���Q�8(\�h@%\0\n�T*}[\0�<\�Y�p\�ٳg\�S�N\�\'O��\�G�2eJ�\�CmM\�FU@ӈ\0�9sf�r\�ʼ��[;��jժ|��\�[S L�4���\r�420\�5\�b�λo[l�4�\�t\�B\0�m\�_]�/|\�\���)�\�\�\�\�O�/��uk_\�\�\�?!\�\�on\�\�xL\�/��%��S\0\�\�\���\���\0\�\�!�̃��\��\�t�B\0h\��7y\�.C \��@hB\0h\����v�_\0-fݰ\��\�t�B\0h\�X�\�\�|\�\�)(\��\���\0\�\�!m\�\�?\�)\�>��\0Z=6m\�<|\�Λ�\�}�_\0-\ZqF�s��\�\�>�x\�Y\�B\0h�Hk�\�L\��|\��]@�\�s\�FB\0h�\�\�ڿQ�\0Z8�f\�w�! �&��\r�ZB\0h\�Є\0 4!\0M\0B@�Є\0 4!\0M\0B@@�B\�\�g�͇�?��\����ޛϝ;7?�\�#�\�g_x\�������_���1\��?�\�{����5ѹ��\��|\�\�w\�}�\0\��yժU\�:\�\�d\�v�\�\�{�x^�Gϵ\n-\��~O\�!ϻ뮻�\��\�q\�=?\�\�c�\�r�\0����Z��Z3g\�\�O8\�\�\�\�\�̙\���Y�fm�oÆ\r=��/\�\�\�\�7߼\���\�\�\�	�\�����Z�dɒ�I|�e\�ҥ\�}��7\�O>�\��\�I�\�\�~�\�u?��\�\���/��Ϙ1C\0B\�@B :ܸ\�k�\����q\�=���\�o\�|���F�\�_\�曣�:j�ǎ>�\�\��\������\����=�M�:u[�\�m�C�0\Z3fL\�}k׮\�uTS{O#@`{\���\'��SG�Ӵ\�\�\�\�W^y\�v�\�)\�;\�\�\�\��}\�c\��YV�X\�s[?�\�݈E\0B�C\��@O�\�[\�\�\�߾ˀ\��\�IB\0{\�b;����\�6M�4i\�\�g�y\�\���}WWW\�H��ö�C>�\�{:\�w�\��q\��\�ccǎ\��:\�=��>�O\�˖-۶\�z\���\�q_l\Z\�-\�\�cs\��\��>!\0��\r�\�8k-ֶ\��m�c8v��v�O��_{�v�\�iGHD�ԇK�\�I\'��\�kFh�\Z5�\�5c\�n\��\�E\�Ϝr\�)=��9{;\������N;��\0 4!\0M\0B@�Є\0 4!\0M\0B@���\0! \0��\0B\0@\0! \0��\0B\0`0\�\��:n!\0\�̙3��\\�R\�\�Gm\�ҥ�St�\��´i\�.�>}�֗_~����믿ާ0eʔ7S�\�/h\Z�Ӻ8����\��\�F�ѧ���9rd~��\��\�kv\0�~!\���!^�\\.��T*7:��(HdYv_�n��0\���\�#T�\�C u�\�և@]ےڔG�<@���Yg�u\�.B��ʹ��C�:\Zؼ�\0H�mIm�\��h�\�]��\�8|��O�<@k���^\�M;���;��1\n�T*?Wu�����ê��\�\�.��\�(\��\�#����\0-\�\�^�\���4�(\��V�eǩ>@��n\���\�^u�(@C 9(�\�˩=a	\0/j\'�\�t\�Y\n\0�\�{�\�J�\�i�@�B ����bD�\�{-\r���@5\�ϱ<}y�%P�=z��\�r���-���@�T*\'\��\�v��P�\�\�\���d\0\n\�\�sgjoĴ�@�B���Ŕ�@C`ذa�ǌ��\�n	,B�T�T\�Ȳ\�lK	�`!R\0\\GuttkI,B�\\��\�Z3�0&N�xp��+Ө\�1K�`!:;;\����Ֆ@�B tttd\�G�Yj\0��e\��\�\�\�5jԑ�@�B�\Zs\�g^6Č�\0\��ꌣ��\�}��P��~\�\���}\�(X�,\�Ώ\�#G����P�)\�Ja����\0�\�\�_�\�_,I��@gg绫3�\�ji,B�\\>�zE�/X�\0�P�T.I�˛mmm\�X�\0�\�\�23�^ioo�%P��G�,[��\���,@�B �xlJ��,]���@(�͖��}\�(XT�\��u�~�\�ﱔ\n\�\�m^j/Y\�\0����w�\�o]�e�Y\�\0�j|8f-�JX\�\0�\�\�86v��G,q���@H#��\�\��\�SO}��P����f(jČ�Y�mJ��O-y���@H!�q�T*�a\�B�`!P��/KaSK\�/\0\���g��ƌ��(��q�\\.�N��G�\0B�����>X�q�J	�(\�\�_�\�*�\�g�5\0B��J�ҏR6�q�e\��Ԗ� \n�6\�h�\\�W5\0!P@\'Ɖd)��\Z�(�R��\��\�NR\r@�&��qV.���\�<��(f���v�j\0B��\�\�\��5N$K5\�T\r@�>W�qŮ\�\�q4&�S\r@LL7!a�\Z�(�\���b�j\0B���\�ű\�X5\0!P\�z\���\�!���b\�\�8�L%\0!P@1�DL+\�K� �Y��b���pN5�f\�VD����^��NL9ASP�\�!й�Ȳ\�b�ڧ �7.F�Q\r��`\�nB`\�СCQ�}���\�S�\�ԣ��V{�\n�@}�_w\\�^5�f�\��\r�7\n\��J\�\�G+�4\�h���>	��R-\�\�\�\���j\0�ˌ�^\n\�G҈`�G�F\�ή�U�o\�\�8:K5�F\r�\�0\n\��=:6�v�j\0��\�\��R\�8�,\�gT\n&\��C.\\�d�\�\��ԩS�ɓ\'k�ѦL��?�\�C[S��IC��)6uvv�\�H�̙3�+W\�\�\�\�\��U�V\�ӧOߚaR��_R[\�\n$F\0�o� ����o�6\�h�T�\�Dl\�y�m�\�C\����e\�G�\'���\���[\�K#�R�\�\�\��a�! z\��W�\��q>\����:\�\�\�^TG��q�@O[���|\���\��\�v-\�\�t��!��K�\��_�%��S\0\�\�\���\��[4b\�\�r�ܝ\���@�C\���{�!�\��[3���\�Ŏ\�\�\��[��!0o�\�]�@<�\�o\�Y�M��%\�\���ǀ�\�\�\��\�8\n�8\ZhW!�\��[?b\�\�r��J\n���k�`!�`\�\r��xL\�\��!\�\�ڎ�\�B�J\��9P�X�\�\�|\�\�)(\��\���!��3�>�\��{� !m\�\�?\�)\�>�~�B�\Z�� \�h\�Q(Jlڔ/x�Ɲ7��\�1�B�\Zϙq\nqF�s��\�\�>�x\�Y\�\�����ò,ې\�\�.�EЊ!�\��/�������Z�\�\�s�\n�a\�ȑ�\�R�\�?	Z(���oT jF��q4��o�	��Y�\�ݨ@L.Ե�S\0<�F��=�P�Q\�!��PkB�X!���`Y�es�GA��&�ըQ��LAН�\����@��T*��\���,B��R\\�F�;;;\�\���(�,\�KA�Ҍ� �@\r:��4\"X�\��a �@utt\��Q�\��\�@�bn:;f-�J�R\rB��R\�3�6\�pՀ�g�}6:th��\�O\��\�{o>w\�\��\�#�\�\�\�͘1#?ꨣ��|}\�\'�Y�y�\�w�\�\n��-R	h�H?��Z�*_�fM\�\�\�\�\�\�ٳ�\�Q\�?/n\��ŋp|\�w��\�/� \ZD\�8�B\��\�\�T\rh�\�A�\�\�fΜ��p\�	=��\�}˖-\�y��>�\�\�?��\��\��\�\�3������\�=�5\�\\�\�,Z�s\�1۽\�ƍ�\'�|�\�\�\�\�k�r\�)��a\�z�鮻\�\��,o�\��\�\\��r���\�?�n\�U\r(@Dg�E�]�zܸqۅ�\�7ߜ\�y\��?�\�?n\�\�\�c�\\rɶ��\�+vz,��������\�o߮�3fL\�s֮]�Ө��׬�Bj�G@\�m}h	��Q�T\�\�C\��Հ�c�=v�m����M6q��\�\�sb4��{\�=\�������\�~\�MIK�.�\�\�\�\�5k��\�\�\�\�%K�@?Ȳlr\Z\r�f\�Qh���>�\�c\�c\�:�\�&�{g�O�ϭX�b�\�5jT�k\�}�=�f<?�%\�v\�m�;\��|Æ\r�	���qty\n�9J-�\r>:\�Y�f\�9hҤI۾>�\�3�\�S\�_���m\�)}�\�=k��\�\'�\�T��m��#�\�\�4�cp\�\�5\�H��O>�g\'���}B��xo\�/��\�{�M\�O�:u[�5��ñ�v_t��\�\�\������\�\�GG\�q\�\�r�L�\�\�B\'v�F�}�G\n�z\��̵��GB��J�\�b\�\�\�U�|$�	���F\�ňଳ\�:J5@�bn\Zz\"��ӗ�!P01\�h\n�WS{P5@�bn:�z��E�B@s�\��gR5@�J#��\�C\�\�\���\Z �@����Y�-T	B��b�B\��\�~�\Z �@�J���W$��j��B`B1\�\�\�v�j�\���qA�K�\Z �@�Č�+\�\����(��W(��\�?T\rB��RܑB �����U��(�\��\�R=��|Հ~�\�븅@#ʲlZL5=|��O����3gnY�r�λ�\�ҥK�\�����\�\�\�ߖ:��Sl\�\�\�8VE�M�6\�\�ӧo}�\�u\�}\0S�Ly3�I���;\0\�\���*�\�G��\�i]�\�^\�\�f�Fm�c��?_�u��\�\�\�����ץ��s�m&N�xp��J���\���Ժ\�r~X5�\�=�P!\�\�P�^T\�\����\�0!КJ�\�qhjW�Ы\�\�\�w�֓e\���\�\0��\Z�.�~�\�\�I�\�V�h�\�7���i�~N5�݊�cR�!Z@u\'��\�6��!�(\�\�\�SO}W\Z,I\�\0\�U`�����:�-*\�ܣ��6@j�\�\�\�ߩ\"�����B�yutt�X\���D�� �IZs�pG�ͧR�|>-�7S��F5���:���@�ɲ\��\�9\0׫�\�bJ�X�T��\n�I\�s\0��\Z�)�J��y\�U�iB��1rKAЮ\Z@_t*���pP\��I˪{\�ȑU�OT*�\�FǢ�+&�K�0�k\���*�e|>u,�T�1U��X�ڲ�(��\0}*u.\�\�8s�h<qGZ6o�6/��P�\�utt��@��J4��L>Gm�\�ɪ��r�<2.:�\r\0g\�Y\�)~�\Z@��Rg�^%\ZC�R��\Z\0T��θ\0�J��~Z=�S5�Q*����Ġ���6\�\�{�\�H \�yU%G{{�\�\�2x66\�Ŵ\�*���9.��*1��\rvx\��W��2���\"��K\�7R[�>;:�Ť\0~n\�С��0(J�ҷSG�Z%�\�\'\�T�\�T\r`�Gbs�JX�+1hj��\��\�\�\�^V��uU�L5��P.�/M�\�r�\�_Y�}�z!�/�\�H#�+R{I%�5\0\�y�b\�n\�\0\ZJ꘮J�\�R�\�{1�g\�����@S�OP�\�\�\�S\'�W�\�[]]]�E��ھ2jԨ#UhH���>�U�\�tvv�/\������SE���\�V��F�T�\�B��\�6��>��=HE�F��R<��R��\�\0�zޥ\Z@S(�J?��T\�G\0c���^�\Z@3u^����\�՝\�\0\�Th��5��Ub�GR��M@�)H5���e\�\�R\'6O%�\�A�n�VwD9�f\r�_\�	M*��\�\�T�E�����дRGvgjsTb\�ĉ_q���j#NS�\�C\�ש=�{S?��\��͍)!Th��\'�m�\���kL�\�����r�|oZ�}D%v�_Lu\�\'֩\�j\���=���\�e\0�Je�j\0�\�\�Mq�\�]��n�N1R5���eٴ\�\�\�P��\��\�6�\�|R5�V^۝A�3t\�\�Cb\Z�\�ַ���\"@����!��d�\���S-V���<lذ\�U(B\�v\�\�!�\�k�1\n�р��\��\�8L�\�5(�J�J5\�l\�P\�x,u~�)\�\�G�\�@1�����!�dQ���:�\��\�.��\0RL�\�p���8\�_P\��\�\�\�Q�\�{ \�����\0E���C���k\���~\�?\�L�mmm\�[�@\�ť%��S4\���k\0ĵ\0N?���X�\0�8;��V�\�\�_\�r��\��=�PK\�����\�~ت�_\\�7��\��\�ۃ,q�:�s|�U\�\�O���\�9\0wZ\�\0����\�k�߫T*}5u�[\�\����v���8��u��;\�\��\�XK`�#�%����:�_\�&��;�f\�\�y�yi�R��~��R�=�~�M\'Z�\0{�\�,u��7�\�\�\�\��\�ج�ګg�u\�Q�*�ޏV���%\���G�\Zud\��_Imɩ���.K`\�F/�6�I?��Rۘ�lNL	ai\�{G�*�Tn\�\����.�\�Y�\0�ߙ�N\�[\���K�җ\�\�J�r�%p`!�&�o4\�獝\�\�s\0�e\�x��6�q\��Y�,�Y��>oْ蛑����\����u�J��-5��	�\�\���\r:��\�L�\�\�H\�hK�oװ�s=�?[gg绫G/�6l\�\�@߇��48�\�>WGGǱ�\�R{����m�@����\�*�����\���6���%Џ\�\�i�;k�\���8�\\.�\�\�\����\�J�rz�|�	��ߒ�\�bK``:\�Mi\�{X�\0~�>ϙ�\n���@w\Z	|v�?Ô\��F\0��D\0�ޜ\��O����~R\�??vN�\�\�,\r��	�OB\0�Cz\�\�\�W�v�%08!�f\�?>�\�\��ߟ\����\�/�=�PK`�B\�\�N\Z��9r\�Gc?Dj�ӷY\0\�\�\�ux�=��\��i\���nai\0�8\nhO!\�_j�kT/s�%0x���\n�r��9f\�\����z!��,�\r�\�( \�ob\�sz\�ϫ>@Ȳlao��xpPz�\'cZ�����:@�(�J�\��þ��^�\�SO}WzͿ�\�\\�n߫\�\0\r&u\�\�\�`C_��ӯ^�xI��J4���X-\�\�\���x\�\�\��R\0�i\�ĉ�2@c�VD\��Z1i\n�7\�\�oU�9B���\�O\�t�=���[=�Uh����\�qIk�WF\0��\�	\�\\�5�\'�����#��h�\�S��P\��/\�\� �	\�\�\�r�@\�@\n@\���\�\�NL��:�\�,{���\�\�	\���\�\���`\\�%u��\�b0}qD\0�\05�n\Z�\�?\�Ieq9ȸ,�r�^\0\���ڈ �A��Lm�R�v\0\��ܖc�=�\�84��(%@1�ǻ\�����������韌\0\0�<\0\�z�?�\�\��n��C=��	\0\Z#\0�2\�og�e7A��\�\���!\0\Z7\0�T\�\��\�[\�@�ݴ�\���`W|}\�\��}>���\r�=��{\0�\�E\04O\0\�.��!\0v�\0�$\0v�\056\r������}���{tW\�\��U�(�`pG{�i��G�[\0��O�6��MA\0M}yt�\�\0\Z4z;j��\�\�\� ��va/k\�}y\��$%h�A\�$\0\0�lDP7\rٻYD\�\�|\0�&\�6|\0\�b#�}	\0\�\"#�}\�\�\0@��f\�P\�;�\n9\"�\�C\0\0�\�\�/\0���\�º\0p&0@�\�\���1(@1G#F�\�\0@AUC\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0�\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0\Z�\�_��\�z�h\�\�\�SdYv�J�n�\�M�:t\�!�P�\�@�\\�\\�\0Z?z\�7�\�(\0����\0�ˌ\0\n*���]�@�F=��\0Z\\t��Ɵ\�\�\�a�\�;\�x+�5�ͮT*7vuu�j\0M���\��ԱOO�\�8[��p\�-Y�\�O�WE�&\\�O��}��\����\�E�md\0\�$��\��q\�\��\�s\�\�o�\���G\�_z\�|\�ƍy�ە+W\�O<�D����$7n\\o\�I�Q*�NS]�G�tttl�\����\�o�t�o��V��\�̙��?~\�0\�\�|���\�?)�{\�g�:�\�w\�}yWW�\�\0\ZYlJ��~\�\�s\�=���_|1?���\�4\� b\'p�>��\�\�ߗ\��\� �\�Y\�\0\�(��M@}5\�mD�æ�GU`\�y\0��b@�}��b3��\00H\�D����6oޜ��o}\�[���\�[\n\0� �ԟ	����s\�nwfqjGX\Z\0,լ\�| ��\��\�b�!K`�U\'�\�\��\�\�\�\�n\�nZ	K`\�C`\�E\�c*����\�6	��4\0X\�|�\�X�|���@�7P?\r��0�#�mqm2��\�W���� ��`\0FB\0`0\�\'\0P쑀��\0\n\�\0(��~�`�1���|\�\�\0�)\��\��\�(��ӿ~с\r\�_{\�,�\0�(�\'�{t=�\�fԕ\�\�8\�Wh$q�߸\�o_cx̘1�1ЈJ�\�i���\"�jD#��\0����Su�\�\n�\� 6\r\�>�\�Y�\0v\����U�	��v\�М9s��0\�	&l\��\�\�\n\0�\��\�\��\�o\"�3�{챞��j�\�\�ml󏠈3�\�O�\�`@�����G\r`{\�N`�&\����\'\�\�,ޛgǉ`�J峪\�\�b��\�\\C1:XU?\ru\��kc2��\�T\0\0\0\0\0\0\0\0\0\0\0\0�\���\�\��l\�\0\�\0\0\0\0IEND�B`�',1),('2505',1,'/home/czf/桌面/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','2501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0F_#�\0\0�IDATx\�\�\�\r����\'�\�/f5���^\�m6ƽۦ\��n\Z�ɍ���\�\rmW\�93�\��V��\�\ZI	E��Uz�jE��Z��n-\"UD^�:\�wQ�+��:�Tpx���sg\�a�Q)0\�\�s>�\�sxΙ3\��?\�����~\�\0\�HRJ�nH\���8\�\�uim~�\�\�w�\�Ϧ9mO���\��gw�\�\�\�s��oË�g�\��\'q\0j慔�\�0�lO(}\"\�\�B\�WR\�oO\�{��\�\���\�)�[��??�\�#@\��isz���۞̡�\�x>\�\�	�;r=\�\���on\�	�\�^~��\�\�Gs\�\�u\�[\�\���\��_�\�>�\�󯦴,?\����􋞟�\�\��9���\�zШP7?�\�\�&\�k|m�\�s^{6�\�^�?6s��\�\�\�?t�5�-ؑnڙR[�\�\���۞M�\���\�O\�\�Z\�?s|N\�\�����\�O\��o�cz\�/)=����o�u\0]��/ߚ^�\�3K{:�\�[�\�\��xbOu\�\�\�����\�5ݕ��4sEg츻*?��il\�^��m/��V�\�{�un\�\�ٯ@MB\��t\��\�#\�r]�@GZ\�/�\�S��\�_�͜\�RZ\��\�%?_�wItoq0K~�\�?vlɏŁ-w.\�\�\�\�\�\��tz0O�\�\�֤\�ƴ\�\���\�Ӛ<\�\�\\�\Zy\0jz\�\�|E��8!�\�e��.\�s=�\�\�㠕\\7\�Z�zF��}�.ȵ�\' �\��\�K{\�wo�Sz\�{r�\�\"o7\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��O���\�H)�`���F��2�uG�w��!�)F�Z�\�\�mO�\�\�\�z�}⢷ӍϦt�\�֤߾˴O,ݟ�Ϗ_+�\�Ǵ\�\�ҝ3_J�\�{oy<\�\�y_���6��\"�+{\�\0��~x{�Ō\�\�\�����V��3O;f�i7�1=A���o�Ǵ\�\�6��x�`G�)�6<�_���Om\0jz�\�1:�U)M�\�?��iY\�����\�7?�\�G\�S\��\�\"@{;\�\�\��x-�߹<\�2\�\0\�2�\"��\���\�5\�ϯ��\�\��\�s}*6]4\��{��s2}:��\�1\�\�߭Y\�\����\��\�Y����=�ˌ<\0��s\"\�z���\\�֋)]\�d=��7\�\�����78\�ϧ\�=�s~�\���\�͞\0P���\�Ϧ9���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\���\�ͻ\�nxkڴi]\��\�wSkkkjjjJ�G�N\����\�\�ɓ�L�:uÄ	�c\�\0r6n\�\�r\�w�y\�%��q\�ƥ_�\�W\��\�O�6mJ�w\�NaϞ=���#=�\�i\�̙i\�رi���]�&MZZ�TN4�\0\�{gw\�E��^|�\�)wviٲe\�\��~-_�<\�0�w\�y)w�S�(\0u\�\��\�g?\�8qbz\�\�\�\�X�re�0aB�ַ��Zkk\��F���cǎ	�\'ON\�]w]z�\�7ӑ�A\��.�袿\�\�	@\�txxW_}uڷo_:\�f̘\�\�Æ\r;\�hP3�/6iFGv4�\��\�\�ӨQ�\�\Zq\0j&Z�}xGj�\�m\�;vlW�R�h\�t�Y3�Ҍ#4C\�\�\�Ҳ\��=\0]���%�+��rOSS\�����+�ĉ\�\�\��z饗R\���:��A3��?ĕV�\��+imm\�_.�ϳ\0q-͸�X-\\{����\�,\0E\\<:��Y�=�ؾz\�,\0E\�-!.][�n\�ʡ\�i)\00(\�@�wKlq\�5��\0���Щ%���9\�sj\�\�u	=\0\�w��\�\�\�\�\�\�c�\0�fʔ)��:zs޼y�\�`\�\\q\�kku�\�\�ɓ7;O�A3ao�;�&Wd�ː�\"\0�|��ڛ\�\�\�iӵ7\\?���\�k5�.�\��\�\�\0��kmm=���\�\�Z�|��ޟ����\�幟\051~��\�q#٣}\��]�v\�onn\�\�\�\�\0\�\�رc7]{\�G󠖮�;:\�\��j�\r@M\�A%�\�\�z\�\r7�\�\�4iҫq^^lN5\�\0\�E�]p�?�\�O\�Ν;�\�&͋.�(\\Yg?\0u|�G�^}\�v=���}\�J\�ËM�:<\0\�Vl2jԨ}S�L\�\�w(�<�z\�-���\�(M�\0P��;\�]\�=ѭ�3�kڴi��,Y�o�\�\��\�~x�wK��G?��\�[\�\�bq���8\�\�L\0��b�s-ȵ6᮸-PUu\�>�\\\�qi1WZ��A�F��a#@��\�qF���\�Ç�`$\0h�\�\�:묳>f$\0h�\�=z�\�F�F��\�r��F�«T*�G�q��\0�:�}#G����\0��\�\��\�Q�F���\0�:��!\�g�\0�z��\����\0�B\�\�\\_1\04B\�\�nnn>\�H\0Pxq�������\0�:��\�CF�F���i$\0(�J��F�T���\0�:���\�勍\0�z�\�n\�F�F���.5\04B\�u\�l$\0h�\�\�\\.��\Z	\0\Z!�6V*���\0�����\�\�\�\�	\0\Z�\�[�;�\�F�F�5�n0\0^\���\\.�o6\04B\�\\*�n3\0^SS\�K�~m$\0(�r��<�\�]F�F\���\��w��\0��*�ʳ�R\��F�\�\�]ޓ9�\�7\04B\�=�C\�#@\�555=�\�a#@#�\�\�\�\�-2\0^^�RYb$\0h�Л�8�\0��\��\\\�F�\�\�#@#�ެz\�	\0\n/.A�\"3\04B\��&�ދF�\�\n\�테\0�W�T~�C\�ߍ\0�W.�o\���g#@#�ލ9�\�	\0\n/\������F�F\���\�\�[g$\0h�N\�z�\0�\�\�\�|E\��6	\0\n/wy�su	\0\n�T*]V�T�\Z	\0\n/\�ws����\0��r\�M(�\�ۍ\0�W*�����7�\0�����r��\�H\0Px9�F\�z\�H\0Px�,�\�.#@\�577��Co��\0��J�\��zo	\0\n�\\.!�^g<omm=�R��\�\�\�r��`\�ˡ�=�\�\���??�j����wǻ�]wE�g�\0�\rvLtz^�\\^n�\0h�nO�@��\�~B\�\�(�r�<��.o����rнQzی\0��;��U]\�D#@��\�\�7#�\0�W*�.z\0CTJ\�իW�kooO.L�\�\�W\�Ղ\�ҥK�r\��\�\�\\^[[[\�\�\�H���J�ڲeKZ�xqW�i�‚�O\���\��u��j*6iZ)���\�\�\�/��XY!+���z믛\�\�\'��/���\�yL�2WB(T\�\�ؾ!�8orz��\�P1-^�BWB(L\�[~�A�\�[\�ϱBWB(N\��\�O�x\�\n]	=�0��\��z��z�\�SJ\�C-�\�h́B/^�BWB(L\�z�C/^�BWB(L\�m۰,���7m\�i��z@aB/j\�S�>(�b���z@�B\�\�Ӫ\�f�i3O�׬Е\�\nzqŕ��~�}z񚫲(�\�\�\�ܦU�\�M\Z0�z+\�\�\��)��\�{�\�Nק�P�\�{?\�ݻu}V�J\�C&��\��\�-+x%�!zJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0��~j���\�NH^xaZ�jU�җ��������޹s\�\'�x\��\�柙={�Pz�\�\Z��!͜9��}\�ƍ���_<`�\�w\�\�=��W^9\�gn��va\'�\0�W�\�\�7oޜ\�x㍃\�\�GM_�\�W\�w\�ޝ�y\�o��fM��\�\����3�K�,zBz�z�\�rK�5kV��\�\�Y�\�\�ɓ�\�-�\�s�{絶��4~��\�\�۷o\�0UBzu\�\�\��+Wv?\�Gұ\��\��N=�\�\��\�m۶u�L\�(� �\�:�z7O����T\��\�d*�\0�ޠW\�f\�q\�ƥ;v����d�\�\'N\�>J3�>���_�bE��\�\�\�_\�q\�i\�\�\�OzBz�������\�͛��9#׭[�\�k�g�yfw��|ߟ\�=͡\�.B@\�)� ��\�zJ\�=%�\0��z�гBVBzJ	=@\�)%�\0���\���zBzJ\�=%�\0��z\0BO	=\0����>���BVBhmmm�;::��\�Q��\�ׯ͡\�\�/��E��h�\�\�]���ZC��w\�\�ѐ��V��`�������j.���\��+6?5B\�w\�}\�\�s\�Ms\�\��\�����%�\�7�I�2\�\�\�	<�\Z�T*kr-�\�\�ojj\�ʕ\�\��TK��x\�ȁ�o�\�\��X\�y\��\�|+s\�y�%�\��7s����\�\�\�\�\��y���t\08��7=wV;�ӿ�q\�m\�z�]\�\�<�\'ZR\0�\�\�\�\�s�\�\�\�rQ�\�%\�\�\��B���\�\�g�p8A3/�\��:��U\�zQ\�\"�-5\0و#N\�\�o�\�z��8xe��{+\�\�DK�\�\��=�ɟ\�h~�xo6\�K�\�\�F\��\�?f̘�\�Q\�-�\n��܉�ϘǘWK��Y�\�s�\�Ug�筱\�.\�\�\�U\�\�\���%�\�\Z.?ʵ{\�ȑ���\�o3f\�c\�k\�+-9\0\�\\�r�ĕO.*�\\*�.�y�y�8�.\�\\�\r��.�\��ۛe	𾴶�~\"inn��P���\����$\0\�\�{>wL\�\r\����$x���J\�\����S�Њ�O,�I\�w�D\�W\�я�E8���\�\��N�,\0��\�rg�v�\�s�\�R�\�PcE��I|�z��\0�\r��R\�kW\�\�C����Bܮ��\�/�[=\�%�\�\�g\�^y9N)p\�RO��Frl���7����;�P�\�\�{[[[�/�w�\�\�5��%\�x�.��\�J�rm�|\��]�\�\�\�\�\�\�h q#\�o6\���\�\��\0h�G��\�z��\��\rz߈\�c\��\�\��+�˫��\�\�[�\�\�Q�%\0\�ȑ#�[^᧖����:9�\�\�477�W�E\0\\^\��6��w\�\0<�AC\�zO�/�qV�\�q\�_�TN\�߽˝\�\Z\�\�ѣO��\�r\�7���w�\�ε\�\0\r&��\'đ�---���o\�I=.G\�\�\�\0�|\�w/�	ەJe]�,u�5lذcr\�\�(�J�/��\�\�l9�\�\�Ç�`�4�x�)\����:\�\����\�\� �\�1\�\�#G���\����\�m\�S4\0\�?^\�᰼h\�+w��\�n�6K�w�u\�Y\���\'׏\��7Wg\��>l	\�7$���\��tA�ώ���%�@A1/\�����\�\�#�+�w\���\�` vz~C�k\�Mrw777_a��b�fl\�\�{Ͻ8\�?O��\�\�?\�\�u�iӒ\�}�Z\���8����\��|cܒ\'\�u\���W\� K�C阖\��x=�����\�\\\��;\�_\�<[z\0Jx�\�\�U�]o\�\�f\�8=ND�\�-A\0ޗR����M�}/\��\�⚝uڙ\�S\�(\0�\�\�\�\�/\�\�\�\��|�\�w\\L:6\�\�ť-E\0ޗ\�\�\�\�sx̉�n�\�˯M���\���`�W-A\0ٹ\�{R��\\��߂z�׸1lϕd��%�\�ߪ>����\�R�,�y��\08\"������eK�^\��^\�\\.26\�\�y:\�R\���\�z6y��N\�\�z/X2\05�R:f�\�\�\�\�\�\�\�\����\�Q��s\�s\�=7\���\r�,X��.]ڕk��6�\�\"�\�\�\�RGGG\�\�\�TG�v\�\�\�p\�y˖-i�\�\�]9\0���j*:<��#�r\�\�\�/��ؤi���bs��8��bEd��� ��ꭿnJ���UZ�\��\�\�1\�\�\\	=�P��c���\�\�\���w@Ŵx\�\n]	=�0��n��^o�_>\�\n]	=�8��\�#?0�\�5+t%�ދ�8`\�\�kV\�J\�BO)��Ћ�5\n�x\�\n]	=�0��\�\��x\�\n]	=�0��mò�\�\�S޴��\�kV\�J\��	��5O���ЋiV\�J\�\�\n��\�N��q�\�<-^�BWB(D\�\�W^~���\�\�k�ʢ�0�C/wp�V-J/<4i��\�xO�Wק�0\�Bｺ;]�z@aB\��tw\�\��Y�+��\��[���\��\��L\�)%�\0���\���RBzJ	=@\�)� ��\�zJ\�=%�\0�^o-Y�$�t\�IiժU\�\�O;\�#�\��g\�jBz�QL������\�\�c�{\�ڵ��\�w\�}w�g��\�+�M\�B���q\�\�\�`z\�G�\�N�۶u��\�~\�=mmm\�\�SOM˖-;\�\�>����\�ӧ�Ǎt׬I��ԧ�\�ݻw�g�y�\�\�\�\�g�y\�i��\�\�A<k֬\�y�\�G>��z\�)� �\\\�\�r\�-\�\�{\�M���p@\�\�kW\\qEw�\����\��\�?�я��\�\�P?~|�{�o\�~�\�\�3{�\�\�\���r\�J� �\\\�\�&\�x�馛\�y-���6nܸ\�}s\�_}w��\�4�~��~é�k�\���\�ޮ���\�qݺuB@\�\�\�\�\r�\�M�s\�\�\�ބY��͛7Ե�3�\�n��\�{�ό�Ǿ��3g�c�=6\�ܹ\�>=\0�wd�w�b\�&\�x>bĈB蓟�dw�v\�g�y��\��\�w�bŊ\�\�bSgߠ\�3\�H\�\�|\�3i˖-\�kz\0B\�+Be\�\�_\�}\�C쟋`;\�S\�\�X����\�A)Q�\�Q};��>3�\�\�\�oW)�\0��z\0BO	=\0����\�SBzJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0����\�SBzBO	=�Q\�}ଐ�\�\ZB[[\����+euTk���ks\�u��jjѢE?Z�xq\�k��f嬎Z\�-X�`o�i�‚\�+����\�ߊ\�O꽫R��C�N�0\r6옦�&��\0(��#G��\��!�3\�\�\�r�\�H\0Px9��)wzB���Sr\�\�7\0^KK\�i9��	\0\n�R���Co��\0�B\�\�z{�\0�W*��\�\�{\�H\0Px9�\�ε\�H\0Px�JeT�\\\�i$\0(�x\�\�No��\0�:�q9�\�0\0^�T�v�׍\0�z�\�\�\�j$\0(�\�\�\�)\�r�\�H\0PxMMM?ʵ\�H\0Px�˛�Co��\0�B\�zk�\0�z7\�\�{\�H\0Px�J嗹^6\0^\��\�̵\�H\0\��ww�\\^f$\0(�R���J��\0�:�9��0\04B\�\�\����\0�Boa��F�F��|F�F��r����\0�B\�8�\�H\0Pxq�B��`$\0(�r��Bss�o�\0�� �K�	\0\n/.6]*�n3\0^�\\^\�\�\�<\�H\0Pxqٸ���\0�:���ӻ\�H\0\��ަJ�r��\0�:��\�\�M1\04B��5ץF�«T*\�sM4\04B��F�qF�F���i$\0(�#F����\�s�Xz;s5\0\n�\\./\������\�\�\�\�\�\�\�\0CZKK\�i\�zݕ��#@!\�`{~���T*�uy\04D��\��pr��\�\'��\��\0(�R���~B\�V#@!\�\�Xx��\rv�Q��\�\��yU��~bD\0(z��9B\�_�\�6\Z\0Fl�\���\\m��\�\�\�{ K�m�ڛ��g8��!\'.=��lq�=\�ubz\�s�\�\n.q\�2�@\�wv9�\�a�%\��v�\0u\�\�\��|\�\�v�\r�q\�ƥ�o�9=��\�iÆ\ri�\�\�)\�cGGGz�\�\�wܑ&N�\�߉\�\�T�@݈�2[ZZ�W\�����\�@۷o_z��{\�4iҤ�\�ו?�Q�.�zsf�4gΜC\n��z\�\�\�\�ڷ\�|\0\�Nl\�́\�U�)�\�_NG\�_��t�\�\��\�\�	@M\�A+\���\"�bݑ�W|��\��-\0�8J�z�\�\���\���l\�|\�\�0h\�<�\��x�\�h�}|\���b���\0���ϫ�\�ܳgO:\�.��\�\�͜\�-\0��ؗW}��8-a0,[�\�+�\�:\�\�\0ਊS�^9�SU�	\�q�NK���\�\�\�\��s뭷��4s\�\�.Sfi\0p�CoKo�ĥ\�SlJ�\�Ĺ\�\�\0\�\�a�\���M�6\rj\�\�y{շ%�4\08ڝ\�;�\�{�\������[\Z\0Z\�Ղ\�@�\0G�}z\04R�\�\�M\0\Z&���@c\�\�U��\"\�%�\\\�,\0���f\�Os\�M\0\ZB\�Ӯ�.�\�\�M�4\�]\0|q?�>]\�@�t{m�u\��s\�9ǝ\���\�\�\�\�\�\��\�Z\�<�#}^\���\�7k\�\�k�t�R\�\�՛9#��T\�^u\�\�\�\�g\��e�}�:�bSg\�\�;��[b^�M�\�\�M5\�\0\�]��\��\�s\��i	�\'O> \�\�s\0�|_�\�\�W�\�3�\��\�Ov_���\"\���\�\"\�J+\�\'�W\�óI���T\�y����V\0�{q_\�Ҟ��r\����\�J�x\�\�\��e����,\�Vgt[�oKTu9�\�q�踖�K�\0\0\0\0\0\0\0\0\0\0\0\0\0�\����\"c<O e\0\0\0\0IEND�B`�',1),('3',1,'/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0F_#�\0\0�IDATx\�\�\�\r����\'�\�/f5���^\�m6ƽۦ\��n\Z�ɍ���\�\rmW\�93�\��V��\�\ZI	E��Uz�jE��Z��n-\"UD^�:\�wQ�+��:�Tpx���sg\�a�Q)0\�\�s>�\�sxΙ3\��?\�����~\�\0\�HRJ�nH\���8\�\�uim~�\�\�w�\�Ϧ9mO���\��gw�\�\�\�s��oË�g�\��\'q\0j慔�\�0�lO(}\"\�\�B\�WR\�oO\�{��\�\���\�)�[��??�\�#@\��isz���۞̡�\�x>\�\�	�;r=\�\���on\�	�\�^~��\�\�Gs\�\�u\�[\�\���\��_�\�>�\�󯦴,?\����􋞟�\�\��9���\�zШP7?�\�\�&\�k|m�\�s^{6�\�^�?6s��\�\�\�?t�5�-ؑnڙR[�\�\���۞M�\���\�O\�\�Z\�?s|N\�\�����\�O\��o�cz\�/)=����o�u\0]��/ߚ^�\�3K{:�\�[�\�\��xbOu\�\�\�����\�5ݕ��4sEg츻*?��il\�^��m/��V�\�{�un\�\�ٯ@MB\��t\��\�#\�r]�@GZ\�/�\�S��\�_�͜\�RZ\��\�%?_�wItoq0K~�\�?vlɏŁ-w.\�\�\�\�\�\��tz0O�\�\�֤\�ƴ\�\���\�Ӛ<\�\�\\�\Zy\0jz\�\�|E��8!�\�e��.\�s=�\�\�㠕\\7\�Z�zF��}�.ȵ�\' �\��\�K{\�wo�Sz\�{r�\�\"o7\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��O���\�H)�`���F��2�uG�w��!�)F�Z�\�\�mO�\�\�\�z�}⢷ӍϦt�\�֤߾˴O,ݟ�Ϗ_+�\�Ǵ\�\�ҝ3_J�\�{oy<\�\�y_���6��\"�+{\�\0��~x{�Ō\�\�\�����V��3O;f�i7�1=A���o�Ǵ\�\�6��x�`G�)�6<�_���Om\0jz�\�1:�U)M�\�?��iY\�����\�7?�\�G\�S\��\�\"@{;\�\�\��x-�߹<\�2\�\0\�2�\"��\���\�5\�ϯ��\�\��\�s}*6]4\��{��s2}:��\�1\�\�߭Y\�\����\��\�Y����=�ˌ<\0��s\"\�z���\\�֋)]\�d=��7\�\�����78\�ϧ\�=�s~�\���\�͞\0P���\�Ϧ9���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\���\�ͻ\�nxkڴi]\��\�wSkkkjjjJ�G�N\����\�\�ɓ�L�:uÄ	�c\�\0r6n\�\�r\�w�y\�%��q\�ƥ_�\�W\��\�O�6mJ�w\�NaϞ=���#=�\�i\�̙i\�رi���]�&MZZ�TN4�\0\�{gw\�E��^|�\�)wviٲe\�\��~-_�<\�0�w\�y)w�S�(\0u\�\��\�g?\�8qbz\�\�\�\�X�re�0aB�ַ��Zkk\��F���cǎ	�\'ON\�]w]z�\�7ӑ�A\��.�袿\�\�	@\�txxW_}uڷo_:\�f̘\�\�Æ\r;\�hP3�/6iFGv4�\��\�\�ӨQ�\�\Zq\0j&Z�}xGj�\�m\�;vlW�R�h\�t�Y3�Ҍ#4C\�\�\�Ҳ\��=\0]���%�+��rOSS\�����+�ĉ\�\�\��z饗R\���:��A3��?ĕV�\��+imm\�_.�ϳ\0q-͸�X-\\{����\�,\0E\\<:��Y�=�ؾz\�,\0E\�-!.][�n\�ʡ\�i)\00(\�@�wKlq\�5��\0���Щ%���9\�sj\�\�u	=\0\�w��\�\�\�\�\�\�c�\0�fʔ)��:zs޼y�\�`\�\\q\�kku�\�\�ɓ7;O�A3ao�;�&Wd�ː�\"\0�|��ڛ\�\�\�iӵ7\\?���\�k5�.�\��\�\�\0��kmm=���\�\�Z�|��ޟ����\�幟\051~��\�q#٣}\��]�v\�onn\�\�\�\�\0\�\�رc7]{\�G󠖮�;:\�\��j�\r@M\�A%�\�\�z\�\r7�\�\�4iҫq^^lN5\�\0\�E�]p�?�\�O\�Ν;�\�&͋.�(\\Yg?\0u|�G�^}\�v=���}\�J\�ËM�:<\0\�Vl2jԨ}S�L\�\�w(�<�z\�-���\�(M�\0P��;\�]\�=ѭ�3�kڴi��,Y�o�\�\��\�~x�wK��G?��\�[\�\�bq���8\�\�L\0��b�s-ȵ6᮸-PUu\�>�\\\�qi1WZ��A�F��a#@��\�qF���\�Ç�`$\0h�\�\�:묳>f$\0h�\�=z�\�F�F��\�r��F�«T*�G�q��\0�:�}#G����\0��\�\��\�Q�F���\0�:��!\�g�\0�z��\����\0�B\�\�\\_1\04B\�\�nnn>\�H\0Pxq�������\0�:��\�CF�F���i$\0(�J��F�T���\0�:���\�勍\0�z�\�n\�F�F���.5\04B\�u\�l$\0h�\�\�\\.��\Z	\0\Z!�6V*���\0�����\�\�\�\�	\0\Z�\�[�;�\�F�F�5�n0\0^\���\\.�o6\04B\�\\*�n3\0^SS\�K�~m$\0(�r��<�\�]F�F\���\��w��\0��*�ʳ�R\��F�\�\�]ޓ9�\�7\04B\�=�C\�#@\�555=�\�a#@#�\�\�\�\�-2\0^^�RYb$\0h�Л�8�\0��\��\\\�F�\�\�#@#�ެz\�	\0\n/.A�\"3\04B\��&�ދF�\�\n\�테\0�W�T~�C\�ߍ\0�W.�o\���g#@#�ލ9�\�	\0\n/\������F�F\���\�\�[g$\0h�N\�z�\0�\�\�\�|E\��6	\0\n/wy�su	\0\n�T*]V�T�\Z	\0\n/\�ws����\0��r\�M(�\�ۍ\0�W*�����7�\0�����r��\�H\0Px9�F\�z\�H\0Px�,�\�.#@\�577��Co��\0��J�\��zo	\0\n�\\.!�^g<omm=�R��\�\�\�r��`\�ˡ�=�\�\���??�j����wǻ�]wE�g�\0�\rvLtz^�\\^n�\0h�nO�@��\�~B\�\�(�r�<��.o����rнQzی\0��;��U]\�D#@��\�\�7#�\0�W*�.z\0CTJ\�իW�kooO.L�\�\�W\�Ղ\�ҥK�r\��\�\�\\^[[[\�\�\�H���J�ڲeKZ�xqW�i�‚�O\���\��u��j*6iZ)���\�\�\�/��XY!+���z믛\�\�\'��/���\�yL�2WB(T\�\�ؾ!�8orz��\�P1-^�BWB(L\�[~�A�\�[\�ϱBWB(N\��\�O�x\�\n]	=�0��\��z��z�\�SJ\�C-�\�h́B/^�BWB(L\�z�C/^�BWB(L\�m۰,���7m\�i��z@aB/j\�S�>(�b���z@�B\�\�Ӫ\�f�i3O�׬Е\�\nzqŕ��~�}z񚫲(�\�\�\�ܦU�\�M\Z0�z+\�\�\��)��\�{�\�Nק�P�\�{?\�ݻu}V�J\�C&��\��\�-+x%�!zJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0��~j���\�NH^xaZ�jU�җ��������޹s\�\'�x\��\�柙={�Pz�\�\Z��!͜9��}\�ƍ���_<`�\�w\�\�=��W^9\�gn��va\'�\0�W�\�\�7oޜ\�x㍃\�\�GM_�\�W\�w\�ޝ�y\�o��fM��\�\����3�K�,zBz�z�\�rK�5kV��\�\�Y�\�\�ɓ�\�-�\�s�{絶��4~��\�\�۷o\�0UBzu\�\�\��+Wv?\�Gұ\��\��N=�\�\��\�m۶u�L\�(� �\�:�z7O����T\��\�d*�\0�ޠW\�f\�q\�ƥ;v����d�\�\'N\�>J3�>���_�bE��\�\�\�_\�q\�i\�\�\�OzBz�������\�͛��9#׭[�\�k�g�yfw��|ߟ\�=͡\�.B@\�)� ��\�zJ\�=%�\0��z�гBVBzJ	=@\�)%�\0���\���zBzJ\�=%�\0��z\0BO	=\0����>���BVBhmmm�;::��\�Q��\�ׯ͡\�\�/��E��h�\�\�]���ZC��w\�\�ѐ��V��`�������j.���\��+6?5B\�w\�}\�\�s\�Ms\�\��\�����%�\�7�I�2\�\�\�	<�\Z�T*kr-�\�\�ojj\�ʕ\�\��TK��x\�ȁ�o�\�\��X\�y\��\�|+s\�y�%�\��7s����\�\�\�\�\��y���t\08��7=wV;�ӿ�q\�m\�z�]\�\�<�\'ZR\0�\�\�\�\�s�\�\�\�rQ�\�%\�\�\��B���\�\�g�p8A3/�\��:��U\�zQ\�\"�-5\0و#N\�\�o�\�z��8xe��{+\�\�DK�\�\��=�ɟ\�h~�xo6\�K�\�\�F\��\�?f̘�\�Q\�-�\n��܉�ϘǘWK��Y�\�s�\�Ug�筱\�.\�\�\�U\�\�\���%�\�\Z.?ʵ{\�ȑ���\�o3f\�c\�k\�+-9\0\�\\�r�ĕO.*�\\*�.�y�y�8�.\�\\�\r��.�\��ۛe	𾴶�~\"inn��P���\����$\0\�\�{>wL\�\r\����$x���J\�\����S�Њ�O,�I\�w�D\�W\�я�E8���\�\��N�,\0��\�rg�v�\�s�\�R�\�PcE��I|�z��\0�\r��R\�kW\�\�C����Bܮ��\�/�[=\�%�\�\�g\�^y9N)p\�RO��Frl���7����;�P�\�\�{[[[�/�w�\�\�5��%\�x�.��\�J�rm�|\��]�\�\�\�\�\�\�h q#\�o6\���\�\��\0h�G��\�z��\��\rz߈\�c\��\�\��+�˫��\�\�[�\�\�Q�%\0\�ȑ#�[^᧖����:9�\�\�477�W�E\0\\^\��6��w\�\0<�AC\�zO�/�qV�\�q\�_�TN\�߽˝\�\Z\�\�ѣO��\�r\�7���w�\�ε\�\0\r&��\'đ�---���o\�I=.G\�\�\�\0�|\�w/�	ەJe]�,u�5lذcr\�\�(�J�/��\�\�l9�\�\�Ç�`�4�x�)\����:\�\����\�\� �\�1\�\�#G���\����\�m\�S4\0\�?^\�᰼h\�+w��\�n�6K�w�u\�Y\���\'׏\��7Wg\��>l	\�7$���\��tA�ώ���%�@A1/\�����\�\�#�+�w\���\�` vz~C�k\�Mrw777_a��b�fl\�\�{Ͻ8\�?O��\�\�?\�\�u�iӒ\�}�Z\���8����\��|cܒ\'\�u\���W\� K�C阖\��x=�����\�\\\��;\�_\�<[z\0Jx�\�\�U�]o\�\�f\�8=ND�\�-A\0ޗR����M�}/\��\�⚝uڙ\�S\�(\0�\�\�\�\�/\�\�\�\��|�\�w\\L:6\�\�ť-E\0ޗ\�\�\�\�sx̉�n�\�˯M���\���`�W-A\0ٹ\�{R��\\��߂z�׸1lϕd��%�\�ߪ>����\�R�,�y��\08\"������eK�^\��^\�\\.26\�\�y:\�R\���\�z6y��N\�\�z/X2\05�R:f�\�\�\�\�\�\�\�\����\�Q��s\�s\�=7\���\r�,X��.]ڕk��6�\�\"�\�\�\�RGGG\�\�\�TG�v\�\�\�p\�y˖-i�\�\�]9\0���j*:<��#�r\�\�\�/��ؤi���bs��8��bEd��� ��ꭿnJ���UZ�\��\�\�1\�\�\\	=�P��c���\�\�\���w@Ŵx\�\n]	=�0��n��^o�_>\�\n]	=�8��\�#?0�\�5+t%�ދ�8`\�\�kV\�J\�BO)��Ћ�5\n�x\�\n]	=�0��\�\��x\�\n]	=�0��mò�\�\�S޴��\�kV\�J\��	��5O���ЋiV\�J\�\�\n��\�N��q�\�<-^�BWB(D\�\�W^~���\�\�k�ʢ�0�C/wp�V-J/<4i��\�xO�Wק�0\�Bｺ;]�z@aB\��tw\�\��Y�+��\��[���\��\��L\�)%�\0���\���RBzJ	=@\�)� ��\�zJ\�=%�\0�^o-Y�$�t\�IiժU\�\�O;\�#�\��g\�jBz�QL������\�\�c�{\�ڵ��\�w\�}w�g��\�+�M\�B���q\�\�\�`z\�G�\�N�۶u��\�~\�=mmm\�\�SOM˖-;\�\�>����\�ӧ�Ǎt׬I��ԧ�\�ݻw�g�y�\�\�\�\�g�y\�i��\�\�A<k֬\�y�\�G>��z\�)� �\\\�\�r\�-\�\�{\�M���p@\�\�kW\\qEw�\����\��\�?�я��\�\�P?~|�{�o\�~�\�\�3{�\�\�\���r\�J� �\\\�\�&\�x�馛\�y-���6nܸ\�}s\�_}w��\�4�~��~é�k�\���\�ޮ���\�qݺuB@\�\�\�\�\r�\�M�s\�\�\�ބY��͛7Ե�3�\�n��\�{�ό�Ǿ��3g�c�=6\�ܹ\�>=\0�wd�w�b\�&\�x>bĈB蓟�dw�v\�g�y��\��\�w�bŊ\�\�bSgߠ\�3\�H\�\�|\�3i˖-\�kz\0B\�+Be\�\�_\�}\�C쟋`;\�S\�\�X����\�A)Q�\�Q};��>3�\�\�\�oW)�\0��z\0BO	=\0����\�SBzJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0����\�SBzBO	=�Q\�}ଐ�\�\ZB[[\����+euTk���ks\�u��jjѢE?Z�xq\�k��f嬎Z\�-X�`o�i�‚\�+����\�ߊ\�O꽫R��C�N�0\r6옦�&��\0(��#G��\��!�3\�\�\�r�\�H\0Px9��)wzB���Sr\�\�7\0^KK\�i9��	\0\n�R���Co��\0�B\�\�z{�\0�W*��\�\�{\�H\0Px9�\�ε\�H\0Px�JeT�\\\�i$\0(�x\�\�No��\0�:�q9�\�0\0^�T�v�׍\0�z�\�\�\�j$\0(�\�\�\�)\�r�\�H\0PxMMM?ʵ\�H\0Px�˛�Co��\0�B\�zk�\0�z7\�\�{\�H\0Px�J嗹^6\0^\��\�̵\�H\0\��ww�\\^f$\0(�R���J��\0�:�9��0\04B\�\�\����\0�Boa��F�F��|F�F��r����\0�B\�8�\�H\0Pxq�B��`$\0(�r��Bss�o�\0�� �K�	\0\n/.6]*�n3\0^�\\^\�\�\�<\�H\0Pxqٸ���\0�:���ӻ\�H\0\��ަJ�r��\0�:��\�\�M1\04B��5ץF�«T*\�sM4\04B��F�qF�F���i$\0(�#F����\�s�Xz;s5\0\n�\\./\������\�\�\�\�\�\�\�\0CZKK\�i\�zݕ��#@!\�`{~���T*�uy\04D��\��pr��\�\'��\��\0(�R���~B\�V#@!\�\�Xx��\rv�Q��\�\��yU��~bD\0(z��9B\�_�\�6\Z\0Fl�\���\\m��\�\�\�{ K�m�ڛ��g8��!\'.=��lq�=\�ubz\�s�\�\n.q\�2�@\�wv9�\�a�%\��v�\0u\�\�\��|\�\�v�\r�q\�ƥ�o�9=��\�iÆ\ri�\�\�)\�cGGGz�\�\�wܑ&N�\�߉\�\�T�@݈�2[ZZ�W\�����\�@۷o_z��{\�4iҤ�\�ו?�Q�.�zsf�4gΜC\n��z\�\�\�\�ڷ\�|\0\�Nl\�́\�U�)�\�_NG\�_��t�\�\��\�\�	@M\�A+\���\"�bݑ�W|��\��-\0�8J�z�\�\���\���l\�|\�\�0h\�<�\��x�\�h�}|\���b���\0���ϫ�\�ܳgO:\�.��\�\�͜\�-\0��ؗW}��8-a0,[�\�+�\�:\�\�\0ਊS�^9�SU�	\�q�NK���\�\�\�\��s뭷��4s\�\�.Sfi\0p�CoKo�ĥ\�SlJ�\�Ĺ\�\�\0\�\�a�\���M�6\rj\�\�y{շ%�4\08ڝ\�;�\�{�\������[\Z\0Z\�Ղ\�@�\0G�}z\04R�\�\�M\0\Z&���@c\�\�U��\"\�%�\\\�,\0���f\�Os\�M\0\ZB\�Ӯ�.�\�\�M�4\�]\0|q?�>]\�@�t{m�u\��s\�9ǝ\���\�\�\�\�\�\��\�Z\�<�#}^\���\�7k\�\�k�t�R\�\�՛9#��T\�^u\�\�\�\�g\��e�}�:�bSg\�\�;��[b^�M�\�\�M5\�\0\�]��\��\�s\��i	�\'O> \�\�s\0�|_�\�\�W�\�3�\��\�Ov_���\"\���\�\"\�J+\�\'�W\�óI���T\�y����V\0�{q_\�Ҟ��r\����\�J�x\�\�\��e����,\�Vgt[�oKTu9�\�q�踖�K�\0\0\0\0\0\0\0\0\0\0\0\0\0�\����\"c<O e\0\0\0\0IEND�B`�',1),('5002',1,'processes/Entrust.bpmn20.xml','5001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('5003',1,'processes/Entrust.Entrust.png','5001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�g\"\0\0*�IDATx\�\�\��\\e�7�\�*��Km�ReQ�JQEaY,��e\�.�ee�L�tO&��Q \�x\�2K��P�B��*���P(���(�	1�bH !&$!$!�@r����u�\�}.\�}~���z����\�93\���\��!C��<�\����Oy~\�\�ny�<�hʺ��?���/��ϻ2��kϋ\�D���\�\��\�Ϟ^\\���mʿ7d����yC\0h,�\���\�/�ۉ\�y\�Z�/��Z�|�~fj?�\�\��\�t\��՟;ss�OK��K\���vx\�y+��\�\�\�mɯO���\0\r\�<�v\�g����-\��n?z\�m�_\�%4\�ImFj?�\�M/�ۇ.�\�\�E�\�𼱵\�\�M\��T~���6���j4\�(\���MO\�\�\�\��̆جs{j�I\�릭^�n��\�~2oKl\Z�6�\�5\���X\��s�?��>徵��jAr\����\�\�ڈ 6-��Qq�xl\��\�\�׾�:�?Ě}jǤ�\��\�:��\�EG~Ã�gNݔ?��6\��c;>�:�\�\�dt\��.z6n�;\�\�*\rЀ������]��<:�?��?{\�oW�������_�\��kϻz�k\���?�l�&6��\�O\�����\�\�\�\�H�gg�\�K�[U\Z���N��\��\�5�Y�=�\��sf-ϟ�\��\��\�\�6k\���k���\r�u�\�\�\��\�x\�Ol��{�a�}&�F�\Z+\0ڪ�~�\Z;o\�\�UO\���\�vdj���ѵ�\���ԎJ_̩>�\�\�>�{�;��0/\�/O�\��\��\�>�V\�\�\�_��g\�1*\�X!��կ?�|�ϽwM�\�w/�\�\�߮~\"O-�|����\�0}��I�[��\�.�\�\�82��\�k�}t\�\��\�\�\�Tk�_ D\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\��a�\���o�\���&M\����=\�\�\�\�G��wvv\�_�\�W�	&l��\�_\Z;v\�\�T�,[��\�\�[o}�+_�J~\�\�\�?���Gy$_�|y�q\�\�<l޼9_�re�\�c�\�\�v[~\�9\�\�cƌ\�:~���\�\���\�|k�GL�6m��矟�5�|\�ܹ=��ޚ?~�F\r�\�g���Q\�\�*\n\�Dk�\�^{\�\�q\�\�\�s\�\�\�ĳ\�>��;6���rWW\�a�\��֭[7v	�u\�]����\�y_�\�F�z\�wޫ64� \�\�+�\�\�z뭼�\�x\�1\"xe\�С��6@�}\0�	(\�\��#\0j��\�|\�ȑ�U��\�N\�\�\�W��v�i\�s\�\�Z.�ǩ:@�\�@qP4bgqGG\��\0\Z@����K/�t�#\�Q}�Agǉ`5\n�y\�g�4x\�Nb�A4y�\�\�ƙ���3xW����dYv��\00Hb.��\nb0\\}�\�o�1b��\00Hb2��h0<��\�o�Xb)\0��\r4&��W�ޚB�\�R\0$1\rtm6Ё\�\�TԖ� �Nx0	�At\�g\�H`�\0D_�\�\�m��ʕ+7\�\'\00�.�\�\��::\���\�_\�\� �At\�%�,��&L��\�y\0�h\�ر_�k\�\�1m�3�?��\�A�gώMA\�l^x\�W]uՀ��\�ѣW�E�\�\��\�/n�?�����\�\�1\np=�1f̘	qa����\�o���R�lve1�s\�9\�,��\��s\'�\��+�,[�\�\0\r&vҦ�\�n��?�`\���\��\Z\�\�\�\'\�h\� =z�\�\�|\�;��\r�l\�y\�;��\�\0\�A\�\�ٹ�K_�\�֧�z\�w\�>�\�d\0\�Db\�\�ȑ#ߺ袋ތ0ؗMD�?���\�\�P=\n\�N`�fk\�i-��6?jԨ��&Mzcƌo�X�bK\\�6hL����� \�L\�\��\�<\0�\0ZD\�\�;S��\�\�q}༮u\�6�\�f\�T\�(F0\�\'N<X%\0\n\Z�G�>T%\0\n\Z\�\�\���\0\���v�8R{�J\04�,{�J\0P�\\\�\�\�\�v�J\07�W	�\Z1b\�[\�\�\�V	�b�@\\,�#*P\�(�J\'�@�\�\�\�Ç��J\03�\�\�\��U%\0\nhĈ�J�\�0�\0(flLm�J\03\�(\'*P\�X�Q	�b���\�\�T	�*�˯��%�\0(\�H\�\�\�\�S	�b�֦6N%\0�9X�\�7T��#�եR\�\�*P̑�\�\�&�@1C`E�e�@1C`yj��@�Q�\�J�r�J\0s$�\�r�|�J\03^L\�z�\0(�,\�V*�U��#�\�\�\��T��!���\0\��gR��J\0P�e�Sܮ\0\���)\�P	�J0\'�;U��!�Dj�V	�b����ݣ\0\��\�Y�ݧ\0\��?���\0T.�g���\0A�\0\��ɱIH%\0��\�\�a�\0(�R��\�r��G�\0(fܝB\�q�\0(f�*���T���,�ň#�R	�b��\�R\�S	�JpkjO�@ť%\��*P\��A\\l^%\0\n�R�ܘe\�B�\0(�4\n�>�U��\�\��\�)��\0T�T�ʲl�J\0s$py\Z	,S	�b�.I#�*P\��(��J�\0(f�O!�J%\0\n�T*]0bĈ5*P\��j�\\~E%\0\n(�\�K\�U�\0(�4\n�Rj��@1Gg��N%\0����W	�*\')\�P	�b����Q%\0\n�R�|>˲M*P\��l\Z	t�@�\�\�SRlV	�b��\'�\0@A\�N\�\��=�%*Кk��\�)J�\�i*P\�\��bhaY�M\�Utttd*\����u���\�L$.\�1\�\��*P� x�.\\]�HҚ���Q�8(\�h@%\0\n�T*}[\0�<\�Y�p\�ٳg\�S�N\�\'O��\�G�2eJ�\�CmM\�FU@ӈ\0�9sf�r\�ʼ��[;��jժ|��\�[S L�4���\r�420\�5\�b�λo[l�4�\�t\�B\0�m\�_]�/|\�\���)�\�\�\�\�O�/��uk_\�\�\�?!\�\�on\�\�xL\�/��%��S\0\�\�\���\���\0\�\�!�̃��\��\�t�B\0h\��7y\�.C \��@hB\0h\����v�_\0-fݰ\��\�t�B\0h\�X�\�\�|\�\�)(\��\���\0\�\�!m\�\�?\�)\�>��\0Z=6m\�<|\�Λ�\�}�_\0-\ZqF�s��\�\�>�x\�Y\�B\0h�Hk�\�L\��|\��]@�\�s\�FB\0h�\�\�ڿQ�\0Z8�f\�w�! �&��\r�ZB\0h\�Є\0 4!\0M\0B@�Є\0 4!\0M\0B@@�B\�\�g�͇�?��\����ޛϝ;7?�\�#�\�g_x\�������_���1\��?�\�{����5ѹ��\��|\�\�w\�}�\0\��yժU\�:\�\�d\�v�\�\�{�x^�Gϵ\n-\��~O\�!ϻ뮻�\��\�q\�=?\�\�c�\�r�\0����Z��Z3g\�\�O8\�\�\�\�\�̙\���Y�fm�oÆ\r=��/\�\�\�\�7߼\���\�\�\�	�\�����Z�dɒ�I|�e\�ҥ\�}��7\�O>�\��\�I�\�\�~�\�u?��\�\���/��Ϙ1C\0B\�@B :ܸ\�k�\����q\�=���\�o\�|���F�\�_\�曣�:j�ǎ>�\�\��\������\����=�M�:u[�\�m�C�0\Z3fL\�}k׮\�uTS{O#@`{\���\'��SG�Ӵ\�\�\�\�W^y\�v�\�)\�;\�\�\�\��}\�c\��YV�X\�s[?�\�݈E\0B�C\��@O�\�[\�\�\�߾ˀ\��\�IB\0{\�b;����\�6M�4i\�\�g�y\�\���}WWW\�H��ö�C>�\�{:\�w�\��q\��\�ccǎ\��:\�=��>�O\�˖-۶\�z\���\�q_l\Z\�-\�\�cs\��\��>!\0��\r�\�8k-ֶ\��m�c8v��v�O��_{�v�\�iGHD�ԇK�\�I\'��\�kFh�\Z5�\�5c\�n\��\�E\�Ϝr\�)=��9{;\������N;��\0 4!\0M\0B@�Є\0 4!\0M\0B@���\0! \0��\0B\0@\0! \0��\0B\0`0\�\��:n!\0\�̙3��\\�R\�\�Gm\�ҥ�St�\��´i\�.�>}�֗_~����믿ާ0eʔ7S�\�/h\Z�Ӻ8����\��\�F�ѧ���9rd~��\��\�kv\0�~!\���!^�\\.��T*7:��(HdYv_�n��0\���\�#T�\�C u�\�և@]ےڔG�<@���Yg�u\�.B��ʹ��C�:\Zؼ�\0H�mIm�\��h�\�]��\�8|��O�<@k���^\�M;���;��1\n�T*?Wu�����ê��\�\�.��\�(\��\�#����\0-\�\�^�\���4�(\��V�eǩ>@��n\���\�^u�(@C 9(�\�˩=a	\0/j\'�\�t\�Y\n\0�\�{�\�J�\�i�@�B ����bD�\�{-\r���@5\�ϱ<}y�%P�=z��\�r���-���@�T*\'\��\�v��P�\�\�\���d\0\n\�\�sgjoĴ�@�B���Ŕ�@C`ذa�ǌ��\�n	,B�T�T\�Ȳ\�lK	�`!R\0\\GuttkI,B�\\��\�Z3�0&N�xp��+Ө\�1K�`!:;;\����Ֆ@�B tttd\�G�Yj\0��e\��\�\�\�5jԑ�@�B�\Zs\�g^6Č�\0\��ꌣ��\�}��P��~\�\���}\�(X�,\�Ώ\�#G����P�)\�Ja����\0�\�\�_�\�_,I��@gg绫3�\�ji,B�\\>�zE�/X�\0�P�T.I�˛mmm\�X�\0�\�\�23�^ioo�%P��G�,[��\���,@�B �xlJ��,]���@(�͖��}\�(XT�\��u�~�\�ﱔ\n\�\�m^j/Y\�\0����w�\�o]�e�Y\�\0�j|8f-�JX\�\0�\�\�86v��G,q���@H#��\�\��\�SO}��P����f(jČ�Y�mJ��O-y���@H!�q�T*�a\�B�`!P��/KaSK\�/\0\���g��ƌ��(��q�\\.�N��G�\0B�����>X�q�J	�(\�\�_�\�*�\�g�5\0B��J�ҏR6�q�e\��Ԗ� \n�6\�h�\\�W5\0!P@\'Ɖd)��\Z�(�R��\��\�NR\r@�&��qV.���\�<��(f���v�j\0B��\�\�\��5N$K5\�T\r@�>W�qŮ\�\�q4&�S\r@LL7!a�\Z�(�\���b�j\0B���\�ű\�X5\0!P\�z\���\�!���b\�\�8�L%\0!P@1�DL+\�K� �Y��b���pN5�f\�VD����^��NL9ASP�\�!й�Ȳ\�b�ڧ �7.F�Q\r��`\�nB`\�СCQ�}���\�S�\�ԣ��V{�\n�@}�_w\\�^5�f�\��\r�7\n\��J\�\�G+�4\�h���>	��R-\�\�\�\���j\0�ˌ�^\n\�G҈`�G�F\�ή�U�o\�\�8:K5�F\r�\�0\n\��=:6�v�j\0��\�\��R\�8�,\�gT\n&\��C.\\�d�\�\��ԩS�ɓ\'k�ѦL��?�\�C[S��IC��)6uvv�\�H�̙3�+W\�\�\�\�\��U�V\�ӧOߚaR��_R[\�\n$F\0�o� ����o�6\�h�T�\�Dl\�y�m�\�C\����e\�G�\'���\���[\�K#�R�\�\�\��a�! z\��W�\��q>\����:\�\�\�^TG��q�@O[���|\���\��\�v-\�\�t��!��K�\��_�%��S\0\�\�\���\��[4b\�\�r�ܝ\���@�C\���{�!�\��[3���\�Ŏ\�\�\��[��!0o�\�]�@<�\�o\�Y�M��%\�\���ǀ�\�\�\��\�8\n�8\ZhW!�\��[?b\�\�r��J\n���k�`!�`\�\r��xL\�\��!\�\�ڎ�\�B�J\��9P�X�\�\�|\�\�)(\��\���!��3�>�\��{� !m\�\�?\�)\�>�~�B�\Z�� \�h\�Q(Jlڔ/x�Ɲ7��\�1�B�\Zϙq\nqF�s��\�\�>�x\�Y\�\�����ò,ې\�\�.�EЊ!�\��/�������Z�\�\�s�\n�a\�ȑ�\�R�\�?	Z(���oT jF��q4��o�	��Y�\�ݨ@L.Ե�S\0<�F��=�P�Q\�!��PkB�X!���`Y�es�GA��&�ըQ��LAН�\����@��T*��\���,B��R\\�F�;;;\�\���(�,\�KA�Ҍ� �@\r:��4\"X�\��a �@utt\��Q�\��\�@�bn:;f-�J�R\rB��R\�3�6\�pՀ�g�}6:th��\�O\��\�{o>w\�\��\�#�\�\�\�͘1#?ꨣ��|}\�\'�Y�y�\�w�\�\n��-R	h�H?��Z�*_�fM\�\�\�\�\�\�ٳ�\�Q\�?/n\��ŋp|\�w��\�/� \ZD\�8�B\��\�\�T\rh�\�A�\�\�fΜ��p\�	=��\�}˖-\�y��>�\�\�?��\��\��\�\�3������\�=�5\�\\�\�,Z�s\�1۽\�ƍ�\'�|�\�\�\�\�k�r\�)��a\�z�鮻\�\��,o�\��\�\\��r���\�?�n\�U\r(@Dg�E�]�zܸqۅ�\�7ߜ\�y\��?�\�?n\�\�\�c�\\rɶ��\�+vz,��������\�o߮�3fL\�s֮]�Ө��׬�Bj�G@\�m}h	��Q�T\�\�C\��Հ�c�=v�m����M6q��\�\�sb4��{\�=\�������\�~\�MIK�.�\�\�\�\�5k��\�\�\�\�%K�@?Ȳlr\Z\r�f\�Qh���>�\�c\�c\�:�\�&�{g�O�ϭX�b�\�5jT�k\�}�=�f<?�%\�v\�m�;\��|Æ\r�	���qty\n�9J-�\r>:\�Y�f\�9hҤI۾>�\�3�\�S\�_���m\�)}�\�=k��\�\'�\�T��m��#�\�\�4�cp\�\�5\�H��O>�g\'���}B��xo\�/��\�{�M\�O�:u[�5��ñ�v_t��\�\�\������\�\�GG\�q\�\�r�L�\�\�B\'v�F�}�G\n�z\��̵��GB��J�\�b\�\�\�U�|$�	���F\�ňଳ\�:J5@�bn\Zz\"��ӗ�!P01\�h\n�WS{P5@�bn:�z��E�B@s�\��gR5@�J#��\�C\�\�\���\Z �@����Y�-T	B��b�B\��\�~�\Z �@�J���W$��j��B`B1\�\�\�v�j�\���qA�K�\Z �@�Č�+\�\����(��W(��\�?T\rB��RܑB �����U��(�\��\�R=��|Հ~�\�븅@#ʲlZL5=|��O����3gnY�r�λ�\�ҥK�\�����\�\�\�ߖ:��Sl\�\�\�8VE�M�6\�\�ӧo}�\�u\�}\0S�Ly3�I���;\0\�\���*�\�G��\�i]�\�^\�\�f�Fm�c��?_�u��\�\�\�����ץ��s�m&N�xp��J���\���Ժ\�r~X5�\�=�P!\�\�P�^T\�\����\�0!КJ�\�qhjW�Ы\�\�\�w�֓e\���\�\0��\Z�.�~�\�\�I�\�V�h�\�7���i�~N5�݊�cR�!Z@u\'��\�6��!�(\�\�\�SO}W\Z,I\�\0\�U`�����:�-*\�ܣ��6@j�\�\�\�ߩ\"�����B�yutt�X\���D�� �IZs�pG�ͧR�|>-�7S��F5���:���@�ɲ\��\�9\0׫�\�bJ�X�T��\n�I\�s\0��\Z�)�J��y\�U�iB��1rKAЮ\Z@_t*���pP\��I˪{\�ȑU�OT*�\�FǢ�+&�K�0�k\���*�e|>u,�T�1U��X�ڲ�(��\0}*u.\�\�8s�h<qGZ6o�6/��P�\�utt��@��J4��L>Gm�\�ɪ��r�<2.:�\r\0g\�Y\�)~�\Z@��Rg�^%\ZC�R��\Z\0T��θ\0�J��~Z=�S5�Q*����Ġ���6\�\�{�\�H \�yU%G{{�\�\�2x66\�Ŵ\�*���9.��*1��\rvx\��W��2���\"��K\�7R[�>;:�Ť\0~n\�С��0(J�ҷSG�Z%�\�\'\�T�\�T\r`�Gbs�JX�+1hj��\��\�\�\�^V��uU�L5��P.�/M�\�r�\�_Y�}�z!�/�\�H#�+R{I%�5\0\�y�b\�n\�\0\ZJ꘮J�\�R�\�{1�g\�����@S�OP�\�\�\�S\'�W�\�[]]]�E��ھ2jԨ#UhH���>�U�\�tvv�/\������SE���\�V��F�T�\�B��\�6��>��=HE�F��R<��R��\�\0�zޥ\Z@S(�J?��T\�G\0c���^�\Z@3u^����\�՝\�\0\�Th��5��Ub�GR��M@�)H5���e\�\�R\'6O%�\�A�n�VwD9�f\r�_\�	M*��\�\�T�E�����дRGvgjsTb\�ĉ_q���j#NS�\�C\�ש=�{S?��\��͍)!Th��\'�m�\���kL�\�����r�|oZ�}D%v�_Lu\�\'֩\�j\���=���\�e\0�Je�j\0�\�\�Mq�\�]��n�N1R5���eٴ\�\�\�P��\��\�6�\�|R5�V^۝A�3t\�\�Cb\Z�\�ַ���\"@����!��d�\���S-V���<lذ\�U(B\�v\�\�!�\�k�1\n�р��\��\�8L�\�5(�J�J5\�l\�P\�x,u~�)\�\�G�\�@1�����!�dQ���:�\��\�.��\0RL�\�p���8\�_P\��\�\�\�Q�\�{ \�����\0E���C���k\���~\�?\�L�mmm\�[�@\�ť%��S4\���k\0ĵ\0N?���X�\0�8;��V�\�\�_\�r��\��=�PK\�����\�~ت�_\\�7��\��\�ۃ,q�:�s|�U\�\�O���\�9\0wZ\�\0����\�k�߫T*}5u�[\�\����v���8��u��;\�\��\�XK`�#�%����:�_\�&��;�f\�\�y�yi�R��~��R�=�~�M\'Z�\0{�\�,u��7�\�\�\�\��\�ج�ګg�u\�Q�*�ޏV���%\���G�\Zud\��_Imɩ���.K`\�F/�6�I?��Rۘ�lNL	ai\�{G�*�Tn\�\����.�\�Y�\0�ߙ�N\�[\���K�җ\�\�J�r�%p`!�&�o4\�獝\�\�s\0�e\�x��6�q\��Y�,�Y��>oْ蛑����\����u�J��-5��	�\�\���\r:��\�L�\�\�H\�hK�oװ�s=�?[gg绫G/�6l\�\�@߇��48�\�>WGGǱ�\�R{����m�@����\�*�����\���6���%Џ\�\�i�;k�\���8�\\.�\�\�\����\�J�rz�|�	��ߒ�\�bK``:\�Mi\�{X�\0~�>ϙ�\n���@w\Z	|v�?Ô\��F\0��D\0�ޜ\��O����~R\�??vN�\�\�,\r��	�OB\0�Cz\�\�\�W�v�%08!�f\�?>�\�\��ߟ\����\�/�=�PK`�B\�\�N\Z��9r\�Gc?Dj�ӷY\0\�\�\�ux�=��\��i\���nai\0�8\nhO!\�_j�kT/s�%0x���\n�r��9f\�\����z!��,�\r�\�( \�ob\�sz\�ϫ>@Ȳlao��xpPz�\'cZ�����:@�(�J�\��þ��^�\�SO}WzͿ�\�\\�n߫\�\0\r&u\�\�\�`C_��ӯ^�xI��J4���X-\�\�\���x\�\�\��R\0�i\�ĉ�2@c�VD\��Z1i\n�7\�\�oU�9B���\�O\�t�=���[=�Uh����\�qIk�WF\0��\�	\�\\�5�\'�����#��h�\�S��P\��/\�\� �	\�\�\�r�@\�@\n@\���\�\�NL��:�\�,{���\�\�	\���\�\���`\\�%u��\�b0}qD\0�\05�n\Z�\�?\�Ieq9ȸ,�r�^\0\���ڈ �A��Lm�R�v\0\��ܖc�=�\�84��(%@1�ǻ\�����������韌\0\0�<\0\�z�?�\�\��n��C=��	\0\Z#\0�2\�og�e7A��\�\���!\0\Z7\0�T\�\��\�[\�@�ݴ�\���`W|}\�\��}>���\r�=��{\0�\�E\04O\0\�.��!\0v�\0�$\0v�\056\r������}���{tW\�\��U�(�`pG{�i��G�[\0��O�6��MA\0M}yt�\�\0\Z4z;j��\�\�\� ��va/k\�}y\��$%h�A\�$\0\0�lDP7\rٻYD\�\�|\0�&\�6|\0\�b#�}	\0\�\"#�}\�\�\0@��f\�P\�;�\n9\"�\�C\0\0�\�\�/\0���\�º\0p&0@�\�\���1(@1G#F�\�\0@AUC\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0�\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0\Z�\�_��\�z�h\�\�\�SdYv�J�n�\�M�:t\�!�P�\�@�\\�\\�\0Z?z\�7�\�(\0����\0�ˌ\0\n*���]�@�F=��\0Z\\t��Ɵ\�\�\�a�\�;\�x+�5�ͮT*7vuu�j\0M���\��ԱOO�\�8[��p\�-Y�\�O�WE�&\\�O��}��\����\�E�md\0\�$��\��q\�\��\�s\�\�o�\���G\�_z\�|\�ƍy�ە+W\�O<�D����$7n\\o\�I�Q*�NS]�G�tttl�\����\�o�t�o��V��\�̙��?~\�0\�\�|���\�?)�{\�g�:�\�w\�}yWW�\�\0\ZYlJ��~\�\�s\�=���_|1?���\�4\� b\'p�>��\�\�ߗ\��\� �\�Y\�\0\�(��M@}5\�mD�æ�GU`\�y\0��b@�}��b3��\00H\�D����6oޜ��o}\�[���\�[\n\0� �ԟ	����s\�nwfqjGX\Z\0,լ\�| ��\��\�b�!K`�U\'�\�\��\�\�\�\�n\�nZ	K`\�C`\�E\�c*����\�6	��4\0X\�|�\�X�|���@�7P?\r��0�#�mqm2��\�W���� ��`\0FB\0`0\�\'\0P쑀��\0\n\�\0(��~�`�1���|\�\�\0�)\��\��\�(��ӿ~с\r\�_{\�,�\0�(�\'�{t=�\�fԕ\�\�8\�Wh$q�߸\�o_cx̘1�1ЈJ�\�i���\"�jD#��\0����Su�\�\n�\� 6\r\�>�\�Y�\0v\����U�	��v\�М9s��0\�	&l\��\�\�\n\0�\��\�\��\�o\"�3�{챞��j�\�\�ml󏠈3�\�O�\�`@�����G\r`{\�N`�&\����\'\�\�,ޛgǉ`�J峪\�\�b��\�\\C1:XU?\ru\��kc2��\�T\0\0\0\0\0\0\0\0\0\0\0\0�\���\�\��l\�\0\�\0\0\0\0IEND�B`�',1),('7502',1,'processes/Entrust.bpmn20.xml','7501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('7503',1,'processes/Entrust.Entrust.png','7501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�g\"\0\0*�IDATx\�\�\��\\e�7�\�*��Km�ReQ�JQEaY,��e\�.�ee�L�tO&��Q \�x\�2K��P�B��*���P(���(�	1�bH !&$!$!�@r����u�\�}.\�}~���z����\�93\���\��!C��<�\����Oy~\�\�ny�<�hʺ��?���/��ϻ2��kϋ\�D���\�\��\�Ϟ^\\���mʿ7d����yC\0h,�\���\�/�ۉ\�y\�Z�/��Z�|�~fj?�\�\��\�t\��՟;ss�OK��K\���vx\�y+��\�\�\�mɯO���\0\r\�<�v\�g����-\��n?z\�m�_\�%4\�ImFj?�\�M/�ۇ.�\�\�E�\�𼱵\�\�M\��T~���6���j4\�(\���MO\�\�\�\��̆جs{j�I\�릭^�n��\�~2oKl\Z�6�\�5\���X\��s�?��>徵��jAr\����\�\�ڈ 6-��Qq�xl\��\�\�׾�:�?Ě}jǤ�\��\�:��\�EG~Ã�gNݔ?��6\��c;>�:�\�\�dt\��.z6n�;\�\�*\rЀ������]��<:�?��?{\�oW�������_�\��kϻz�k\���?�l�&6��\�O\�����\�\�\�\�H�gg�\�K�[U\Z���N��\��\�5�Y�=�\��sf-ϟ�\��\��\�\�6k\���k���\r�u�\�\�\��\�x\�Ol��{�a�}&�F�\Z+\0ڪ�~�\Z;o\�\�UO\���\�vdj���ѵ�\���ԎJ_̩>�\�\�>�{�;��0/\�/O�\��\��\�>�V\�\�\�_��g\�1*\�X!��կ?�|�ϽwM�\�w/�\�\�߮~\"O-�|����\�0}��I�[��\�.�\�\�82��\�k�}t\�\��\�\�\�Tk�_ D\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\��a�\���o�\���&M\����=\�\�\�\�G��wvv\�_�\�W�	&l��\�_\Z;v\�\�T�,[��\�\�[o}�+_�J~\�\�\�?���Gy$_�|y�q\�\�<l޼9_�re�\�c�\�\�v[~\�9\�\�cƌ\�:~���\�\���\�|k�GL�6m��矟�5�|\�ܹ=��ޚ?~�F\r�\�g���Q\�\�*\n\�Dk�\�^{\�\�q\�\�\�s\�\�\�ĳ\�>��;6���rWW\�a�\��֭[7v	�u\�]����\�y_�\�F�z\�wޫ64� \�\�+�\�\�z뭼�\�x\�1\"xe\�С��6@�}\0�	(\�\��#\0j��\�|\�ȑ�U��\�N\�\�\�W��v�i\�s\�\�Z.�ǩ:@�\�@qP4bgqGG\��\0\Z@����K/�t�#\�Q}�Agǉ`5\n�y\�g�4x\�Nb�A4y�\�\�ƙ���3xW����dYv��\00Hb.��\nb0\\}�\�o�1b��\00Hb2��h0<��\�o�Xb)\0��\r4&��W�ޚB�\�R\0$1\rtm6Ё\�\�TԖ� �Nx0	�At\�g\�H`�\0D_�\�\�m��ʕ+7\�\'\00�.�\�\��::\���\�_\�\� �At\�%�,��&L��\�y\0�h\�ر_�k\�\�1m�3�?��\�A�gώMA\�l^x\�W]uՀ��\�ѣW�E�\�\��\�/n�?�����\�\�1\np=�1f̘	qa����\�o���R�lve1�s\�9\�,��\��s\'�\��+�,[�\�\0\r&vҦ�\�n��?�`\���\��\Z\�\�\�\'\�h\� =z�\�\�|\�;��\r�l\�y\�;��\�\0\�A\�\�ٹ�K_�\�֧�z\�w\�>�\�d\0\�Db\�\�ȑ#ߺ袋ތ0ؗMD�?���\�\�P=\n\�N`�fk\�i-��6?jԨ��&Mzcƌo�X�bK\\�6hL����� \�L\�\��\�<\0�\0ZD\�\�;S��\�\�q}༮u\�6�\�f\�T\�(F0\�\'N<X%\0\n\Z�G�>T%\0\n\Z\�\�\���\0\���v�8R{�J\04�,{�J\0P�\\\�\�\�\�v�J\07�W	�\Z1b\�[\�\�\�V	�b�@\\,�#*P\�(�J\'�@�\�\�\�Ç��J\03�\�\�\��U%\0\nhĈ�J�\�0�\0(flLm�J\03\�(\'*P\�X�Q	�b���\�\�T	�*�˯��%�\0(\�H\�\�\�\�S	�b�֦6N%\0�9X�\�7T��#�եR\�\�*P̑�\�\�&�@1C`E�e�@1C`yj��@�Q�\�J�r�J\0s$�\�r�|�J\03^L\�z�\0(�,\�V*�U��#�\�\�\��T��!���\0\��gR��J\0P�e�Sܮ\0\���)\�P	�J0\'�;U��!�Dj�V	�b����ݣ\0\��\�Y�ݧ\0\��?���\0T.�g���\0A�\0\��ɱIH%\0��\�\�a�\0(�R��\�r��G�\0(fܝB\�q�\0(f�*���T���,�ň#�R	�b��\�R\�S	�JpkjO�@ť%\��*P\��A\\l^%\0\n�R�ܘe\�B�\0(�4\n�>�U��\�\��\�)��\0T�T�ʲl�J\0s$py\Z	,S	�b�.I#�*P\��(��J�\0(f�O!�J%\0\n�T*]0bĈ5*P\��j�\\~E%\0\n(�\�K\�U�\0(�4\n�Rj��@1Gg��N%\0����W	�*\')\�P	�b����Q%\0\n�R�|>˲M*P\��l\Z	t�@�\�\�SRlV	�b��\'�\0@A\�N\�\��=�%*Кk��\�)J�\�i*P\�\��bhaY�M\�Utttd*\����u���\�L$.\�1\�\��*P� x�.\\]�HҚ���Q�8(\�h@%\0\n�T*}[\0�<\�Y�p\�ٳg\�S�N\�\'O��\�G�2eJ�\�CmM\�FU@ӈ\0�9sf�r\�ʼ��[;��jժ|��\�[S L�4���\r�420\�5\�b�λo[l�4�\�t\�B\0�m\�_]�/|\�\���)�\�\�\�\�O�/��uk_\�\�\�?!\�\�on\�\�xL\�/��%��S\0\�\�\���\���\0\�\�!�̃��\��\�t�B\0h\��7y\�.C \��@hB\0h\����v�_\0-fݰ\��\�t�B\0h\�X�\�\�|\�\�)(\��\���\0\�\�!m\�\�?\�)\�>��\0Z=6m\�<|\�Λ�\�}�_\0-\ZqF�s��\�\�>�x\�Y\�B\0h�Hk�\�L\��|\��]@�\�s\�FB\0h�\�\�ڿQ�\0Z8�f\�w�! �&��\r�ZB\0h\�Є\0 4!\0M\0B@�Є\0 4!\0M\0B@@�B\�\�g�͇�?��\����ޛϝ;7?�\�#�\�g_x\�������_���1\��?�\�{����5ѹ��\��|\�\�w\�}�\0\��yժU\�:\�\�d\�v�\�\�{�x^�Gϵ\n-\��~O\�!ϻ뮻�\��\�q\�=?\�\�c�\�r�\0����Z��Z3g\�\�O8\�\�\�\�\�̙\���Y�fm�oÆ\r=��/\�\�\�\�7߼\���\�\�\�	�\�����Z�dɒ�I|�e\�ҥ\�}��7\�O>�\��\�I�\�\�~�\�u?��\�\���/��Ϙ1C\0B\�@B :ܸ\�k�\����q\�=���\�o\�|���F�\�_\�曣�:j�ǎ>�\�\��\������\����=�M�:u[�\�m�C�0\Z3fL\�}k׮\�uTS{O#@`{\���\'��SG�Ӵ\�\�\�\�W^y\�v�\�)\�;\�\�\�\��}\�c\��YV�X\�s[?�\�݈E\0B�C\��@O�\�[\�\�\�߾ˀ\��\�IB\0{\�b;����\�6M�4i\�\�g�y\�\���}WWW\�H��ö�C>�\�{:\�w�\��q\��\�ccǎ\��:\�=��>�O\�˖-۶\�z\���\�q_l\Z\�-\�\�cs\��\��>!\0��\r�\�8k-ֶ\��m�c8v��v�O��_{�v�\�iGHD�ԇK�\�I\'��\�kFh�\Z5�\�5c\�n\��\�E\�Ϝr\�)=��9{;\������N;��\0 4!\0M\0B@�Є\0 4!\0M\0B@���\0! \0��\0B\0@\0! \0��\0B\0`0\�\��:n!\0\�̙3��\\�R\�\�Gm\�ҥ�St�\��´i\�.�>}�֗_~����믿ާ0eʔ7S�\�/h\Z�Ӻ8����\��\�F�ѧ���9rd~��\��\�kv\0�~!\���!^�\\.��T*7:��(HdYv_�n��0\���\�#T�\�C u�\�և@]ےڔG�<@���Yg�u\�.B��ʹ��C�:\Zؼ�\0H�mIm�\��h�\�]��\�8|��O�<@k���^\�M;���;��1\n�T*?Wu�����ê��\�\�.��\�(\��\�#����\0-\�\�^�\���4�(\��V�eǩ>@��n\���\�^u�(@C 9(�\�˩=a	\0/j\'�\�t\�Y\n\0�\�{�\�J�\�i�@�B ����bD�\�{-\r���@5\�ϱ<}y�%P�=z��\�r���-���@�T*\'\��\�v��P�\�\�\���d\0\n\�\�sgjoĴ�@�B���Ŕ�@C`ذa�ǌ��\�n	,B�T�T\�Ȳ\�lK	�`!R\0\\GuttkI,B�\\��\�Z3�0&N�xp��+Ө\�1K�`!:;;\����Ֆ@�B tttd\�G�Yj\0��e\��\�\�\�5jԑ�@�B�\Zs\�g^6Č�\0\��ꌣ��\�}��P��~\�\���}\�(X�,\�Ώ\�#G����P�)\�Ja����\0�\�\�_�\�_,I��@gg绫3�\�ji,B�\\>�zE�/X�\0�P�T.I�˛mmm\�X�\0�\�\�23�^ioo�%P��G�,[��\���,@�B �xlJ��,]���@(�͖��}\�(XT�\��u�~�\�ﱔ\n\�\�m^j/Y\�\0����w�\�o]�e�Y\�\0�j|8f-�JX\�\0�\�\�86v��G,q���@H#��\�\��\�SO}��P����f(jČ�Y�mJ��O-y���@H!�q�T*�a\�B�`!P��/KaSK\�/\0\���g��ƌ��(��q�\\.�N��G�\0B�����>X�q�J	�(\�\�_�\�*�\�g�5\0B��J�ҏR6�q�e\��Ԗ� \n�6\�h�\\�W5\0!P@\'Ɖd)��\Z�(�R��\��\�NR\r@�&��qV.���\�<��(f���v�j\0B��\�\�\��5N$K5\�T\r@�>W�qŮ\�\�q4&�S\r@LL7!a�\Z�(�\���b�j\0B���\�ű\�X5\0!P\�z\���\�!���b\�\�8�L%\0!P@1�DL+\�K� �Y��b���pN5�f\�VD����^��NL9ASP�\�!й�Ȳ\�b�ڧ �7.F�Q\r��`\�nB`\�СCQ�}���\�S�\�ԣ��V{�\n�@}�_w\\�^5�f�\��\r�7\n\��J\�\�G+�4\�h���>	��R-\�\�\�\���j\0�ˌ�^\n\�G҈`�G�F\�ή�U�o\�\�8:K5�F\r�\�0\n\��=:6�v�j\0��\�\��R\�8�,\�gT\n&\��C.\\�d�\�\��ԩS�ɓ\'k�ѦL��?�\�C[S��IC��)6uvv�\�H�̙3�+W\�\�\�\�\��U�V\�ӧOߚaR��_R[\�\n$F\0�o� ����o�6\�h�T�\�Dl\�y�m�\�C\����e\�G�\'���\���[\�K#�R�\�\�\��a�! z\��W�\��q>\����:\�\�\�^TG��q�@O[���|\���\��\�v-\�\�t��!��K�\��_�%��S\0\�\�\���\��[4b\�\�r�ܝ\���@�C\���{�!�\��[3���\�Ŏ\�\�\��[��!0o�\�]�@<�\�o\�Y�M��%\�\���ǀ�\�\�\��\�8\n�8\ZhW!�\��[?b\�\�r��J\n���k�`!�`\�\r��xL\�\��!\�\�ڎ�\�B�J\��9P�X�\�\�|\�\�)(\��\���!��3�>�\��{� !m\�\�?\�)\�>�~�B�\Z�� \�h\�Q(Jlڔ/x�Ɲ7��\�1�B�\Zϙq\nqF�s��\�\�>�x\�Y\�\�����ò,ې\�\�.�EЊ!�\��/�������Z�\�\�s�\n�a\�ȑ�\�R�\�?	Z(���oT jF��q4��o�	��Y�\�ݨ@L.Ե�S\0<�F��=�P�Q\�!��PkB�X!���`Y�es�GA��&�ըQ��LAН�\����@��T*��\���,B��R\\�F�;;;\�\���(�,\�KA�Ҍ� �@\r:��4\"X�\��a �@utt\��Q�\��\�@�bn:;f-�J�R\rB��R\�3�6\�pՀ�g�}6:th��\�O\��\�{o>w\�\��\�#�\�\�\�͘1#?ꨣ��|}\�\'�Y�y�\�w�\�\n��-R	h�H?��Z�*_�fM\�\�\�\�\�\�ٳ�\�Q\�?/n\��ŋp|\�w��\�/� \ZD\�8�B\��\�\�T\rh�\�A�\�\�fΜ��p\�	=��\�}˖-\�y��>�\�\�?��\��\��\�\�3������\�=�5\�\\�\�,Z�s\�1۽\�ƍ�\'�|�\�\�\�\�k�r\�)��a\�z�鮻\�\��,o�\��\�\\��r���\�?�n\�U\r(@Dg�E�]�zܸqۅ�\�7ߜ\�y\��?�\�?n\�\�\�c�\\rɶ��\�+vz,��������\�o߮�3fL\�s֮]�Ө��׬�Bj�G@\�m}h	��Q�T\�\�C\��Հ�c�=v�m����M6q��\�\�sb4��{\�=\�������\�~\�MIK�.�\�\�\�\�5k��\�\�\�\�%K�@?Ȳlr\Z\r�f\�Qh���>�\�c\�c\�:�\�&�{g�O�ϭX�b�\�5jT�k\�}�=�f<?�%\�v\�m�;\��|Æ\r�	���qty\n�9J-�\r>:\�Y�f\�9hҤI۾>�\�3�\�S\�_���m\�)}�\�=k��\�\'�\�T��m��#�\�\�4�cp\�\�5\�H��O>�g\'���}B��xo\�/��\�{�M\�O�:u[�5��ñ�v_t��\�\�\������\�\�GG\�q\�\�r�L�\�\�B\'v�F�}�G\n�z\��̵��GB��J�\�b\�\�\�U�|$�	���F\�ňଳ\�:J5@�bn\Zz\"��ӗ�!P01\�h\n�WS{P5@�bn:�z��E�B@s�\��gR5@�J#��\�C\�\�\���\Z �@����Y�-T	B��b�B\��\�~�\Z �@�J���W$��j��B`B1\�\�\�v�j�\���qA�K�\Z �@�Č�+\�\����(��W(��\�?T\rB��RܑB �����U��(�\��\�R=��|Հ~�\�븅@#ʲlZL5=|��O����3gnY�r�λ�\�ҥK�\�����\�\�\�ߖ:��Sl\�\�\�8VE�M�6\�\�ӧo}�\�u\�}\0S�Ly3�I���;\0\�\���*�\�G��\�i]�\�^\�\�f�Fm�c��?_�u��\�\�\�����ץ��s�m&N�xp��J���\���Ժ\�r~X5�\�=�P!\�\�P�^T\�\����\�0!КJ�\�qhjW�Ы\�\�\�w�֓e\���\�\0��\Z�.�~�\�\�I�\�V�h�\�7���i�~N5�݊�cR�!Z@u\'��\�6��!�(\�\�\�SO}W\Z,I\�\0\�U`�����:�-*\�ܣ��6@j�\�\�\�ߩ\"�����B�yutt�X\���D�� �IZs�pG�ͧR�|>-�7S��F5���:���@�ɲ\��\�9\0׫�\�bJ�X�T��\n�I\�s\0��\Z�)�J��y\�U�iB��1rKAЮ\Z@_t*���pP\��I˪{\�ȑU�OT*�\�FǢ�+&�K�0�k\���*�e|>u,�T�1U��X�ڲ�(��\0}*u.\�\�8s�h<qGZ6o�6/��P�\�utt��@��J4��L>Gm�\�ɪ��r�<2.:�\r\0g\�Y\�)~�\Z@��Rg�^%\ZC�R��\Z\0T��θ\0�J��~Z=�S5�Q*����Ġ���6\�\�{�\�H \�yU%G{{�\�\�2x66\�Ŵ\�*���9.��*1��\rvx\��W��2���\"��K\�7R[�>;:�Ť\0~n\�С��0(J�ҷSG�Z%�\�\'\�T�\�T\r`�Gbs�JX�+1hj��\��\�\�\�^V��uU�L5��P.�/M�\�r�\�_Y�}�z!�/�\�H#�+R{I%�5\0\�y�b\�n\�\0\ZJ꘮J�\�R�\�{1�g\�����@S�OP�\�\�\�S\'�W�\�[]]]�E��ھ2jԨ#UhH���>�U�\�tvv�/\������SE���\�V��F�T�\�B��\�6��>��=HE�F��R<��R��\�\0�zޥ\Z@S(�J?��T\�G\0c���^�\Z@3u^����\�՝\�\0\�Th��5��Ub�GR��M@�)H5���e\�\�R\'6O%�\�A�n�VwD9�f\r�_\�	M*��\�\�T�E�����дRGvgjsTb\�ĉ_q���j#NS�\�C\�ש=�{S?��\��͍)!Th��\'�m�\���kL�\�����r�|oZ�}D%v�_Lu\�\'֩\�j\���=���\�e\0�Je�j\0�\�\�Mq�\�]��n�N1R5���eٴ\�\�\�P��\��\�6�\�|R5�V^۝A�3t\�\�Cb\Z�\�ַ���\"@����!��d�\���S-V���<lذ\�U(B\�v\�\�!�\�k�1\n�р��\��\�8L�\�5(�J�J5\�l\�P\�x,u~�)\�\�G�\�@1�����!�dQ���:�\��\�.��\0RL�\�p���8\�_P\��\�\�\�Q�\�{ \�����\0E���C���k\���~\�?\�L�mmm\�[�@\�ť%��S4\���k\0ĵ\0N?���X�\0�8;��V�\�\�_\�r��\��=�PK\�����\�~ت�_\\�7��\��\�ۃ,q�:�s|�U\�\�O���\�9\0wZ\�\0����\�k�߫T*}5u�[\�\����v���8��u��;\�\��\�XK`�#�%����:�_\�&��;�f\�\�y�yi�R��~��R�=�~�M\'Z�\0{�\�,u��7�\�\�\�\��\�ج�ګg�u\�Q�*�ޏV���%\���G�\Zud\��_Imɩ���.K`\�F/�6�I?��Rۘ�lNL	ai\�{G�*�Tn\�\����.�\�Y�\0�ߙ�N\�[\���K�җ\�\�J�r�%p`!�&�o4\�獝\�\�s\0�e\�x��6�q\��Y�,�Y��>oْ蛑����\����u�J��-5��	�\�\���\r:��\�L�\�\�H\�hK�oװ�s=�?[gg绫G/�6l\�\�@߇��48�\�>WGGǱ�\�R{����m�@����\�*�����\���6���%Џ\�\�i�;k�\���8�\\.�\�\�\����\�J�rz�|�	��ߒ�\�bK``:\�Mi\�{X�\0~�>ϙ�\n���@w\Z	|v�?Ô\��F\0��D\0�ޜ\��O����~R\�??vN�\�\�,\r��	�OB\0�Cz\�\�\�W�v�%08!�f\�?>�\�\��ߟ\����\�/�=�PK`�B\�\�N\Z��9r\�Gc?Dj�ӷY\0\�\�\�ux�=��\��i\���nai\0�8\nhO!\�_j�kT/s�%0x���\n�r��9f\�\����z!��,�\r�\�( \�ob\�sz\�ϫ>@Ȳlao��xpPz�\'cZ�����:@�(�J�\��þ��^�\�SO}WzͿ�\�\\�n߫\�\0\r&u\�\�\�`C_��ӯ^�xI��J4���X-\�\�\���x\�\�\��R\0�i\�ĉ�2@c�VD\��Z1i\n�7\�\�oU�9B���\�O\�t�=���[=�Uh����\�qIk�WF\0��\�	\�\\�5�\'�����#��h�\�S��P\��/\�\� �	\�\�\�r�@\�@\n@\���\�\�NL��:�\�,{���\�\�	\���\�\���`\\�%u��\�b0}qD\0�\05�n\Z�\�?\�Ieq9ȸ,�r�^\0\���ڈ �A��Lm�R�v\0\��ܖc�=�\�84��(%@1�ǻ\�����������韌\0\0�<\0\�z�?�\�\��n��C=��	\0\Z#\0�2\�og�e7A��\�\���!\0\Z7\0�T\�\��\�[\�@�ݴ�\���`W|}\�\��}>���\r�=��{\0�\�E\04O\0\�.��!\0v�\0�$\0v�\056\r������}���{tW\�\��U�(�`pG{�i��G�[\0��O�6��MA\0M}yt�\�\0\Z4z;j��\�\�\� ��va/k\�}y\��$%h�A\�$\0\0�lDP7\rٻYD\�\�|\0�&\�6|\0\�b#�}	\0\�\"#�}\�\�\0@��f\�P\�;�\n9\"�\�C\0\0�\�\�/\0���\�º\0p&0@�\�\���1(@1G#F�\�\0@AUC\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0�\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0\Z�\�_��\�z�h\�\�\�SdYv�J�n�\�M�:t\�!�P�\�@�\\�\\�\0Z?z\�7�\�(\0����\0�ˌ\0\n*���]�@�F=��\0Z\\t��Ɵ\�\�\�a�\�;\�x+�5�ͮT*7vuu�j\0M���\��ԱOO�\�8[��p\�-Y�\�O�WE�&\\�O��}��\����\�E�md\0\�$��\��q\�\��\�s\�\�o�\���G\�_z\�|\�ƍy�ە+W\�O<�D����$7n\\o\�I�Q*�NS]�G�tttl�\����\�o�t�o��V��\�̙��?~\�0\�\�|���\�?)�{\�g�:�\�w\�}yWW�\�\0\ZYlJ��~\�\�s\�=���_|1?���\�4\� b\'p�>��\�\�ߗ\��\� �\�Y\�\0\�(��M@}5\�mD�æ�GU`\�y\0��b@�}��b3��\00H\�D����6oޜ��o}\�[���\�[\n\0� �ԟ	����s\�nwfqjGX\Z\0,լ\�| ��\��\�b�!K`�U\'�\�\��\�\�\�\�n\�nZ	K`\�C`\�E\�c*����\�6	��4\0X\�|�\�X�|���@�7P?\r��0�#�mqm2��\�W���� ��`\0FB\0`0\�\'\0P쑀��\0\n\�\0(��~�`�1���|\�\�\0�)\��\��\�(��ӿ~с\r\�_{\�,�\0�(�\'�{t=�\�fԕ\�\�8\�Wh$q�߸\�o_cx̘1�1ЈJ�\�i���\"�jD#��\0����Su�\�\n�\� 6\r\�>�\�Y�\0v\����U�	��v\�М9s��0\�	&l\��\�\�\n\0�\��\�\��\�o\"�3�{챞��j�\�\�ml󏠈3�\�O�\�`@�����G\r`{\�N`�&\����\'\�\�,ޛgǉ`�J峪\�\�b��\�\\C1:XU?\ru\��kc2��\�T\0\0\0\0\0\0\0\0\0\0\0\0�\���\�\��l\�\0\�\0\0\0\0IEND�B`�',1),('7506',1,'processes/Entrust.bpmn20.xml','7505','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('7507',1,'processes/Entrust.Entrust.png','7505','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�g\"\0\0*�IDATx\�\�\��\\e�7�\�*��Km�ReQ�JQEaY,��e\�.�ee�L�tO&��Q \�x\�2K��P�B��*���P(���(�	1�bH !&$!$!�@r����u�\�}.\�}~���z����\�93\���\��!C��<�\����Oy~\�\�ny�<�hʺ��?���/��ϻ2��kϋ\�D���\�\��\�Ϟ^\\���mʿ7d����yC\0h,�\���\�/�ۉ\�y\�Z�/��Z�|�~fj?�\�\��\�t\��՟;ss�OK��K\���vx\�y+��\�\�\�mɯO���\0\r\�<�v\�g����-\��n?z\�m�_\�%4\�ImFj?�\�M/�ۇ.�\�\�E�\�𼱵\�\�M\��T~���6���j4\�(\���MO\�\�\�\��̆جs{j�I\�릭^�n��\�~2oKl\Z�6�\�5\���X\��s�?��>徵��jAr\����\�\�ڈ 6-��Qq�xl\��\�\�׾�:�?Ě}jǤ�\��\�:��\�EG~Ã�gNݔ?��6\��c;>�:�\�\�dt\��.z6n�;\�\�*\rЀ������]��<:�?��?{\�oW�������_�\��kϻz�k\���?�l�&6��\�O\�����\�\�\�\�H�gg�\�K�[U\Z���N��\��\�5�Y�=�\��sf-ϟ�\��\��\�\�6k\���k���\r�u�\�\�\��\�x\�Ol��{�a�}&�F�\Z+\0ڪ�~�\Z;o\�\�UO\���\�vdj���ѵ�\���ԎJ_̩>�\�\�>�{�;��0/\�/O�\��\��\�>�V\�\�\�_��g\�1*\�X!��կ?�|�ϽwM�\�w/�\�\�߮~\"O-�|����\�0}��I�[��\�.�\�\�82��\�k�}t\�\��\�\�\�Tk�_ D\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\��a�\���o�\���&M\����=\�\�\�\�G��wvv\�_�\�W�	&l��\�_\Z;v\�\�T�,[��\�\�[o}�+_�J~\�\�\�?���Gy$_�|y�q\�\�<l޼9_�re�\�c�\�\�v[~\�9\�\�cƌ\�:~���\�\���\�|k�GL�6m��矟�5�|\�ܹ=��ޚ?~�F\r�\�g���Q\�\�*\n\�Dk�\�^{\�\�q\�\�\�s\�\�\�ĳ\�>��;6���rWW\�a�\��֭[7v	�u\�]����\�y_�\�F�z\�wޫ64� \�\�+�\�\�z뭼�\�x\�1\"xe\�С��6@�}\0�	(\�\��#\0j��\�|\�ȑ�U��\�N\�\�\�W��v�i\�s\�\�Z.�ǩ:@�\�@qP4bgqGG\��\0\Z@����K/�t�#\�Q}�Agǉ`5\n�y\�g�4x\�Nb�A4y�\�\�ƙ���3xW����dYv��\00Hb.��\nb0\\}�\�o�1b��\00Hb2��h0<��\�o�Xb)\0��\r4&��W�ޚB�\�R\0$1\rtm6Ё\�\�TԖ� �Nx0	�At\�g\�H`�\0D_�\�\�m��ʕ+7\�\'\00�.�\�\��::\���\�_\�\� �At\�%�,��&L��\�y\0�h\�ر_�k\�\�1m�3�?��\�A�gώMA\�l^x\�W]uՀ��\�ѣW�E�\�\��\�/n�?�����\�\�1\np=�1f̘	qa����\�o���R�lve1�s\�9\�,��\��s\'�\��+�,[�\�\0\r&vҦ�\�n��?�`\���\��\Z\�\�\�\'\�h\� =z�\�\�|\�;��\r�l\�y\�;��\�\0\�A\�\�ٹ�K_�\�֧�z\�w\�>�\�d\0\�Db\�\�ȑ#ߺ袋ތ0ؗMD�?���\�\�P=\n\�N`�fk\�i-��6?jԨ��&Mzcƌo�X�bK\\�6hL����� \�L\�\��\�<\0�\0ZD\�\�;S��\�\�q}༮u\�6�\�f\�T\�(F0\�\'N<X%\0\n\Z�G�>T%\0\n\Z\�\�\���\0\���v�8R{�J\04�,{�J\0P�\\\�\�\�\�v�J\07�W	�\Z1b\�[\�\�\�V	�b�@\\,�#*P\�(�J\'�@�\�\�\�Ç��J\03�\�\�\��U%\0\nhĈ�J�\�0�\0(flLm�J\03\�(\'*P\�X�Q	�b���\�\�T	�*�˯��%�\0(\�H\�\�\�\�S	�b�֦6N%\0�9X�\�7T��#�եR\�\�*P̑�\�\�&�@1C`E�e�@1C`yj��@�Q�\�J�r�J\0s$�\�r�|�J\03^L\�z�\0(�,\�V*�U��#�\�\�\��T��!���\0\��gR��J\0P�e�Sܮ\0\���)\�P	�J0\'�;U��!�Dj�V	�b����ݣ\0\��\�Y�ݧ\0\��?���\0T.�g���\0A�\0\��ɱIH%\0��\�\�a�\0(�R��\�r��G�\0(fܝB\�q�\0(f�*���T���,�ň#�R	�b��\�R\�S	�JpkjO�@ť%\��*P\��A\\l^%\0\n�R�ܘe\�B�\0(�4\n�>�U��\�\��\�)��\0T�T�ʲl�J\0s$py\Z	,S	�b�.I#�*P\��(��J�\0(f�O!�J%\0\n�T*]0bĈ5*P\��j�\\~E%\0\n(�\�K\�U�\0(�4\n�Rj��@1Gg��N%\0����W	�*\')\�P	�b����Q%\0\n�R�|>˲M*P\��l\Z	t�@�\�\�SRlV	�b��\'�\0@A\�N\�\��=�%*Кk��\�)J�\�i*P\�\��bhaY�M\�Utttd*\����u���\�L$.\�1\�\��*P� x�.\\]�HҚ���Q�8(\�h@%\0\n�T*}[\0�<\�Y�p\�ٳg\�S�N\�\'O��\�G�2eJ�\�CmM\�FU@ӈ\0�9sf�r\�ʼ��[;��jժ|��\�[S L�4���\r�420\�5\�b�λo[l�4�\�t\�B\0�m\�_]�/|\�\���)�\�\�\�\�O�/��uk_\�\�\�?!\�\�on\�\�xL\�/��%��S\0\�\�\���\���\0\�\�!�̃��\��\�t�B\0h\��7y\�.C \��@hB\0h\����v�_\0-fݰ\��\�t�B\0h\�X�\�\�|\�\�)(\��\���\0\�\�!m\�\�?\�)\�>��\0Z=6m\�<|\�Λ�\�}�_\0-\ZqF�s��\�\�>�x\�Y\�B\0h�Hk�\�L\��|\��]@�\�s\�FB\0h�\�\�ڿQ�\0Z8�f\�w�! �&��\r�ZB\0h\�Є\0 4!\0M\0B@�Є\0 4!\0M\0B@@�B\�\�g�͇�?��\����ޛϝ;7?�\�#�\�g_x\�������_���1\��?�\�{����5ѹ��\��|\�\�w\�}�\0\��yժU\�:\�\�d\�v�\�\�{�x^�Gϵ\n-\��~O\�!ϻ뮻�\��\�q\�=?\�\�c�\�r�\0����Z��Z3g\�\�O8\�\�\�\�\�̙\���Y�fm�oÆ\r=��/\�\�\�\�7߼\���\�\�\�	�\�����Z�dɒ�I|�e\�ҥ\�}��7\�O>�\��\�I�\�\�~�\�u?��\�\���/��Ϙ1C\0B\�@B :ܸ\�k�\����q\�=���\�o\�|���F�\�_\�曣�:j�ǎ>�\�\��\������\����=�M�:u[�\�m�C�0\Z3fL\�}k׮\�uTS{O#@`{\���\'��SG�Ӵ\�\�\�\�W^y\�v�\�)\�;\�\�\�\��}\�c\��YV�X\�s[?�\�݈E\0B�C\��@O�\�[\�\�\�߾ˀ\��\�IB\0{\�b;����\�6M�4i\�\�g�y\�\���}WWW\�H��ö�C>�\�{:\�w�\��q\��\�ccǎ\��:\�=��>�O\�˖-۶\�z\���\�q_l\Z\�-\�\�cs\��\��>!\0��\r�\�8k-ֶ\��m�c8v��v�O��_{�v�\�iGHD�ԇK�\�I\'��\�kFh�\Z5�\�5c\�n\��\�E\�Ϝr\�)=��9{;\������N;��\0 4!\0M\0B@�Є\0 4!\0M\0B@���\0! \0��\0B\0@\0! \0��\0B\0`0\�\��:n!\0\�̙3��\\�R\�\�Gm\�ҥ�St�\��´i\�.�>}�֗_~����믿ާ0eʔ7S�\�/h\Z�Ӻ8����\��\�F�ѧ���9rd~��\��\�kv\0�~!\���!^�\\.��T*7:��(HdYv_�n��0\���\�#T�\�C u�\�և@]ےڔG�<@���Yg�u\�.B��ʹ��C�:\Zؼ�\0H�mIm�\��h�\�]��\�8|��O�<@k���^\�M;���;��1\n�T*?Wu�����ê��\�\�.��\�(\��\�#����\0-\�\�^�\���4�(\��V�eǩ>@��n\���\�^u�(@C 9(�\�˩=a	\0/j\'�\�t\�Y\n\0�\�{�\�J�\�i�@�B ����bD�\�{-\r���@5\�ϱ<}y�%P�=z��\�r���-���@�T*\'\��\�v��P�\�\�\���d\0\n\�\�sgjoĴ�@�B���Ŕ�@C`ذa�ǌ��\�n	,B�T�T\�Ȳ\�lK	�`!R\0\\GuttkI,B�\\��\�Z3�0&N�xp��+Ө\�1K�`!:;;\����Ֆ@�B tttd\�G�Yj\0��e\��\�\�\�5jԑ�@�B�\Zs\�g^6Č�\0\��ꌣ��\�}��P��~\�\���}\�(X�,\�Ώ\�#G����P�)\�Ja����\0�\�\�_�\�_,I��@gg绫3�\�ji,B�\\>�zE�/X�\0�P�T.I�˛mmm\�X�\0�\�\�23�^ioo�%P��G�,[��\���,@�B �xlJ��,]���@(�͖��}\�(XT�\��u�~�\�ﱔ\n\�\�m^j/Y\�\0����w�\�o]�e�Y\�\0�j|8f-�JX\�\0�\�\�86v��G,q���@H#��\�\��\�SO}��P����f(jČ�Y�mJ��O-y���@H!�q�T*�a\�B�`!P��/KaSK\�/\0\���g��ƌ��(��q�\\.�N��G�\0B�����>X�q�J	�(\�\�_�\�*�\�g�5\0B��J�ҏR6�q�e\��Ԗ� \n�6\�h�\\�W5\0!P@\'Ɖd)��\Z�(�R��\��\�NR\r@�&��qV.���\�<��(f���v�j\0B��\�\�\��5N$K5\�T\r@�>W�qŮ\�\�q4&�S\r@LL7!a�\Z�(�\���b�j\0B���\�ű\�X5\0!P\�z\���\�!���b\�\�8�L%\0!P@1�DL+\�K� �Y��b���pN5�f\�VD����^��NL9ASP�\�!й�Ȳ\�b�ڧ �7.F�Q\r��`\�nB`\�СCQ�}���\�S�\�ԣ��V{�\n�@}�_w\\�^5�f�\��\r�7\n\��J\�\�G+�4\�h���>	��R-\�\�\�\���j\0�ˌ�^\n\�G҈`�G�F\�ή�U�o\�\�8:K5�F\r�\�0\n\��=:6�v�j\0��\�\��R\�8�,\�gT\n&\��C.\\�d�\�\��ԩS�ɓ\'k�ѦL��?�\�C[S��IC��)6uvv�\�H�̙3�+W\�\�\�\�\��U�V\�ӧOߚaR��_R[\�\n$F\0�o� ����o�6\�h�T�\�Dl\�y�m�\�C\����e\�G�\'���\���[\�K#�R�\�\�\��a�! z\��W�\��q>\����:\�\�\�^TG��q�@O[���|\���\��\�v-\�\�t��!��K�\��_�%��S\0\�\�\���\��[4b\�\�r�ܝ\���@�C\���{�!�\��[3���\�Ŏ\�\�\��[��!0o�\�]�@<�\�o\�Y�M��%\�\���ǀ�\�\�\��\�8\n�8\ZhW!�\��[?b\�\�r��J\n���k�`!�`\�\r��xL\�\��!\�\�ڎ�\�B�J\��9P�X�\�\�|\�\�)(\��\���!��3�>�\��{� !m\�\�?\�)\�>�~�B�\Z�� \�h\�Q(Jlڔ/x�Ɲ7��\�1�B�\Zϙq\nqF�s��\�\�>�x\�Y\�\�����ò,ې\�\�.�EЊ!�\��/�������Z�\�\�s�\n�a\�ȑ�\�R�\�?	Z(���oT jF��q4��o�	��Y�\�ݨ@L.Ե�S\0<�F��=�P�Q\�!��PkB�X!���`Y�es�GA��&�ըQ��LAН�\����@��T*��\���,B��R\\�F�;;;\�\���(�,\�KA�Ҍ� �@\r:��4\"X�\��a �@utt\��Q�\��\�@�bn:;f-�J�R\rB��R\�3�6\�pՀ�g�}6:th��\�O\��\�{o>w\�\��\�#�\�\�\�͘1#?ꨣ��|}\�\'�Y�y�\�w�\�\n��-R	h�H?��Z�*_�fM\�\�\�\�\�\�ٳ�\�Q\�?/n\��ŋp|\�w��\�/� \ZD\�8�B\��\�\�T\rh�\�A�\�\�fΜ��p\�	=��\�}˖-\�y��>�\�\�?��\��\��\�\�3������\�=�5\�\\�\�,Z�s\�1۽\�ƍ�\'�|�\�\�\�\�k�r\�)��a\�z�鮻\�\��,o�\��\�\\��r���\�?�n\�U\r(@Dg�E�]�zܸqۅ�\�7ߜ\�y\��?�\�?n\�\�\�c�\\rɶ��\�+vz,��������\�o߮�3fL\�s֮]�Ө��׬�Bj�G@\�m}h	��Q�T\�\�C\��Հ�c�=v�m����M6q��\�\�sb4��{\�=\�������\�~\�MIK�.�\�\�\�\�5k��\�\�\�\�%K�@?Ȳlr\Z\r�f\�Qh���>�\�c\�c\�:�\�&�{g�O�ϭX�b�\�5jT�k\�}�=�f<?�%\�v\�m�;\��|Æ\r�	���qty\n�9J-�\r>:\�Y�f\�9hҤI۾>�\�3�\�S\�_���m\�)}�\�=k��\�\'�\�T��m��#�\�\�4�cp\�\�5\�H��O>�g\'���}B��xo\�/��\�{�M\�O�:u[�5��ñ�v_t��\�\�\������\�\�GG\�q\�\�r�L�\�\�B\'v�F�}�G\n�z\��̵��GB��J�\�b\�\�\�U�|$�	���F\�ňଳ\�:J5@�bn\Zz\"��ӗ�!P01\�h\n�WS{P5@�bn:�z��E�B@s�\��gR5@�J#��\�C\�\�\���\Z �@����Y�-T	B��b�B\��\�~�\Z �@�J���W$��j��B`B1\�\�\�v�j�\���qA�K�\Z �@�Č�+\�\����(��W(��\�?T\rB��RܑB �����U��(�\��\�R=��|Հ~�\�븅@#ʲlZL5=|��O����3gnY�r�λ�\�ҥK�\�����\�\�\�ߖ:��Sl\�\�\�8VE�M�6\�\�ӧo}�\�u\�}\0S�Ly3�I���;\0\�\���*�\�G��\�i]�\�^\�\�f�Fm�c��?_�u��\�\�\�����ץ��s�m&N�xp��J���\���Ժ\�r~X5�\�=�P!\�\�P�^T\�\����\�0!КJ�\�qhjW�Ы\�\�\�w�֓e\���\�\0��\Z�.�~�\�\�I�\�V�h�\�7���i�~N5�݊�cR�!Z@u\'��\�6��!�(\�\�\�SO}W\Z,I\�\0\�U`�����:�-*\�ܣ��6@j�\�\�\�ߩ\"�����B�yutt�X\���D�� �IZs�pG�ͧR�|>-�7S��F5���:���@�ɲ\��\�9\0׫�\�bJ�X�T��\n�I\�s\0��\Z�)�J��y\�U�iB��1rKAЮ\Z@_t*���pP\��I˪{\�ȑU�OT*�\�FǢ�+&�K�0�k\���*�e|>u,�T�1U��X�ڲ�(��\0}*u.\�\�8s�h<qGZ6o�6/��P�\�utt��@��J4��L>Gm�\�ɪ��r�<2.:�\r\0g\�Y\�)~�\Z@��Rg�^%\ZC�R��\Z\0T��θ\0�J��~Z=�S5�Q*����Ġ���6\�\�{�\�H \�yU%G{{�\�\�2x66\�Ŵ\�*���9.��*1��\rvx\��W��2���\"��K\�7R[�>;:�Ť\0~n\�С��0(J�ҷSG�Z%�\�\'\�T�\�T\r`�Gbs�JX�+1hj��\��\�\�\�^V��uU�L5��P.�/M�\�r�\�_Y�}�z!�/�\�H#�+R{I%�5\0\�y�b\�n\�\0\ZJ꘮J�\�R�\�{1�g\�����@S�OP�\�\�\�S\'�W�\�[]]]�E��ھ2jԨ#UhH���>�U�\�tvv�/\������SE���\�V��F�T�\�B��\�6��>��=HE�F��R<��R��\�\0�zޥ\Z@S(�J?��T\�G\0c���^�\Z@3u^����\�՝\�\0\�Th��5��Ub�GR��M@�)H5���e\�\�R\'6O%�\�A�n�VwD9�f\r�_\�	M*��\�\�T�E�����дRGvgjsTb\�ĉ_q���j#NS�\�C\�ש=�{S?��\��͍)!Th��\'�m�\���kL�\�����r�|oZ�}D%v�_Lu\�\'֩\�j\���=���\�e\0�Je�j\0�\�\�Mq�\�]��n�N1R5���eٴ\�\�\�P��\��\�6�\�|R5�V^۝A�3t\�\�Cb\Z�\�ַ���\"@����!��d�\���S-V���<lذ\�U(B\�v\�\�!�\�k�1\n�р��\��\�8L�\�5(�J�J5\�l\�P\�x,u~�)\�\�G�\�@1�����!�dQ���:�\��\�.��\0RL�\�p���8\�_P\��\�\�\�Q�\�{ \�����\0E���C���k\���~\�?\�L�mmm\�[�@\�ť%��S4\���k\0ĵ\0N?���X�\0�8;��V�\�\�_\�r��\��=�PK\�����\�~ت�_\\�7��\��\�ۃ,q�:�s|�U\�\�O���\�9\0wZ\�\0����\�k�߫T*}5u�[\�\����v���8��u��;\�\��\�XK`�#�%����:�_\�&��;�f\�\�y�yi�R��~��R�=�~�M\'Z�\0{�\�,u��7�\�\�\�\��\�ج�ګg�u\�Q�*�ޏV���%\���G�\Zud\��_Imɩ���.K`\�F/�6�I?��Rۘ�lNL	ai\�{G�*�Tn\�\����.�\�Y�\0�ߙ�N\�[\���K�җ\�\�J�r�%p`!�&�o4\�獝\�\�s\0�e\�x��6�q\��Y�,�Y��>oْ蛑����\����u�J��-5��	�\�\���\r:��\�L�\�\�H\�hK�oװ�s=�?[gg绫G/�6l\�\�@߇��48�\�>WGGǱ�\�R{����m�@����\�*�����\���6���%Џ\�\�i�;k�\���8�\\.�\�\�\����\�J�rz�|�	��ߒ�\�bK``:\�Mi\�{X�\0~�>ϙ�\n���@w\Z	|v�?Ô\��F\0��D\0�ޜ\��O����~R\�??vN�\�\�,\r��	�OB\0�Cz\�\�\�W�v�%08!�f\�?>�\�\��ߟ\����\�/�=�PK`�B\�\�N\Z��9r\�Gc?Dj�ӷY\0\�\�\�ux�=��\��i\���nai\0�8\nhO!\�_j�kT/s�%0x���\n�r��9f\�\����z!��,�\r�\�( \�ob\�sz\�ϫ>@Ȳlao��xpPz�\'cZ�����:@�(�J�\��þ��^�\�SO}WzͿ�\�\\�n߫\�\0\r&u\�\�\�`C_��ӯ^�xI��J4���X-\�\�\���x\�\�\��R\0�i\�ĉ�2@c�VD\��Z1i\n�7\�\�oU�9B���\�O\�t�=���[=�Uh����\�qIk�WF\0��\�	\�\\�5�\'�����#��h�\�S��P\��/\�\� �	\�\�\�r�@\�@\n@\���\�\�NL��:�\�,{���\�\�	\���\�\���`\\�%u��\�b0}qD\0�\05�n\Z�\�?\�Ieq9ȸ,�r�^\0\���ڈ �A��Lm�R�v\0\��ܖc�=�\�84��(%@1�ǻ\�����������韌\0\0�<\0\�z�?�\�\��n��C=��	\0\Z#\0�2\�og�e7A��\�\���!\0\Z7\0�T\�\��\�[\�@�ݴ�\���`W|}\�\��}>���\r�=��{\0�\�E\04O\0\�.��!\0v�\0�$\0v�\056\r������}���{tW\�\��U�(�`pG{�i��G�[\0��O�6��MA\0M}yt�\�\0\Z4z;j��\�\�\� ��va/k\�}y\��$%h�A\�$\0\0�lDP7\rٻYD\�\�|\0�&\�6|\0\�b#�}	\0\�\"#�}\�\�\0@��f\�P\�;�\n9\"�\�C\0\0�\�\�/\0���\�º\0p&0@�\�\���1(@1G#F�\�\0@AUC\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0�\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0\Z�\�_��\�z�h\�\�\�SdYv�J�n�\�M�:t\�!�P�\�@�\\�\\�\0Z?z\�7�\�(\0����\0�ˌ\0\n*���]�@�F=��\0Z\\t��Ɵ\�\�\�a�\�;\�x+�5�ͮT*7vuu�j\0M���\��ԱOO�\�8[��p\�-Y�\�O�WE�&\\�O��}��\����\�E�md\0\�$��\��q\�\��\�s\�\�o�\���G\�_z\�|\�ƍy�ە+W\�O<�D����$7n\\o\�I�Q*�NS]�G�tttl�\����\�o�t�o��V��\�̙��?~\�0\�\�|���\�?)�{\�g�:�\�w\�}yWW�\�\0\ZYlJ��~\�\�s\�=���_|1?���\�4\� b\'p�>��\�\�ߗ\��\� �\�Y\�\0\�(��M@}5\�mD�æ�GU`\�y\0��b@�}��b3��\00H\�D����6oޜ��o}\�[���\�[\n\0� �ԟ	����s\�nwfqjGX\Z\0,լ\�| ��\��\�b�!K`�U\'�\�\��\�\�\�\�n\�nZ	K`\�C`\�E\�c*����\�6	��4\0X\�|�\�X�|���@�7P?\r��0�#�mqm2��\�W���� ��`\0FB\0`0\�\'\0P쑀��\0\n\�\0(��~�`�1���|\�\�\0�)\��\��\�(��ӿ~с\r\�_{\�,�\0�(�\'�{t=�\�fԕ\�\�8\�Wh$q�߸\�o_cx̘1�1ЈJ�\�i���\"�jD#��\0����Su�\�\n�\� 6\r\�>�\�Y�\0v\����U�	��v\�М9s��0\�	&l\��\�\�\n\0�\��\�\��\�o\"�3�{챞��j�\�\�ml󏠈3�\�O�\�`@�����G\r`{\�N`�&\����\'\�\�,ޛgǉ`�J峪\�\�b��\�\\C1:XU?\ru\��kc2��\�T\0\0\0\0\0\0\0\0\0\0\0\0�\���\�\��l\�\0\�\0\0\0\0IEND�B`�',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','15001',7),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('10006','Entrust:4:7508','10001','10005','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-03 10:57:11.575','2019-06-03 10:57:11.585',10,NULL,''),('10007','Entrust:4:7508','10001','10005','submitEntrust','10008',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:57:11.595',NULL,NULL,NULL,''),('12506','Entrust:4:7508','12501','12505','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-03 10:58:39.272','2019-06-03 10:58:39.276',4,NULL,''),('12507','Entrust:4:7508','12501','12505','submitEntrust','12508',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:58:39.279',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('10009',NULL,'participant','201906031001',NULL,'10001'),('12509',NULL,'participant','201906031001',NULL,'12501');
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('10001','10001',NULL,'Entrust:4:7508','2019-06-03 10:57:11.526',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('12501','12501',NULL,'Entrust:4:7508','2019-06-03 10:58:39.218',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('10008','Entrust:4:7508','submitEntrust','10001','10005','ToSubmit',NULL,NULL,NULL,'201906031001','2019-06-03 10:57:11.667',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('12508','Entrust:4:7508','submitEntrust','12501','12505','ToSubmit',NULL,NULL,NULL,'201906031001','2019-06-03 10:58:39.310',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('10002','10001','10001',NULL,'ClientID','string',0,NULL,NULL,NULL,'201906031001',NULL,'2019-06-03 10:57:11.549','2019-06-03 10:57:11.549'),('10003','10001','10001',NULL,'EntrustID','string',0,NULL,NULL,NULL,'201906030001',NULL,'2019-06-03 10:57:11.567','2019-06-03 10:57:11.567'),('10004','10001','10001',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-03 10:57:11.567','2019-06-03 10:57:11.567'),('12502','12501','12501',NULL,'ClientID','string',0,NULL,NULL,NULL,'201906031001',NULL,'2019-06-03 10:58:39.256','2019-06-03 10:58:39.256'),('12503','12501','12501',NULL,'EntrustID','string',0,NULL,NULL,NULL,'201906030001',NULL,'2019-06-03 10:58:39.269','2019-06-03 10:58:39.269'),('12504','12501','12501',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-03 10:58:39.269','2019-06-03 10:58:39.269');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-05-30 13:08:27.016',NULL),('2501','SpringAutoDeployment',NULL,NULL,'','2019-06-02 08:52:12.220',NULL),('5001','EntrustProcess测试',NULL,NULL,'','2019-06-03 06:48:13.221',NULL),('7501','EntrustProcess测试',NULL,NULL,'','2019-06-03 06:53:22.625',NULL),('7505','EntrustProcess测试',NULL,NULL,'','2019-06-03 06:53:24.508',NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('Entrust:1:2506',1,'http://www.activiti.org/test','委托','Entrust',1,'2501','/home/czf/桌面/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/czf/桌面/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:2:5004',1,'http://www.activiti.org/test','委托','Entrust',2,'5001','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:3:7504',1,'http://www.activiti.org/test','委托','Entrust',3,'7501','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:4:7508',1,'http://www.activiti.org/test','委托','Entrust',4,'7505','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('entrust_process:1:4',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',1,'1','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:2:2507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',2,'2501','/home/czf/桌面/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/czf/桌面/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('10001',1,'10001',NULL,NULL,'Entrust:4:7508',NULL,'10001',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-03 10:57:11.526',NULL,NULL,0,0,0,0,0,0,0,0,0),('10005',1,'10001',NULL,'10001','Entrust:4:7508',NULL,'10001','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-03 10:57:11.567',NULL,NULL,0,0,0,0,0,0,0,0,0),('12501',1,'12501',NULL,NULL,'Entrust:4:7508',NULL,'12501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-03 10:58:39.218',NULL,NULL,0,0,0,0,0,0,0,0,0),('12505',1,'12501',NULL,'12501','Entrust:4:7508',NULL,'12501','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-03 10:58:39.269',NULL,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('10009',1,NULL,'participant','201906031001',NULL,'10001',NULL),('12509',1,NULL,'participant','201906031001',NULL,'12501',NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('10008',1,'10005','10001','Entrust:4:7508','ToSubmit',NULL,NULL,'submitEntrust',NULL,'201906031001',NULL,50,'2019-06-03 10:57:11.596',NULL,NULL,1,'',NULL,NULL),('12508',1,'12505','12501','Entrust:4:7508','ToSubmit',NULL,NULL,'submitEntrust',NULL,'201906031001',NULL,50,'2019-06-03 10:58:39.279',NULL,NULL,1,'',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('10002',1,'string','ClientID','10001','10001',NULL,NULL,NULL,NULL,'201906031001',NULL),('10003',1,'string','EntrustID','10001','10001',NULL,NULL,NULL,NULL,'201906030001',NULL),('10004',1,'string','WorkerIDs','10001','10001',NULL,NULL,NULL,NULL,'w2',NULL),('12502',1,'string','ClientID','12501','12501',NULL,NULL,NULL,NULL,'201906031001',NULL),('12503',1,'string','EntrustID','12501','12501',NULL,NULL,NULL,NULL,'201906030001',NULL),('12504',1,'string','WorkerIDs','12501','12501',NULL,NULL,NULL,NULL,'w2',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_entrust`
--

DROP TABLE IF EXISTS `tbl_sys_entrust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_entrust` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accept_opinions` varchar(255) DEFAULT NULL,
  `anti_virus` varchar(255) DEFAULT NULL,
  `check_sample` varchar(255) DEFAULT NULL,
  `client_ex_storage` varchar(255) DEFAULT NULL,
  `client_in_storage` varchar(255) DEFAULT NULL,
  `client_other` varchar(255) DEFAULT NULL,
  `client_system` varchar(255) DEFAULT NULL,
  `code_line` varchar(255) DEFAULT NULL,
  `company_ch` varchar(255) DEFAULT NULL,
  `company_en` varchar(255) DEFAULT NULL,
  `developer` varchar(255) DEFAULT NULL,
  `encryption_lev` varchar(255) DEFAULT NULL,
  `entrust_entity` varchar(255) DEFAULT NULL,
  `expected_deadline` varchar(255) DEFAULT NULL,
  `fp_num` varchar(255) DEFAULT NULL,
  `func_description` varchar(255) DEFAULT NULL,
  `func_num` varchar(255) DEFAULT NULL,
  `info_addr` varchar(255) DEFAULT NULL,
  `info_email` varchar(255) DEFAULT NULL,
  `infofax` varchar(255) DEFAULT NULL,
  `info_name` varchar(255) DEFAULT NULL,
  `info_phone` varchar(255) DEFAULT NULL,
  `info_postcode` varchar(255) DEFAULT NULL,
  `infotel` varchar(255) DEFAULT NULL,
  `infourl` varchar(255) DEFAULT NULL,
  `opinions` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `sample_choice` varchar(255) DEFAULT NULL,
  `sample_file` varchar(255) DEFAULT NULL,
  `sample_type` varchar(255) DEFAULT NULL,
  `server_data_base` varchar(255) DEFAULT NULL,
  `server_ex_storage` varchar(255) DEFAULT NULL,
  `server_hard_frame` varchar(255) DEFAULT NULL,
  `server_hard_other` varchar(255) DEFAULT NULL,
  `server_in_storage` varchar(255) DEFAULT NULL,
  `server_language` varchar(255) DEFAULT NULL,
  `server_soft_frame` varchar(255) DEFAULT NULL,
  `server_soft_midw` varchar(255) DEFAULT NULL,
  `server_soft_version` varchar(255) DEFAULT NULL,
  `server_support` varchar(255) DEFAULT NULL,
  `server_system` varchar(255) DEFAULT NULL,
  `software_name` varchar(255) DEFAULT NULL,
  `software_type` varchar(255) DEFAULT NULL,
  `test_basis` varchar(255) DEFAULT NULL,
  `test_specification` varchar(255) DEFAULT NULL,
  `test_type` varchar(255) DEFAULT NULL,
  `unit_property` varchar(255) DEFAULT NULL,
  `user_description` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `web_environment` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=201906030003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'201906030001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'201906030002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'201906030003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_sys_entrust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_functions`
--

DROP TABLE IF EXISTS `tbl_sys_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_functions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `function_type` varchar(255) DEFAULT NULL,
  `function_object` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_functions`
--

LOCK TABLES `tbl_sys_functions` WRITE;
/*!40000 ALTER TABLE `tbl_sys_functions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_project`
--

DROP TABLE IF EXISTS `tbl_sys_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_project`
--

LOCK TABLES `tbl_sys_project` WRITE;
/*!40000 ALTER TABLE `tbl_sys_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_role_functions`
--

DROP TABLE IF EXISTS `tbl_sys_role_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_role_functions` (
  `role_id` bigint(20) NOT NULL,
  `function_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_role_functions`
--

LOCK TABLES `tbl_sys_role_functions` WRITE;
/*!40000 ALTER TABLE `tbl_sys_role_functions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_role_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_role_users`
--

DROP TABLE IF EXISTS `tbl_sys_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_role_users` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_role_users`
--

LOCK TABLES `tbl_sys_role_users` WRITE;
/*!40000 ALTER TABLE `tbl_sys_role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_roles`
--

DROP TABLE IF EXISTS `tbl_sys_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_roles`
--

LOCK TABLES `tbl_sys_roles` WRITE;
/*!40000 ALTER TABLE `tbl_sys_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_user`
--

DROP TABLE IF EXISTS `tbl_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1004 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user`
--

LOCK TABLES `tbl_sys_user` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user` DISABLE KEYS */;
INSERT INTO `tbl_sys_user` VALUES (1001,NULL,NULL,NULL,'Tonny','201906031001',NULL),(1002,NULL,NULL,NULL,'Jimmy','201906031002',NULL),(1003,NULL,NULL,NULL,'Larry','201906031003',NULL);
/*!40000 ALTER TABLE `tbl_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_user_entrusts`
--

DROP TABLE IF EXISTS `tbl_sys_user_entrusts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_user_entrusts` (
  `user_id` bigint(20) NOT NULL,
  `entrusts_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_mvqyku3j1lfeu915rcacqhiu` (`entrusts_id`),
  KEY `FKo6o6s38lguhv0gy5pdxyu576n` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user_entrusts`
--

LOCK TABLES `tbl_sys_user_entrusts` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user_entrusts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_user_entrusts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_user_projects`
--

DROP TABLE IF EXISTS `tbl_sys_user_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_user_projects` (
  `user_id` bigint(20) NOT NULL,
  `projects_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_fsge06xodxnruvyhkan7n0ipl` (`projects_id`),
  KEY `FKt1bpdahotdvajs9ox0vb9uaqe` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user_projects`
--

LOCK TABLES `tbl_sys_user_projects` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_user_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-03 12:52:02
