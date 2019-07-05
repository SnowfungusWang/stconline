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
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"CusSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"StaffReview\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fStartToReview\" sourceRef=\"start\" targetRef=\"reviewEntrust\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"380.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToReview\" id=\"BPMNEdge_fStartToReview\" sourceElement=\"start\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"236.0\" y=\"192.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"440.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"380.0\" y=\"332.5\"/>\n        <omgdi:waypoint x=\"280.0\" y=\"332.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"252.0\" y=\"456.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"345.0\"/>\n        <omgdi:waypoint x=\"423.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"236.0\" y=\"472.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"620.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('3',1,'/home/dell/stconline/server/target/classes/processes/TestReport.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1562206221743\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestReport\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestReportID\" name=\"ID of test report\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"End\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tmReviewReport\" name=\"TMReviewReport\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"tmReviewGate\" name=\"TMReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"qmReviewReport\" name=\"QMReviewReport\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"qmReviewGate\" name=\"QMReviewGate\"/>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusReviewReport\" name=\"CUSReviewReport\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CUSReviewGate\"/>\n    <userTask activiti:exclusive=\"true\" id=\"tsSubmitReport\" name=\"TSSubmitReport\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"_12\" sourceRef=\"start\" targetRef=\"tmReviewReport\"/>\n    <sequenceFlow id=\"_13\" sourceRef=\"tmReviewReport\" targetRef=\"tmReviewGate\"/>\n    <sequenceFlow id=\"_14\" name=\"通过\" sourceRef=\"tmReviewGate\" targetRef=\"qmReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" sourceRef=\"qmReviewReport\" targetRef=\"qmReviewGate\"/>\n    <sequenceFlow id=\"_16\" name=\"通过\" sourceRef=\"qmReviewGate\" targetRef=\"cusReviewReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_17\" sourceRef=\"cusReviewReport\" targetRef=\"cusReviewGate\"/>\n    <sequenceFlow id=\"_18\" name=\"通过\" sourceRef=\"cusReviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" name=\"不通过\" sourceRef=\"tmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_20\" name=\"不通过\" sourceRef=\"qmReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_21\" name=\"不通过\" sourceRef=\"cusReviewGate\" targetRef=\"tsSubmitReport\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_22\" sourceRef=\"tsSubmitReport\" targetRef=\"tmReviewReport\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestReport\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"25.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewReport\" id=\"Shape-tmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"210.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tmReviewGate\" id=\"Shape-tmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewReport\" id=\"Shape-qmReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmReviewGate\" id=\"Shape-qmReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewReport\" id=\"Shape-cusReviewReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"215.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"235.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"tsSubmitReport\" id=\"Shape-tsSubmitReport\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"20.0\" y=\"200.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"tmReviewReport\" targetElement=\"tmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"205.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"start\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"57.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"qmReviewReport\" targetElement=\"qmReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"380.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"tmReviewGate\" targetElement=\"qmReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"237.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"285.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"cusReviewReport\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"251.0\" y=\"525.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"585.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"qmReviewGate\" targetElement=\"cusReviewReport\">\n        <omgdi:waypoint x=\"251.0\" y=\"412.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"470.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"tmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"221.0\"/>\n        <omgdi:waypoint x=\"105.0\" y=\"227.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"cusReviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"251.0\" y=\"617.0\"/>\n        <omgdi:waypoint x=\"251.0\" y=\"705.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"qmReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"396.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"340.0\"/>\n        <omgdi:waypoint x=\"75.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_22\" id=\"BPMNEdge__22\" sourceElement=\"tsSubmitReport\" targetElement=\"tmReviewReport\">\n        <omgdi:waypoint x=\"65.0\" y=\"200.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"195.0\"/>\n        <omgdi:waypoint x=\"210.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_21\" id=\"BPMNEdge__21\" sourceElement=\"cusReviewGate\" targetElement=\"tsSubmitReport\">\n        <omgdi:waypoint x=\"235.0\" y=\"601.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"420.0\"/>\n        <omgdi:waypoint x=\"55.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('4',1,'/home/dell/stconline/server/target/classes/processes/Contract.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561274924704\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Contract\" isClosed=\"false\" isExecutable=\"true\" name=\"合同\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"ContractID\" name=\"ID of contract\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <userTask activiti:exclusive=\"true\" id=\"submitContract\" name=\"SSSubmit\" activiti:candidateGroups=\"SS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <subProcess activiti:exclusive=\"true\" id=\"subProcess\" name=\"审批子流程\" triggeredByEvent=\"false\">\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveForkGate\" name=\"Fork\"/>\n      <parallelGateway gatewayDirection=\"Unspecified\" id=\"mApproveJoinGate\" name=\"Join\"/>\n      <userTask activiti:exclusive=\"true\" id=\"mmContractReview\" name=\"MMReviewContract\" activiti:candidateGroups=\"SM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <userTask activiti:exclusive=\"true\" id=\"qmContractReview\" name=\"QMReviewContract\" activiti:candidateGroups=\"QM\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <startEvent id=\"subStart\" name=\"子流程开始\"/>\n      <sequenceFlow id=\"_6\" sourceRef=\"subStart\" targetRef=\"mApproveForkGate\"/>\n      <sequenceFlow id=\"_7\" sourceRef=\"mApproveForkGate\" targetRef=\"mmContractReview\"/>\n      <sequenceFlow id=\"_8\" sourceRef=\"mApproveForkGate\" targetRef=\"qmContractReview\"/>\n      <sequenceFlow id=\"_9\" sourceRef=\"mmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <sequenceFlow id=\"_10\" sourceRef=\"qmContractReview\" targetRef=\"mApproveJoinGate\"/>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"mReviewGate\" name=\"ManagerReviewGate\"/>\n      <sequenceFlow id=\"_12\" sourceRef=\"mApproveJoinGate\" targetRef=\"mReviewGate\"/>\n      <endEvent id=\"subDisproveEnd\" name=\"SubDisproveEnd\"/>\n      <sequenceFlow id=\"_15\" name=\"不通过\" sourceRef=\"mReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"cusContractReview\" name=\"CusReviewContract\">\n        <extensionElements>\n          <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n          <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n          <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n        </extensionElements>\n      </userTask>\n      <sequenceFlow id=\"_2\" name=\"通过\" sourceRef=\"mReviewGate\" targetRef=\"cusContractReview\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n      <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"cusReviewGate\" name=\"CusReviewGate\"/>\n      <sequenceFlow id=\"_4\" sourceRef=\"cusContractReview\" targetRef=\"cusReviewGate\"/>\n      <sequenceFlow id=\"_5\" name=\"不通过\" sourceRef=\"cusReviewGate\" targetRef=\"subDisproveEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n      </sequenceFlow>\n      <endEvent id=\"subPassEnd\" name=\"SubPassEnd\"/>\n      <sequenceFlow id=\"_13\" name=\"通过\" sourceRef=\"cusReviewGate\" targetRef=\"subPassEnd\">\n        <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n      </sequenceFlow>\n    </subProcess>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"reviewGate\" name=\"ReviewGate\"/>\n    <sequenceFlow id=\"_16\" sourceRef=\"subProcess\" targetRef=\"reviewGate\"/>\n    <sequenceFlow id=\"_17\" name=\"不通过\" sourceRef=\"reviewGate\" targetRef=\"submitContract\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_18\" name=\"通过\" sourceRef=\"reviewGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_19\" sourceRef=\"submitContract\" targetRef=\"subProcess\"/>\n    <sequenceFlow id=\"_20\" sourceRef=\"start\" targetRef=\"subProcess\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Contract\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"10.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"450.0\" y=\"780.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitContract\" id=\"Shape-submitContract\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"435.0\" y=\"305.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subProcess\" id=\"Shape-subProcess\" isExpanded=\"true\">\n        <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"40.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"755.0\" width=\"345.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewGate\" id=\"Shape-reviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"445.0\" y=\"560.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveForkGate\" id=\"Shape-mApproveForkGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"185.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mApproveJoinGate\" id=\"Shape-mApproveJoinGate\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mmContractReview\" id=\"Shape-mmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"60.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"qmContractReview\" id=\"Shape-qmContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"275.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subStart\" id=\"Shape-subStart\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"mReviewGate\" id=\"Shape-mReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subDisproveEnd\" id=\"Shape-subDisproveEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"50.0\" y=\"455.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusContractReview\" id=\"Shape-cusContractReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"170.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"cusReviewGate\" id=\"Shape-cusReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"195.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"subPassEnd\" id=\"Shape-subPassEnd\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"190.0\" y=\"790.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"cusReviewGate\" targetElement=\"subPassEnd\">\n        <omgdi:waypoint x=\"208.5\" y=\"679.5\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"790.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"mApproveJoinGate\" targetElement=\"mReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"377.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"460.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"mReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"476.0\"/>\n        <omgdi:waypoint x=\"82.0\" y=\"471.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_17\" id=\"BPMNEdge__17\" sourceElement=\"reviewGate\" targetElement=\"submitContract\">\n        <omgdi:waypoint x=\"461.0\" y=\"560.0\"/>\n        <omgdi:waypoint x=\"461.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"subProcess\" targetElement=\"reviewGate\">\n        <omgdi:waypoint x=\"385.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"410.0\" y=\"575.0\"/>\n        <omgdi:waypoint x=\"446.0\" y=\"575.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_19\" id=\"BPMNEdge__19\" sourceElement=\"submitContract\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"435.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"385.0\" y=\"330.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_18\" id=\"BPMNEdge__18\" sourceElement=\"reviewGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"463.5\" y=\"589.5\"/>\n        <omgdi:waypoint x=\"463.5\" y=\"780.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_20\" id=\"BPMNEdge__20\" sourceElement=\"start\" targetElement=\"subProcess\">\n        <omgdi:waypoint x=\"206.0\" y=\"42.0\"/>\n        <omgdi:waypoint x=\"206.0\" y=\"95.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"mReviewGate\" targetElement=\"cusContractReview\">\n        <omgdi:waypoint x=\"211.0\" y=\"492.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"540.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"cusContractReview\" targetElement=\"cusReviewGate\">\n        <omgdi:waypoint x=\"211.0\" y=\"595.0\"/>\n        <omgdi:waypoint x=\"211.0\" y=\"650.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_5\" id=\"BPMNEdge__5\" sourceElement=\"cusReviewGate\" targetElement=\"subDisproveEnd\">\n        <omgdi:waypoint x=\"195.0\" y=\"666.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"570.0\"/>\n        <omgdi:waypoint x=\"65.0\" y=\"486.96871942267126\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"subStart\" targetElement=\"mApproveForkGate\">\n        <omgdi:waypoint x=\"208.5\" y=\"141.8034806292791\"/>\n        <omgdi:waypoint x=\"208.5\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_7\" id=\"BPMNEdge__7\" sourceElement=\"mApproveForkGate\" targetElement=\"mmContractReview\">\n        <omgdi:waypoint x=\"190.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_8\" id=\"BPMNEdge__8\" sourceElement=\"mApproveForkGate\" targetElement=\"qmContractReview\">\n        <omgdi:waypoint x=\"222.0\" y=\"201.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"235.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"255.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"mmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"100.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"100.0\" y=\"360.0\"/>\n        <omgdi:waypoint x=\"196.0\" y=\"360.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"qmContractReview\" targetElement=\"mApproveJoinGate\">\n        <omgdi:waypoint x=\"320.0\" y=\"310.0\"/>\n        <omgdi:waypoint x=\"320.0\" y=\"330.0\"/>\n        <omgdi:waypoint x=\"227.0\" y=\"361.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('5',1,'/home/dell/stconline/server/target/classes/processes/TestPlan.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1561953808560\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"TestPlan\" isClosed=\"false\" isExecutable=\"true\" processType=\"None\">\n    <startEvent id=\"start\" name=\"Start\">\n      <extensionElements>\n        <activiti:formProperty id=\"TestPlanID\" name=\"ID of test plan\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:exclusive=\"true\" id=\"QMTestPlanReview\" name=\"QMReviewTestPlan\" activiti:candidateGroups=\"QM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TMTestPlanApprove\" name=\"TMApproveTestPlan\" activiti:candidateGroups=\"TM\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Review\" type=\"string\" value=\"Review\"/>\n        <activiti:formProperty id=\"ReviewResult\" name=\"Do you approve this request?\" required=\"true\" type=\"string\"/>\n        <activiti:formProperty id=\"ReviewComment\" name=\"reason about pass or reject\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:exclusive=\"true\" id=\"TSTestPlanSubmit\" name=\"TSSubmitTestPlan\" activiti:candidateGroups=\"TS\">\n      <extensionElements>\n        <activiti:formProperty id=\"taskType\" name=\"Submit\" type=\"string\" value=\"Submit\"/>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"QMReviewGate\" name=\"QMReviewGate\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"TMApproveGate\" name=\"TMApproveGate\"/>\n    <endEvent id=\"end\" name=\"End\"/>\n    <sequenceFlow id=\"_9\" sourceRef=\"start\" targetRef=\"QMTestPlanReview\"/>\n    <sequenceFlow id=\"_10\" sourceRef=\"QMTestPlanReview\" targetRef=\"QMReviewGate\"/>\n    <sequenceFlow id=\"_11\" name=\"通过\" sourceRef=\"QMReviewGate\" targetRef=\"TMTestPlanApprove\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_12\" sourceRef=\"TMTestPlanApprove\" targetRef=\"TMApproveGate\"/>\n    <sequenceFlow id=\"_13\" name=\"通过\" sourceRef=\"TMApproveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_14\" name=\"不通过\" sourceRef=\"QMReviewGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_15\" name=\"不通过\" sourceRef=\"TMApproveGate\" targetRef=\"TSTestPlanSubmit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${ReviewResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"_16\" sourceRef=\"TSTestPlanSubmit\" targetRef=\"QMTestPlanReview\"/>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"TestPlan\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"210.0\" y=\"20.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMTestPlanReview\" id=\"Shape-QMTestPlanReview\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"190.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMTestPlanApprove\" id=\"Shape-TMTestPlanApprove\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"195.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TSTestPlanSubmit\" id=\"Shape-TSTestPlanSubmit\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"400.0\" y=\"225.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"QMReviewGate\" id=\"Shape-QMReviewGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"TMApproveGate\" id=\"Shape-TMApproveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"225.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"220.0\" y=\"635.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"_13\" id=\"BPMNEdge__13\" sourceElement=\"TMApproveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"238.5\" y=\"519.5\"/>\n        <omgdi:waypoint x=\"238.5\" y=\"635.1965193707209\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_12\" id=\"BPMNEdge__12\" sourceElement=\"TMTestPlanApprove\" targetElement=\"TMApproveGate\">\n        <omgdi:waypoint x=\"241.0\" y=\"400.0\"/>\n        <omgdi:waypoint x=\"241.0\" y=\"490.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_15\" id=\"BPMNEdge__15\" sourceElement=\"TMApproveGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"257.0\" y=\"506.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"375.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"280.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_14\" id=\"BPMNEdge__14\" sourceElement=\"QMReviewGate\" targetElement=\"TSTestPlanSubmit\">\n        <omgdi:waypoint x=\"252.0\" y=\"251.0\"/>\n        <omgdi:waypoint x=\"400.0\" y=\"252.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_16\" id=\"BPMNEdge__16\" sourceElement=\"TSTestPlanSubmit\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"440.0\" y=\"225.0\"/>\n        <omgdi:waypoint x=\"440.0\" y=\"185.0\"/>\n        <omgdi:waypoint x=\"275.0\" y=\"137.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_9\" id=\"BPMNEdge__9\" sourceElement=\"start\" targetElement=\"QMTestPlanReview\">\n        <omgdi:waypoint x=\"226.0\" y=\"52.0\"/>\n        <omgdi:waypoint x=\"226.0\" y=\"110.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_11\" id=\"BPMNEdge__11\" sourceElement=\"QMReviewGate\" targetElement=\"TMTestPlanApprove\">\n        <omgdi:waypoint x=\"236.0\" y=\"267.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"345.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"_10\" id=\"BPMNEdge__10\" sourceElement=\"QMTestPlanReview\" targetElement=\"QMReviewGate\">\n        <omgdi:waypoint x=\"236.0\" y=\"165.0\"/>\n        <omgdi:waypoint x=\"236.0\" y=\"235.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('6',1,'/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\�\0\0�\0\0\0T3\0\0&�IDATx\�\�\��\�\�}7p&��M\�\�f\�:��u2\�\�dl��\�\�I�\�XҴil�1E\�\�\�=�\'#�xA�F$�ѪUCU�D\�hM\��� \�Q��QQ�p����}~�]�\�\�v�n��\�<�\�\�\�o�}��<�۠A]Ȳ\��A\0@\�\\�\�/<���}�\�\�\�+\�\�\\�\���\�U���l\��o\�ߝ\�/\�\�]t��\�\�/\�\�\�\�6~Ƃ=�_W�y\�3oQm\0�R\n\�\�~��\���\�.�ޒ\�\��\�=_�ޒ]�Ȏ]Yv_\�\�\�7s�\�\�\"T/��e_��l�\�\�K���1\������\�_�T�]2��ln\�\�j\�\�މ\�\�\�@3�\���ڢ؋nxl��3�s\�{\�\�m����_�fW��%��\�2��\�\�\"�Ͻ\�\�\�]�0f�\�\�\��%\�.�v\��춯\�^�Z|\�٬\0����\�VoL��.���-\�_{\����%;�yצ\�\'|����u����\�\�>�3}\�e\����7\'\��\�Ϙ\�~\�\�\�^?�څ\�\�\�\"Tc�\\]n>�\�_��pܿ(˾y\��\�\Z�\��s_�\�U�\�\�7b\�븫\�\�οnѮ��\�Ԯ������uz\�o\��\���\�M_�qٶ\�YK�5龋\'\�Y��6K����\���q�?\���\�c\0�\�y\�޷5\�-\��\�=i��kܷ\�;�`�v\�������}]q\�|\�5w\\z\�˛bl,3ϼwՆ����W��+�[\�\Z��r�)g�GG`>�V�t�z>K�oXZ\�f{�\�\�ˏe\��kuf{\�\�\��\�\�L��\�Ή7<�㊹�=V�u�\�f�\�\�?�Rvʅ\�\���jЌA{v\�\�4\�\'�]s_�\�\�l\�\�,{le�MۘeKbY9}͜\��\�\�9Om���f=��\�4\r~t{z��}k\��-\�o]��\��5\��\�\�\�o�\�\�\�Y6\�\�\�\�qx\�w\�\�\��*@3�m�ߔ\�9\�q\��\�r\�\�\�|�v�\�M\�d��O\�\�\��羖�3\��{\��8�\�\�c�v�YvQ\�\�}\�\�VN��\�\�ɍm\�*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�R�eG\�q\��Ϙ1c\��\�\���w\�yY{{{\�\�ښ�1\"?~|6y�\�ӦM[=v\�\�sU\0Ы��\�v\�M7m:\�s�3\�8#�\��x [�fM�m۶,\�ܹ3[�n]��\�gs\�\�\�ƌ��u\�Y{&N���R�t�*@\�3\�#\��\�\rg�}v�f�ٲe\�*�z��/_��Yp6jԨ,͂��(\0t�\�~\�[\�\�3nܸl\�ҥYw<�\�3\�رc�\�O?�����#T���y�汓\'Oή��\�lӦMY#\�rs��3\�<�-\�\�\04��6���+�\�v\�ڕ5ڵ\�^3\�7|�j\�tbm,\�4����\�7��\r>|��\�tbg�\�Fۨ�\�}-)�3fO�T\Z�\�\04�X>���c�\�;M���\����\�\�\�\�==\�K.\�\�\�\�:W��\�\�Pq��\�\�<��\�Y�پcg)\0��\�\�qf�<w�\�J{{�\�b�8ʳ\0��\�:�S0�����jkkk\�B\�\0Z\\T \�u\�\���])l_�,\00�\�\�{\��aÆ\r{R\�\��,\00�\�\��jW\�\�iqa��D�g�-®7	[\0��O>�7g�{�-\0޹\�\�k\�l׭[�\�6[\0�)S�\�譽�\�\�u�F`���\�W�\�q��\'O^\�8[\0��c\�~y̘1�r�8]�3H\�,����ύ�x�\�XBvnd\0�äI�~y\�W�h؎=z���\0\�4\�\�ۏ8�\�S�,_��G���\��Z׳���u\�Y�\��6m\�5h�nݺ�\\.\�LA;N\�h:cƌYs\�UW平Ԟ�;\��\�\�U��;+�\�3f\��{&N��RW\�֪\r@S\�\�ѣ\�}�\�_\�\�~�\�-�y晱C\�˶\�@5pG���i���\��\�\��\�P��6��\�h��؉i��ỦL��N�\��,-/Y�d}l�\�ulg(\0\�J\�FӬ�����9r\��\�ӷ.X�`\�ڵkw\��hkW\n\�y\�\��qf�\�8�ֲ1\0��#R�;�U)��\�\��\�ڎ\�&�\�\�8�3C@\�8�:u\�a*\09��Y,\0\��---T	\0\�1l\�\09�\�#�D%\0 ��\�3t\�Џ�\0\����\0�c؎1\�c*\0��\�\�b�x�J\0@�a\�\�\�v�J\0@NJ�\�\�N:\�*\0�\�lw��W*\0��\�U\0rR,\�>|�gT\0�پS(�W	\0\�/lw����J\0@~a��X,~^%\0 ǰ-�\���\0�_\�n/\nCT\0�\�mif;T%\0 ��\�Z,[T\0r\�R�\0��4�};e\�p�\0��f�[R\�~Y%\0 ��ݜf��T\0r�f��R;M%\0 ��\�\��g�\0\�X,��w�J\0@NҬ��B�0^%\0 \'iV�zj\�\0\��R��\0�_خOm�J\0@N�\�\�r�<E%\0 ��\�\��\�T\0�\�5�]�\0�_خN\�r�\0���\�W\�\��*\09)�J/\n�o�\0䤵�uU�\�^�\0�_ؾ�\��\0���Y\��\�r�Z�\0���J�\�R\�\�T	\0\�/lW\n�\�\0䤵��\�\�f�\0\��O�v�J\0@N�\�\��R�4G%\0 ��}�\\.��J\0@NZ[[O�{�J\0@~a�4��Q	\0\�/lI\�v�\0���ŇK�\�OT\0r����B��S�\0�����.N\�\�*\0��\�\�\�T	\0\�/l�v�J\0@NJ�҂b�x�J\0@~3\�_�6_%\0 ���;��U\0�\�;c\')�\0���\�yq��J\0@NJ�\�\�R\�>�\0�_\��$N٨\0���A\\�@%\0 \'�B\�Giv��J\0@NR\�\�\Z�W	\0\�I�\\��b���J\0@NҬ�\��\�U\0�ۛR{J%\0 ����ڳ*\09)\n\�+�J+T\0r����if��J\0@N�\�\�u)l�\0���3R{A%\0 ��\�\�)lW�\0\�T*]�\��%�\0��f�\�Sؾ�\0������Z%\0 ���4�5*\09)�\��ŵ*\0�\�l����J\0@~a;)��*\09)\n�J�\r*\0��\�if��J\0@~a;>\�l\�P	\0\�I�Վ-�o�\0\��g���J\0@N\n�\�\�Ri�J\0@N�\�\�4�ݬ\0��4��r\n\�-*\09IA;B\�@�a[N\�m�\0���Ŗ�[U\0rR.����ݦ\0�_؞�f�\�U\0r�f�_LM\�@^Ҭ��)lw�\0\�dذa�+�J;U\0r���\�\�V\�@^���b���J\0@NҬ�ө\�R	\0\�IKK˧�-\0\�\\.�\�v�J\0@�\�٢R\��\�^V)\08D�R\���m�P��J@~�\�U*\0\�T,�w�mmmE�\�\�n7w�kU\0\Z��:�m�T:Ce\0�����.l_W\0h�4�W7��\"\0�\�\�V%\0 ��� l跲,;��\�y�\�\�\�=�ܓ\�u\�]\�!��\�;�կ~�\'�k�*}\\\�%��f\�֭\�v\�ءu��_�>�?��4(M׳�q}\�+\�\��\Z;�Y�=K\�ǁ�bY\�\0\�\�Knz�>��{ŋ\�\�a \�\�5}��@�\�5\��ߐ-��k�\�}�>��\r�6��:{�\�\�\�?�\�]-\�\�>\"}\\�9���\'\��j\�\�s\r>\"}\\�;=�\��\�r �\�>\"}\\�9=y\�\�.�x\�\�c \�\��q�@d \�\��q}��@{fv5\�c�>��\��V.�\�\�@�|D��>ts z}��\�\�;��wy-\��|D��>ts ��\�3\�}�>�����o\�V\�\�{�\�\�}��\�@��\�\�@7�8{ΊE\�\�r{V<\�;\"}\\e J\�\�׬�7{b\�\�.�Z����50\�\��8p�\��\�\���q}\\ςnD�N_3\0��H\�ǁ�D�:՚�\�@��\�\��~\"\�@��k�8�D\�\��8�D]kmm�ګz�>.l�@�5x ��\�\�Բhz�>.l�@�5h \��\�V�` \�\Z4�\�Q�\\\�1d��>\�Y\�ޏN�!lA\���������\�ǻj+V�\�\�\�\��M\�\n[\�\�ѭ�ޚu\�Q\�o�\�o\��\���l�;��=հ\��P\�\�\�5k֬�T*e�V�ꑾ\�ݟ%l�Aa�hѢ\�\�\�~\�w~\'�\�\��\�쓟�d�_��\�G*\��\�/\��\�ώ�ۿ�\�\�_��_g�\�sO�\nۨm�P�0\r��\�l�\�ʥK�f\�r9��\���Jߋ\���iH�\�\�5�e˖\�\�SO��k���W\��`���\rD��\�+/�e˖e\�ׯ\�Ǝ\�\�~g߳��.\\X��c�X\�AjRj�m\�\�%K�T\��\���ϳG}�r\�3\�<����7�_t�����\�����#Gfk׮\��7�\�zi �w��\����f}\��X|�����ξ���\�\�ό\�@\���bP��\���\����\��\\����\���9\�w���y\�$b�\�����Y�\�����8��?��\�\�ӧO�|o\�\�\����}�\�>\���:\�\�(l�f\�<���\�y睇<#�\�XycX\�,R�XW���\�ǿ\�M\�׿��}��Z;�\�c\���:>^�=\�\�Q�\�#�<2��\�\����z���@�S\��\�̦L�R	�}\'۞\��>�[3\�T>�\�����i\�}�,�\�SOU>���?]ylܸq�\��_T>��3>��;�}��Y\�N<�\�\�}�7o\�>�OT>�ۍ7V>����C9�E\�t7\�}}+l\�\�V<�۶m\�g\�F�v\�\�\rX�q�Y򁼦z\�N71\�w\�}]�\�m�ݖ��\�?�||\�	\'�\��\�x\�X�|�\�\�{?�7����\rD1\�袋�L�\�?~�/ιs\�V���~\���)��׿~ϠX\�j�g\�ʕ��k\�\�\�6>��;�}��YѢq\�\�ɓ+���~z\�vڴi�\�x\�@\�\\a[�\�ұ?\�\�1�>\�\��n_��!C�t\Z�cƌ\�;\�N1��h�\�kg�w�y�N�\��\�@\�\�k\�\���\�%ո\�\�\'�\�;\�\����\�?��\�\�1\�8(\�첳����Nڻ��yW�o?+�\���\�j��Hk�k\�Mm \ZX\�\�����\�Ag}<f��\�Q{\�\�i�zM���\�φ\�\�\��qHa{ �[\�#Q�/�|;�ԖO;�T�\����\�,4��\Z��|�����Grm\�w	���\�\��\�qW�o?+fĵ\�����\�}�_~�\��\�g\����\�\�c�x3U[�m��M�~~<\�\�/n��\�.C����l\�\�k\�/��/�y�Ұa\�*Kҝ-#\�*RW\�ȇ�����-��@\�*c��w\��B�%\�8,��x\�$\�\�_����p����\��\�!W��;B�q\���u�SG.��\�\��\�>�����?���(�]\�\���\nQ�\�h����\�\�+�ˮq[h�&�c_鬏\��Ǝy�m��\�TKK\�{�X,V��\�w~���}\�^�g��\�l�C	\�\�^\�\�zi \�,�\�\�io��fe\��\��f����c\�\0}D��Hϩ��⋕À�q0i\"}<��aÆ\�SN\�\��@����<Z���[n��yӦM�8�4�>\�\��\��fg�}ve\'�իW\�\�` \�D�x�\�K/��]z\�ٹ瞻�\\\��8�4�>ހ\�\�s\�̩\\\�\'\rںu�>\"\�@��7�\�U�\��:[�n�>\"\�@��7�=����i_x\�\�O<����H3\�\�jo��Vv\�\r7T����\��\"�8�4�>~m��\�sy�v\�i\�u\�]W9�V�f \�\�\�V�XQ9\�\�W��\��\\(^�f \�ǻ\�\�\��\�w*�\���1�\�\�ak \�\��d<o޼\�v\�Y�fU.2��\�\�@��7�-_�<�\�W��M�:�\�k\�\�@E\�욁H?�\�4�1cF6f̘ʥ��q`�.\\��?\\\�\�\�+���*\rD;���\�\�\�lOs\�\�\�F��\�x\�\�ƍ�q`�\��\�K\�ϟ�\�\�^�\r�\��\�wR��g\r�>�t\�\�\��\�\�.�\�ʵg�qࠤδ�NuK,\r�\��\�\�_�\�0\r�>~�\�g\'N\�F�\ZU\���C}8x---\�omm����\�wL�\�\�v�6?}�!U��\'l\�1��MNmgjk\n�\��*4C\�~H\�\�\"X#`Sۑ\�$�\�СC?��=*A�o\�J�҂X2.��b5EU��r\�)��@aK.R�^�\�;��J!�)�R{{���\�0��B�\�nH!�-ݎS�����\�{*A#�`=2�S\�](~4x�\�\�Uhz\�r�8aK#�~4#�]���7q*�\�c�T	�ч���V�X|;�Q*\�A�T��؁E%8X�s]\�;�WOLq\�ԩSS�N\n�\�\�	T���\�gf\�v\�t�d�\����\0\�C\Z(?\'P	�\�\�ɩ�lIA�)���\0�4p~1�\�*�~ޔ�\�3�}?\�Ό٭�\0�r�<4��T	:�H\�zK,��d\�ȑU��\�\�֖\�\�\�V����&\�\�Զ��F�P�\"\0�(\�V�\�!*AM{��\���z\n\�o�@�\��˱ËJ0z�\���0�z(Ϣ!C�|XU\0\Z \r����\�&�h�~0�z\�׆\r�9h\� \�\�\�R�\�4|��Ϥ\�uk�\�tMS�\�YR{S%�K{{�)`\�+>�ۻO8\�?P��f�\���J4�r�|qu&�Jj�\"\09+\n\�uGUb\��m�)\\\�\�IL\��~��\0�\�\�vrj\�Tb\�\Z1bğ�\���\�\�8���I\�u�*\0=(�\�lg�JL)\\���b��8~VE\0zg0�,\rƯ�Ā{ubzn߈3@�\�3T�w\�+cG�\�\�\�)`���\�qncU\���m,3���\��\�j<Ր}:�ң$\0}D\Z���ڋ*ѯ\�0�M\�yܜ\�\�c\�\�4@�Z%�\�s�g�-�^�\��A�1\�gg��R[��\�ԩSK\�:\'��S\�.=\�S�V����S{V%�\��ujjo\���\�\��P\���M�=�}[��~\"=O\�\�1���]E\0�\� ��4x?�}\�\���/�J�\�v\��\\=�n�T�~&\r޷\�v?�\�{\n�\���\�l�sW���|AE\0�o\�ޖ�GU�\�hkk��\�\�\�U���\�\�*\��\��\')lV�ޗf�L\�zG�\��\�\�R���?�m�*ѻ�W_ڙښB�p��\0�A>fR��D\�`��MmGj�T``�\�=��J%zV,�J�\�S̋%dU�a;?�_�D�\���\�\�O�R\�~JE\0���0��U�Gf�_�\�xR���\�q*\�<a{l�U��ĉ(R{0NLQ(~\'�P�&R=+\�\�T\"�733��X\\\�\�\�v��\04\�kI�m�X%\Z�\�\�b\�\�\�۩�R�\�\�\�biS%\Z#.w�B��\�)n�\�\�\n�\�\�i\�u�Jt\��\�r��]6.\�vW\0ja���8t�B\�\�T\�-)h7�VR\0:�\�S�ܩ/�I9&�gb�t;3f��@ga�l��]����\����KƱ�\�ȑ#?�*\0\�+l�K��]�8\�z��\�\�\�\�(\nCT��J3�\�\�\��*�o�Fǥ7%/\�iS\�~CE\08��ڋ�}[%:7z�\���̭ʳhȐ!V\06l_J3��T�\�\�L�^�\�aÆ}NE\08\�@Y],�P��5|��\�D]\�b\�6\�T�\�m\\��R�4�������o\n\�=q%�N8\�T�F�\�Z��\�PWg�����z\0�\�u�Mn\��?�Ŧp�\Zl/\n\�\04\\\\\�<�\�E\���1\�O�\��S�$�:\�\0\�kf�F\n��\�\r\�U\�S,\�1\�\�\�\0\�*Λ)x\�6\�����\��o\��\�\��}\0zjf�q�O��8���TOL�\�8��g���\�nJt\�\0��\�W㩆\�\�q�\�8\0�1��\�~y��_�߈7�S\��7\��\�\�\�h��g�-�^�..\�\Z�\0�z\�nM\�\�\�\����S��\�uN,��g\�)��r�g���\�\n����pju��V�\\\�Y��\��Ծ\���4��D�۟�cf]&���;Rh}�?�̓>�T*\�\�e\�\��@�=\�3	@_۝)�������Ba|\n\�\�q�ɖ��/x\�k��*���˰\�T\�Ƹ\�\\_�\�\�\�\�����\�\�x�g�>�\\.�ka���Y\�-}\�oN�\���\�\�)\�\�?\���\�nWv��\r�/\�j\�\��\��/\n\�{�\0\���۾2��`�����R�\�Y�߉K\�u�ݶ�g��D�f\��\'��KȞ-\0��8�E\'a;�7��\�驺�Ӫ���,\�\�P{�n��\�8v��f�_�\�x\�LV\�v�g�#쨺�.\�\�\�\'�H\��\�)+ʹ\�[a\0y\�n\�F\�2\�\�=�{gT�\�]\�\�\�v�g���#��\�sz\��\r��Ĳu̬=\04�S\�R��\�/�\�ݥ�}�zb��z*\��/\�\��\�\��\�K\�:;�˦\�\'\�\�\�\�@�m-`\'5:p�\�\�)`���ݔZI\�h\�\�\��%\�^�I\�\�*\�Ό٭� h\���A�\"���\��q�\�X2Nm\�ȑ#?�\�\0\�\���r�Ş�\�\�\�\�(\nC�\Z\0A����7\�-�\�ǥY\�q�\��\�Pf\0\��\�\�ξo�\�\�H;�z(Ϣ�>)\0��\���{g�)\\\'T/}�ڰa\�>�\�\0\��\r\�\�+�����wpǯ�l\�=ꨣ�O�:.\�^,�)/\0���A�\�ߜ-\�\�}n�_��|`\�\'���\�?�ӯO8\�?P^\0\�{���[\r\�l�[��6��`\��\�4\0�:h�\n\���\�\�\�5\r?\�\0��\�_\�v�A[�{v\\\0\�ڎ�;I\����5��h\nGWCr�A~\�a�\�hwT\�?�\�{���f�\�\�n�g��y\n\0h��\�m��s\'[B@\�\�\'huo\�C�\0��\�l/\�Fg;b���`\�\��@\���\�f�ӕ\0\Z|ndA\0��\�\�\�\�Av՟��s<-\0\�g�۝m��\0r\�\�^x\0�n�{0�)h\�g���<b���\0 �nm�����\�s�n�uf(\0h�\�Lv� W\���f�������U\�\0�\0 l\0a\0\�\0�-\0 l@\���\0�-\0[\0@\���\0a\0[\0�\0 l\0a\0\�\0�-\0 l@\�\0\�\0�-\0[\0@\���\0a\0[\0�\0��\0a\0\�\0�\0 l@\�\0\�\0�-\0[\0@\���\0�-\0[\0�\0��\0a\0\�\0�\0 l\0a\0\�\0�-\0 l@\���\0�-\0[\0�\0��\0a\0[\0�\0 l\0a\0\�\0�-\0 l@\�\0\�\0�-\0[\0@\���\0a\0[\0�\0 l\0a\0\�\0�\0 l@\�\0\�\0�-\0[\0@\���\0�-\0[\0�\0��\0a\0\�\0�\0 l@\�\0\�\0�-\0 l@\���\0�-\0[\0�\0��\0a\0[\0�\0 l\0a\0\�\0�-\0 l@\���\0�-\0[\0@\���\0a\0[\0�\0 l\0a\0\�\0�\0 l@\�\0\�\0�-\0[\0@\���\0a\0[\0�\0����um�\�~\���C\��\�b�8M�\0�{��~a�y�\����\0\�4�-�J��\04&p;\�v�Ŭ\0r�\�\�V\0�\�W\�j Gi&;�.l\'�\0\�3��l�5���@�lj���\�\�\�vWj����\\._\�\�\�~���8餓>�t~\nНp���Àv�\�\�\��\�U\0��ɦ���B6;��\�-6\��:Æ\r�\\��n\��g�qF6s\�\�\�\�V�^�m۶-q�nݺ\�Gɾ��\�g\�ƍ\�\�4�[�T��{���\�\�.����v\�\�\�ҥK��\'v\�=�\��郶~\�8�n6w\�܃\nَ\�͛����;\0\�\�q\n\�=�K\�+V�\�\Z\�\�_\�\�>�\�w\�p-)\�Tbg��m���\r��\�\�\�nlõ\�\0M#�:�_:nԌ��n�%\�T�/���\�N\�h�\�p\�\�\��g�-NXQ�\��Ν;��M�0�~9y�g�+�\�֟*\�\�	˖-{י�R;ҳ���\�\�\�՝C|V��/\�\\ʞ\r\0�\�E*�7k֬�\'͙3\�]�s�l\00P\�v}-�\��=)��떒\��l\00 ��ۻ�v͚5=\Z�q\�m�\��<\0ԙ\�\���]T��\�\����\r\0|\��a����-\0t�m�\0��\�\�\�\�\0�s\�:\�\0�f���\��\�9\�g�`\��s#\��R\�F�\�5e\��\��ۉ\'�\�\0\�#�g�Bo�\�\�@��۽;J���e+V�\�%h_|�\�\�\�O�ۇT��\�\�\�~D�X\�Z��T\�\�\�j\�:\��\�\��{U��Q(�T���ۨn\�h\�6~O�>U��\����%\�؆۝��bm��\�\�NSm\0n]8\�^\�K�.=\�\�{&O������+h\�7����m��K\�q���~�r.\�\�\�\�6�\�F Ǚ�\�OXQ��\�\�1\0ԉ��\��R\�f{\�\�P\0Ѕ87\�J�?\�ԁ�83T���\\.��*��S;Vϥ�\����\�;\�\�qQ�8ױS0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\��1t�s��\0\0\0\0IEND�B`�',1),('7',1,'/home/dell/stconline/server/target/classes/processes/TestReport.TestReport.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\06\0\0\�\0\0\0t��\�\0\0B\�IDATx\�\�\rpT\��S>Tj�W[�\�too�\�uԎC?��v��EIr�\�Mb*�BE�P�~\��^�\"#�����+��\�G��\\�\" ����oB�=�\�YϦ\�f7\�͞\�=\�\�\�7�\�\�s�l�s��\�{\�y߷�\0\0��L|�\��\�\�\�\�\���\�|v*�\�\�զ�ĸ�s\�6;\�\�NxK���̊�<�\�\�m\0\�\n�Z\�\�\'+����n��Q\��\���&?�J��\�\�v��Z\�6in�.{\�y�!]8T��Z�o\�\�\Z[\�=�\�ӑ\�\"��Q\�\0d���A[���d5�\�H%��\�\��\�\��e����ݿ*��\�\�\�\�)[5f��\�U�m�W\�\0؆\nG��ZE}p�\�$&/X�4\'��&4\�y\��\�\�Qam���ɺ~���v]�\�`�q�\'g�\�8\0d�\�@��&��\"\�R=�ʆv]6��+Lk�[&>���\�\�\�i�\�vku\����/��^Dx�\�յ\�����k;N[\�\�{�+6�\0�\�\"\�Z\��\�\�\�\�/��\�\�.�|Β�\'\�˾�\��q\0\�t���\�\�4[ҩ\�+�\�n>c	�\��_\�>�����WluS�\�&����R{fU�\'\�\��\�v��ެ׏�4͝��\"\n\0Y\�OUJZu�ϋ[U\\O����H\��d\�?lѦ�l�į;��߯��\��\��p�WE\�M�}X��\�\�W6?m�;���Q\�_�?c]8x�\�@&ŶV\���<�@E>w���Eݣ&̯\�}\��5�Z\��/\�yvE(\�\�aK\�\���H0|e5\���y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�4/\\�d\�\�\�Ν{|Μ9�{\�Ǭ��0G�\Ze�����&M2�O�~f֬Y�&L��+2\0�e�����^z\�\�/�Ks���\���G�w\�18`�:uJx5Ϝ9c666�k׮5_~�e�;\�0\�\�\���߿\�\���\'�\0\��\n�uu���\�۔\n\�ܴiSX`\�R__oJug�3Ɣ\�n��Wi�����8q��a\�3�m\�fJ\�\��\�/~qP���]\0\�:ǎ�0}�t󩧞2�=jځ6Y��\�y睟\�4��Wj*�\�{\�lkk3\�f޼yZ�}VXXx\����\�Դ���U&�\�\�\'�4KKKw�q\0\�8z�@ϩ\�\��\�Yz\�w��I:��@F��z�S�|f��\�9\�\0C\�S\�[:�Ƀ>xfԨQ�d\0lG{\�ͷ٪\�\"lݺՔ���	\0`;˖-���(\�\��DTTT��|�1\�\0�\���ݤr�O<qR���\�\0�\�Ю}?s�\�ի\�Dl{\�\0`+:J�vh\��\n�\�Z\�\0`+:\�Pd��l��\�u\�#�\0؊�%� 6\0��[o�5�[��\��\�W�\�\�9�\�\�\�3�c\0ۙ1cFK���.Y�����\0`;<��\�\\\�\�6}��\�c\0ۙ0a\�\�u��\\�<\�.U�<\0�Lɭ=\�}E\�\�\�J_Q\0\�ӦM{��\�Ϫ\�Ǝ\��\�\0�1t��\�o�=�3Ke�w\�}��Vk�\�\0宻�Mfzݓ\'O��3��\0Y\�;\�8�\�Od�BBH�F�\�\�\�I� +\�|�\�\�D\���\���޷\���\0�u��;����y\�\�	ۚ�w\�y�^,\�\�y5\0ș\�\�\�\�v�7.�q\�ƴ/\�95m~R�@\�\�����m3f\�hU��\�<]�n]�����~r�\0\0��VYRm�U�����М9sN�X������]\�S��ҡڗ.]zH�Ii��ާF\�\0���L�Jb�\�N\�+0��EϡI\�i7)z\0��eg\"1\0�\�JJJ.&\0\��\�*//��L\0��\�VQQ�M2\0^j�\�l\�\�\0xIlm�`�:2\0^[�a�\�\0xIl-\��1�\0\0\� R;F�	\0�\�N�A�\0\0/5E�kW+2\0^�؎�\�n\'\0ॊ\�s�\�\�d\0�$�f�\�d\0�$�&�id\0<�4C��d\0�T�\�x�L\0��\���\�\��L\0�g�\�\�\�3d\0�T�m�X@&\0�Kb\�*��L\0��Ķ9��L\0��ĶA\�U2\0��\�������	\0�RŦ$/&\0\�%���XN&\0�Kb[�r#\0\�%�-\�\�(�\0\0/��Rb\r�\0\0\�`\�k~��}2\0�Ao\���|�	\0�RSt�v�\"\0\�%�-Ў�d\0�\��\'Mѝd\0<�\�\�R*�\�d\0<�Tk�\��\�d\0�\�}@\'t!\0\�t\�=���L\0��\�6Y\'M&\0\�%�M��\�a2\0��\����8J&\0�3�q�Tm\�-\�������\�*2\0n�\��K�󤈬U�]\�L5d\0\\�H���i�F�}9�\0WUm]Uk�\�\0��ۢDb��\�\02\0��\�\�c��\';\0\�ZtT�X��A�\0Wc]!��m\0/4I\'FĦ\�\�\0x�j;�b#\0\��\�=\0$�i�\�\�ܹsO]]��|�rsٲeD���\�\\�reHbG@�Q�\�\�֚���fKK�F455�555!�\��,���\ZR�WnR��pd\�m~\"${C��Y\09D?�\��\�؎~�ܹ��f}\�o¡\�u\"Cl\0�۱\��\�\�K��߸��\�e��!6\0׉mO�띤����\���Ol[\�~4�\�t2Cl\0�\�\�e3�M\�!3\��\�\0\�Zlz4�\�t2Cl\0�\��Us�M\�!3\�\�:�5\�\�dn^:�s3T�\�:d�\�\0\\\'6�]\�v�.Cd�\r��b;}\�ܾz^\�f�,\�u\���Jlڳ\�UO\'<Ǧ\�\�}�\�\0\�!6�\�l�6?X|B�EB�\�m�\��c\�\�]�F��\�\0\\\'�d����7Ć\�\0\'��J-�\r�8��\�\0�\�\0b\0Ć\�\0\0�!6\0\�F 6\0\�F 6\0Ć\�\0�b�_\�eDos\�\r7����:z�\�\�׷o_�\�k�5\�6[=b�P\�+�x�ڰaCx\���\�;	0�w\�\�ֆ�_q\��\r\0�)�\���\�1c\�\�ƍ~ݕ\�\"�\�=�܎\�\r\r\rfyy�y��燗2\�ܵk�\�\�\�^6`������\�ׯ�\�\�Ԅ\�\0��b���7/7m\�~\�\�]�mŊ\�\�Æ\r\�X_QQ^�j\�*s˖-\�\�\r\n��8qb��[o�~�t\�\��k]N\��\�2\"6}>p\��p���*�\�\�f\�;:\�k��M\�޽��tf����n�)�Z��.Gl\0�-cb[�`A��>v%6}>y�\���o���؎9�=�\�G�5}\�96\0ĖQ�u�.���c\�\�����_G��F��S�N���\"\�\�\�\�i�5��\�\��Dl\0�\��i<�\�C\�׃�b*�\�fs���\�E]����\�\"�˾�\�\���\0b#\0bCl\0\�cF�\Z\�\�������EG�}9bCl\0n\�F	3:Dp\��xJb�Ho�Ĭ`0x\�\�ŋ�bp>�aL�[�8�WO�8����Y](\�j\�Fj\'��\�o��&2Bl\0�i�\�K$5i���sl�\r���oI3�y�\�~�P���3�\r�8iN��.�P�}*�\�\�\�-q�6;�\�b\�9���牠\�y�ד��\�*�A/�;�\�1\�\�\��\�U\�x��!6����������\�jbQ-�\�\�~Ϊ\�Bcm�\�@֐�\�z��\�\�3KN\rz~���\�dGqq�\�\�˺\��!6��1s\�\�>\"�\�%V�\�N\�\r�\�{ <PRRrq��.bCl\0�RVV�5=�/2�к\�L{��,�����\�@ڈ��q�,����\���o\�\�\�� 6\�\�#���8\�Wm���\�vI<Q^^~Y�ߛۦ�Cl\09���\�+�@\�~�\�\"�6�\��u�|��;\�Iﵶ�����!\�{�\�\�-bk\�S\0����\�\"��{��\��7Dp?u�����~���&t�\�A\�d�Ԫ��Z%\���\07Wf?1\�\"�#\��e�Dfω\��\���\�,�2�kʩ�7;��Yт\���\";G�u�\�Z���h3Sb�Ĵ�C�^@�2״W��	\0�\��R��Nd�ӺQ��|\�ޖ\�\�Ov�\�ȑ#/Պ�L\0�Aii\��D`�\�!Kf�����Mv��u���H/�\�ny\�Z7\�\�Ͳ\�%ћhIOn	W\�>!\0ݠݔt\���l�DvZ�NZ�\�{rz�\�V2\�@��� q��Q�3y�w�\�~Hv�\�~�k\���H\�f�P,�8fݒ�[bnWSҁ㚢#����E[��d�\r\�|ѐ\�\�}];#��)Z�W�\�\�eeeWhfUc!�:[�\�\Z\�q?:��}N&��X�(�]�\�[�d\��gz�\�x�b����L�\�\�+�R��B�\\ZW0�J\�����h�!\�\"��>\�!2^ib~M\���\�S�#\�\�$�+����,\r\��GG֡\�\���`0x�\�\�/\�hݒqH��E��\�\�\�\�QS\��\nW@�_J����;\�@��}\�Df\�\"\�ht$9P�[#c�Y#e���\�i1�#Ķ@OG�	pEEEWZ\�>떌\�%*��r�݈\�%�PD&�)\�0�7u4Y떌=����\�@v Yt��\�L@N(,,<O\�9���\��\�]�r@n\�\��:X ��\�uܓL@6���ˁ��μd51�K,���\�M\�\��H�L@��Au�WuNL��y\�:r\rف��F���	��^r`\�&�*j F���\�\�Ç_Bz \�b[�U���QaIe��\n̺\�_��Z*�1\�Yn!�3\�dz�5�B�����P�I&;�Êm�\�AA& ���X�\�:\�2�D����\0\���[�.���Xs4N��u \�3�^��Iz��\�c���L�Y���!\�\�yrp\�:��\�\�\"�\�d\\ �O��(�\0=\�:Dol��.is��\�y\�\�Dv�ebۧ\�W���lb�#\"/�v*o���^*�\�.�^̚E&�*\�cU\�\�\�ֽe\'\��\n���������\�\r\�ѳ�\�|\�-�\�\�\�\�?�D�\�\�\��8���Ķ\�:�;�u�^�ja�Do�\�&Y\0/��M�\�\�.b\r�Bl\0n;�+��6W\�bp[st�u%?�\�j\�bp뱽&\�96έ��i�\�\�ܹsO]]��|�rsٲe�\�\�N{OUUU\�ʕ+C�8�����Ɗ\�\���HfRD�V[[k666�---D\Z\�\�\�d\�\�ԄDrs8� �&\�\�(���\�_\�J\r�\�+7�\�Z8����(Jl!#=@��\�\�Ц)G�y��A\�6r\�Hέ��\"#\��[�H\�d2��\��\�̝k�h\�W�&�\\�!2\�a��G�͔؎\�gn^2\�\��ƽg�.\�u\���\�RI���[&Ķ���NR�\�\��Jd�\��~�Ed6\r�eHl[\�~4�\�t2Cl��u�\�\�\�e3�M\�!3\��Z\��i�\n�!6��\�\nh�f@lz4�\�t2Cl�q�E˭�\�\��m_57�\�t2Cl��E�\\;�[�bk޷\�ܼtF\�f�,\�u\��A֤\�97�Ħ�k\�\�Nb\�e��A\�R\�y:�+\�~��\�\�8疖\�N�6���׹*\�t2Cl��\�>,�����]\�-\�vTn=��,�h\�\�	ϱ\�:z 6\�q��9KVfr��Z$\�\�ج\�#�I%v`{���\��J-��nK��\� \�sj�-�\�\�\�,MRl\�UiTo�\rl�Zwr들Ԣ�WK�-�*��\�\r�!6H��On-)H-Vn\�[\���R�b\�^l:�=�y���\�R�\Z\�\�nϱ�\nmԨQ�\��\�{�\�-!է�s}\�Tj-\��TXl�\�刍Ș\�Th>�\�\"�6k,�6>��GG�-//����\�J\�� \�C��H\�0n�\�\�\�q�\�Ysd�<\�\��g@ֽ.˖Y_Bk\��y\�*�C\�\�\�\r�xH^�_R�$Z$Z%\�#�\�vf\n\�B�+�\�TlD\�\�&�\�\�Ӫy�\�\�ٕT\�\��|[$�C�\�YV*1N\�y=C>��I>\�\�\�?\��?\��K,�\�+\��;���<\�˲�%vK�\�M���<?&\�OƓJT���\�\�KB*�#\�\��{�١>�\�Mk\���IT\������\�\��BY������\�\��>y}�����+�\�?.--��<�\�_:t\�98\�6��-�b�~����7�wF\�6s\�\�>Ç����\�\n�^-\���7�\�{�\�{\Z�\�M^OS\�\�\�\��y��l��<S\�m�:��$6˺�\���}��ɲ��xB\�%�6�\�7ބ��\��\�\'���L�7Z�s��76[s���\���\�Iߛ\�sOʲ�����}:�����\��,\"�Xs\��smv^\�f]Ė9�YM���\�Oȇs�VZhu ϗK��\�\�z\�*B�\�\�{\��A�\�8iɺ�T���S�bU1���T�Ǭj�Ib�U}�U�VG�\�j\��b��������<Z\����\�ҪK^d\�py��ʴ:�|M��CC8���v\�\�V\�\�PĖ\r�%$>)hk��Ǒ\�\�\��K�<��\�\��>�\�\�\�z>H\�\��!�\�H�\�l\�C9H\�#�9�ұc\�~�#ۑL�SQ\�\�󀉺[曢\�L��\���`�Ｍ\�2\�W��Yl�o,7]<�*��\�f�T]\�s\�u\�-��ɍ\����\�!�����ϒͪU�̫��\�<�\�s\�~���W]u\�Y����^[�\�X��#6*�4ω!�LTl�s\�W��oڴ\�ljj2\'L��\�z/�-BEEŅzb���\�*�@*������Բ)��}���o۶-\�\�u�>��&z�o}\�[g��\�����\�K/\r�\��������\n}E��\�ܐ�\�6dȐ�r�ȍ7\�hΘ1#\\�%�^\��\�ݻ[�-Z�\��\�?�~>t\�\�N\�U^�v\�\�x�\�/t��\�W��\��i�[2\�Ҳ.\�Fl\r\r\r\�}�\�g8�c���\'�^_\���\�\�v\�ԩpD��x\�\�Vif�)�\� �[\�R˅آcݺu\�Y�\�_G\�\��%�\Z��\�\��7Ȧ\�n�\����.�|���\�m�:Kv�6u\��\�\�ͅv\����L\�M\�u�$�\����%֧O�\��(Ƚ\�F���V]ڤ\�f\�\r�^�\�\�.�袸��Ļ8�R�w�\0��\�Ϲ�z�\�]c�)r{��dIlb��WnfIIIH�ʑĆ\��+\\n\r\\0�T 6\��AG�\�1\�\�bCl\�%�\�\�Q]\�bCl\����_!�\r���*64a9�@l�\r�$�Wu\0R2�\�xIl:�n2�\�x^\� �\r��g�fh�N\�C&b/5E�\��\�bCl\�t&�|�\\�!6ȿ�M\'�:�@l�\r�$�3:\��@l�\r�$�c���X�|92Bl\�`|>_�\�\��L�@mmm{cc#B�)�\�ݻ[\�\�6VlJ�@&R����ᚚ�\����\rR���j�`\�\r�Slu:-�H� Β*\�6������\�H3�u�ud\�[\��\�\�\�#�\�\�\�\�\�d�\�30_��d\�#�y*0\r\�0n\�e���\�\�\�\���y\��.\�D&<@EEŅ�3[#b��p \�^s���R�O$[\�q��I\'\�ؙ�\�\��\�\�㞘\�-*A2^E����/�V2\�rF�}yTs�#�i�&\�r=\�F\������}���@��\�Ǒ�i�����\��G[0\��\�\�/!.E�\�%�WW!2<I��\�bk---��p\�l\�ج�$�\�\�V\�	��@&\\�uq�Y/XWD[���vޣ\�W�߿�,����	\�|S=�7\'��f\����\�D��\�\���q� _ĶCo\�%\�١/IlI�\�a\�\�x\�R�]�Ȅwv\�\"���M��S\�\�A\�e�v�\'ީؖH�N�\�c�d	�\�s��_D&��CWJ,O�n�|�-#K����%�	\�\�\�5�n\��Փ%�:~���tC&�sn\�X�o16�,A�m�\�2\���a\�\'��zp�,�ױ�O�Ȅw������Mѫ�%�\�`\�\�d\�;�@�zfΜ\�Gw�رc�L� >\��e>\�\Z\�h��MȐ]\�ݙ���WMֵ\���/!\��,9�7J췺\r�ʲN\�	ɔ{\�vD��\�w��\�d�sHe�\�\��I\�7\�\�b;!;���o��Z��)�\�_\�\�P]Ȓ{w\�i�a]�\�`\�kd\n����`\�h�\�N2\�n��\�\�\�.v�\r^E\�H0b��\�n��\�\�\�ŎF���L��?\r�\rt\ZJ2\�\�\Z\Z9r\�]Tle�\�\�x�Iz}\�|�\���]};iWن�&\��\�Aǅ\�]s9z\�mwӎ\�\�=LM^Ge&_\�\�t��\0\�\�\�\��\�\�4We�o�1�2\��d\�\�90����ͩ@ 0��A:��y\�Ν;�\�\�ՙ˗/7�-[F� ���̕+W�$\�qT\��:iښ�\0u�id\�A�V[[k666�---D\Z\�\�\�d\�\�ԄDr\�<�NԢ7\�&Q�}�C\'�1H�Ԑ��r�\n��#�s\�V�\�&!���]5�t\�\�\'B�7�iʑ\�Yl\�|۽,\�m%c��!DF�-M\��tآ$α͒h$c�\r�����s\�\���߄C�\�2D�ؒ\"ٙy�b�\�v\'\�dZl\�\�37/�nn|\�޳B�\�:d�غ\�\�\0���\��\�\"�!�=��w�Z$�\�W\"3Ė\�9�?\�d.Il\�K{:���\�ַM(6]�\�[2MѿHն)\�m[\r\�L\� �bۼlfB�\�:d�ؒ�Ue�c�Ie\�\�\�\0�\r�9\�[�ޣ��?�=I\� �bӫ��Ħ\�bKFVu\"�\�In��4E�A\� �b۾jnB�\�:d�ؒi^��\�|�\�\�*7��[�M\�\�3:7Ce��Cf�-�*l�\�KI6[�֐O\�\ZdRl\Z�\�-\�$6]�\�[�\�\�v�yIJ�N��@\� �b;}\�ܾz^\�f�,\�u\��%#��\"�Ǔl�� �!�\0z*6\�Y�Ѫ��c\�u�>@lɈ�Q\�6#�m�\�\\k��^dl�Tb�W�,�?�\�\"�\�\�To���*\�\�B�\�9�����+\�\�%�\�4�7Ė2:�\�m)l2�\�\�%�d����7Ć\�\�\�Dq*MW\�~&��\�\�S�E�!�xM\�3:oh\n\"ܚ\�\�!\0I�c#�\�[[IIɷS\��m\�\n2�\r�9Yl)\�*R{Q\'v!s�\���\�fJ\�vq\n\�Oש�\� 6\�\�Tz�z_�^h\��bs$Z�YbK����oj�\�bCl�Dϭ�DR�6_b\�\Z�`�:�*\���)..�Ć\��޿��\�\�>��@!b[�t���\�\�\�ׯ_8��.�\�F�T8n�ᆳ�\�\�Ⱥ\�m5��\�k^{��f�Gl�գ�3�H\�%��m���\�[a���\�7\Z\Z\�\�uY�ܢe�aÆ��\�ן�<v[}^[[~~\�W 6�c�}E{ �5�a��B�\���\�\�\�:�\��\�\�,\"+�\�ƌ^6nܸ�\�\�y}\�\�v�Vy����\�~x��!C\�]�v�\�\�\�\�e8\�=\�k�$���[.9M�\�\�g=h\�.�m ��m�iS1ZB\Z�N�\n/S�\�ʪ��2�3�6m\n?\�\�ĶbŊ��aÆu����/[�j��e˖��A��\�M�81�Z+\�H3Y_\�r*��\�i���w:@%��M�80\\E\�c�\n-:��cǎ��Z�\�nӻw\�/&�پ=����n\n�\�G}�\�[sz\"(�\�\���	��\�\"M\�u\�\�uj�~��ߍ+���\�cWb\�\�\'O?��\�;�\�ȑ#q\�SQQQ\�9>}\�לc˭؞A\�H�\�JKK�ד\�D\0\�[Dz�K\�aE_<X�hQ\��f�\�{}\�\�1���\�ב+���\�ԩS\���H�5�s\�dM\�ou�>[\�\�t��Tn\�ر_֛tgΜه,B6\���^(�TR\�<]�pa��JVl\Z=�P��\�������\�?~�y\�EŽ�����\�V��-G\�E\0�W��R\�!¯\"��m�E�VQ\�\�Ln\��\��\�=�\�\"\�R���^8\�j\�K.	߂�\�@\�Rby\�\�5�\�$��K��-�\�\�HT�Pl�\"��\���1}�\�C)VI�\"��\�����\�G�a<ߓ�՟�}L�!6�5EwK\��T\�v��|3YĆ؜&�=�\0 M\���\�\" 6\�\�4���ړ�=z�\�R\�1D8 6\�\�8���m|\Z?o\�\��\'��\���Ė\�M���-%%%?!��\���\�vZbXO^\�r���LbClN[��\�����\�\�۩#��I@l�\�Ibk1\rL\�\�\�\�\��I@l�\�Ib�9�\�4���m\"��\���Ħ����FS�1��\�$$����Cl.$2Xd�b�M\�8لd���mollDH6\�޽{w�\�Z8�,\�\�\�/K�[k&�v�	\�R]]�pMMM\�\����\�\�ӧ]%����V�9Y�jFLWJÇ�D�>�\�\�\���XTTt%��\�\�,�2�k\�iL\'��т\�b\�\�<�v\�\�}]~דV���<~�C�\�/d\�DEE\�7��\Z�p1�a���СC/�\�*ݦՠ\�I�W;̓qpA+\�\�r��!\�\�JeG�\�\�\�\��\��\�-�^�Uy|Gb��\�\�\0�m�\�_l\�|��_\�X��G�q�Il��qJ:��\0؉�3�|1�pwST�<�#��xC����N\�,�^�`\�@+��=�@��\���4\��q�λ���Z�k�Ӳ��+\�K�\�c�\�z\�L��\�\�)��\���2S�\��\�gUr͖��a�A\�V���	#M�?\�d.N}\�=r�X\�T�\�1m�j3��\�\�\�\�\�ىqKv���\Zt�@��`]�\�o\�\0{l�L|��d�	w\�\�J�0مo��^�\�[G�[HZ�[J\�\�[Lس�\�g�Y�@Ʉ�T\�\�n�?�ٲt�\�\�M�\�e{�Y��)�\�$�\0�\�D\�\r�ݸ�;�v벮�\�֦E:c\�A^}&Z\�\n\�r\����ݯy��\��r�� qP%GG}HBl̺恝�E\�|�_�b��>t���Hw|Bp\0:K ���0�!\��W˗cz@l{eg>�\�9��>D0\�f���L�_l�Z���AG��E��=EA&\��!>,1�L$\���Kl\�\�e�p��\�\�md\"�\\\�Q\��_d/\�=�d\��\�S\�d\"5\�\�\�\�Ûz~�L��\�\�Ӄ��\�A����L������\�\�d\�\�\��σv\�{�L�G\�\��\� ���\��<\�\�\�L�G�R�]L&2�]�y\��\�w�	�WV�nB\�2t\�w&z\�\�\'.G+5�\�\�:\�;\�N�ݪȄ������\�΂��9o�꩙��	�\�+wd\�Q?�_*|\�{�\��W\�Ȅ�~\�ѪXsK&\�_vk\�2\�\�/%:\��\�ѣ/ש\'��tqq�\�K@�b�\�r�\�^\�\'\�ߣ/v�|\�8�ˏX\�\�\�)�!\��\����ԇ���\�\�6�\�\"�\�\��d\�eX\'�Ʉ7��~R\�\�Pbc6x�6E\�\��d\��\�Q?\�g`[��1��{w�~�\� ����\�k|<�\����cxIg�\"yM\�wԗ��%Fl\r\\]v��\�\"�W�L@�|\�/�_e�ظ`\���Db5��x\�KG����-��\�v�\�\�/��\�E�L@wx���\�~���*6�X+\�\�\�\�\Z-\�\���;\�O�0o�\�]�zUL\�k\"\�S<\�Q_��җ��~߾}\�>}�<�^u9�-��aϓ	�v\�KMb��\�ի\��\�\�\�ަ\�n\�ׁ~q:������\�\�/�r\�=H& �sRG�\�\�Y?�=\�N���J& \�\�].;\�\'[�M�rs\�vD���	\�Yj3S\�\�N\�\�>�����	p\�\�\�sgS,�Q��HlzRw�\0�asG�t/p\�\�ebk�_��t:\�\�JMo;y���\�Ob�㜛�\�\�.\�@2n\"�������i=�\�Bj�rs�\�B\�<n&QG�.�\��8\�s��\�.\�-�H̷�YY�ɸS\�\"�o��\�c�\�r�y\�9\�<����\�\�\����g\�ر_V��	�\�*�Ժ�[�$��w�Z\�4\�\�\�/\�ҝL�פ��l\�ɭ%�\�ʍsnNA/\Z\�W2y&��䖊\�h�:�\�Co� \�.��T�\�\���S��X\�Sa�����+r�a\��]2�ؒm\�]�\�f8�b+�\�\�	2y\��\�[�/)\�P�M\�S<B& \�\�f\�UQn\�u`S�>��L�G\�\�j�]���p5ԙ�\�ց&\�x�iq**;{\�!\�D�\�\�\'d�YjW_Q�\�T�~�t22yR�E\�m~Ar�{Do\��j.i��E��Md�rK\�Rs�\�*u\�d2yZ���9NF��j�\Z�L@�Un�H\n���b��-&���[2\�Ҳ.��\���a��	�r������b\�\"��\0\�֩��G�[�f\�\�@ 0�L\0r�Bb}���^@�׋m��\�q2yN�B\�ݻw�a�\�\�QR\�n�5�\�f�	�p\�f����tfz\�\�b�~�a��d \�\�:g�|&~@*\\�\�\�c��	��V�\�SZF&\�-�S\�d�\�3\�,1�L��)�e�2\�!�O\�3��p�Nl+))�6�\0\�h�\�\�\�\�2\�n��dG~�L\0t|&\�$��	w\�D��}1�\0�\�0�)M\�wɄK��\�_\�&�\�\0��\\�(��Ʉ��f\��	^�\'\0\�\�\�c�\�G&\\N �t4]�4E�IR�}F&�Q~_�w\\K�M6 �	�>��$\�١ߒ�w]o,\�~�\0�6E�#��V2\�!\�\�\�/\����c?;v\�\�\�#G��To�\"���\�Bٱ�%��~	�|C\�(,,<�Lx����st�Q)ˏ2�\�r\�]I&���ߵ:\�_C6 �*��r�	��\�\�Г�t��<\�1�ǓLx_n\�{\�\�\�O6 \�\�(1�L\�\�fk/�	d<.�]R�=C&�Gn-�=L6���\�6I��L\�׷Y@\�f\��d<z���XN&�r�$*\�xPl��m=�\�Ct\�]\���%\�!\�/\�\�Dn��<EGߵf��Po\�%#\��=(\��2�ǔ��}MפcX\r:�2h�\�)q�L\�9\�a^�\�:��v\"&#\�ft�B=\�B&�`\�̙}\�`�@�>����b�F���	�>(j��]ii\��\���\�HG� pzs�v�2c8\�\0�~A�:���\�c�\�K\�6�.<~\�\�\�ul+�\�\�#\�c��^D �\�\0�]��DpO�\rp\�q{D�\��d\"\�\�z\�M��L6�\r�|��Q�L@�D�����l��׏�k��n���;)r\�P�\�\�m��m���\�)�\�\�)�v1\�8Xl\�:|������;�C03\�8�)�7k�p�\�\�\�@\��\�.S��+�g\�\�\�E&�\'���\�)���դ���3�EA&�\�\����\�[\\\\�#��\�\�\�X�dҕ\�z�[0��\r\�5:a�\�@&��=��\�\��n��DoM\�\�dl�0�IV,\����a\r�\�\�E`\"�Rkt�dr؂1\"4؊4G�Dr��\rȑ\�\�\�8��\0[\�)�t��:�9�v�+!��\�-<ş<nc�?\�&\�Z8,\�\�l�Ao���#1�̀-\�rpb�?\��aL�\�K�*\�~̧D`!�xm���\�-��Y��\�O�)� \�YW�u���A��vt�?9�6\�\�`;z�+�\�32}\0��o\��XA��c	���d�q\0�j5��\r�\�\�Olz�\�@V���a�?���\�#�V.\Z@V\�\�e,�M%`�\�h��(�Ր\�:\"�qV�\�\'\�\�tL-��M��ב\�U\�6\�:\��\nـtѦ�Ϊ��ـ�b\�`��Ճ��l�\rU\�\���\��\r�8)$S�9\�4\�۹s瞺�:s��\�\�eˈDUU��r\�ʐ\�<�*#R��\�\�:W���J���\�lll4[ZZ�4���ɬ��	�\�\�pdy�\�O*��ƒ���Ɉ�\�J\r�\�+7�\�\�\�\�X\'�?�\�\�\�\�ѣ/\'#\�B��\�\�Ц)GV~\�KĶ�)���~�b�4�&\�b�|o\�Ɇ�\�v��\�ε4\�~}�\�b���E��\�pό�\��;�\�ܼd���{\�\n]�\�b������[\�\�I6�/�=��w�Z$�\�W\"3\��~�=*7�\�d\�\�b\����	Ŧ\�b����e\�\�\��ɆsŶy\�̄b\�u\��A%%%?��\Z����\�x���\�o5\�p�\��*h\"�\�:d�\� \���ت�*�\�m���	Ŧ\�b�.�f):$MӽL�\��5\�\�dn^:�s3T�\�:d�ؠ�sn_�\��5�\�\�H\�Ŧ�k\�\�Nb\�e��A�hST��zm�2\�\�v���}��\�\�PY�\�b��\�J�H\"���,�h\�\�	ϱ\�:z 6H\�0^\���\�/\�b�J\���j�\��\'�Z$tݖ\�\r�A\n�y:�\�\�\�F\�\�\�]�F��\���f\�L��\�f^l\�Ti]Uo�\r�Aj\�\�_h,y�\�Ȝ\�z*�H 6\��Wn\�:\�To/���c#d�\�t�J�Ϸ�l 6\�����\�*�\�I�\����Cl�\r<\�,\rO�\'��)�bϠ\���\�\Z$2\�bCl\��Z����ܘ\��!6��Dl\�\�z��t 6\�^:\�T��\�S��\�xIn/\�nz\�\�Ȏ\�6l\�`�\��\�\�̾}��o�馎��\��3�\�V�Ze^}�\�\�\�k�\�\�ϼꪫ\�n��\�\�k�5�8�=b��\���\�h/�\�Ɠ�̊mݺua��\����~���m۶�)�\�\�+��޴i�\�\�\�dN�0!\�����\�\�W\\qb���\�&[�`\�\"�[aaaX2K�.M�M2b\�*L_����\\��\�놆���\�<���\�ˇb\�ڵ���0\�V\�</r{�ldFl*�̩S�\���(\�̼�\�\�3f�+�xۯX�\"�|ذa\�B\�eڤݲeK���A�x�@ �S�\�O��l8WlZq\�w\�}\���;\�\r<8\�9�H3tǎ�\�Gt�\�\��������\�xW��\�4E��]��\�\�ئd\�y�H�O��\'O?\�\�.�o9r�sl�?DM�)�\��^0ЋZA��\"�|Wd�����t�}�\��\��_\�r\�-\�\�󺺺�ߩ\�z�\'�cǎ������\\�4E�N���9��^#6p\r\�\�{tF,\�f\�\�z%���4,8m�\�\�СC;\�\�߿\�3f��\���\�ay\�\�m�\�^\�fĈ\�W��\�p��՗6C�6�D\�y衇\�j�677�\�Ǐ7/�袳���\r����)��A��(x\nm�j�T��\�DElbϠ�y�?Ć\���\�\�\�z[b#x��ך\�V\�F 6�\�fi,튅\�\�^j�����\�Alb\��\�O�?Blb/Un\�)�t\�J\�F 6�\��t\���N�\�\�!:9�N��\�xq�?Ć\� O���;�\��ym�?Ć\� �\�jM\'f�&h�:b#x�^>�o��\�W��Cl�\r �\�m�W��Cl�\r��\�\�^�\�ω\�\�!6�b\�ﴗ�<�­�Cmmm{cc#B�)�\�ݻ[\�\�§\�.�)\�y^7Ӎ￺��ᚚ�\���+�ӧO�FjUUU�s�d���?W��yn|��A�%U\�qmB91t�y��ԩ\�/*Z�\Zx\n�؆\�nR��F6죬�\�\n�\�\"\0��[d��Z�a[5�}v[\�@�\�b�Σ ��L�g˗E@\��\0\�}�\�ߚ�)�\�\�d\�%�\0p\0C��@����<�\�S��Y\�\�<�	\0�`M�5ߧ�K�b[(b\�F&\0��\�\\-q:^G6Rnֿ!�.�\0p �a�C*�֒���������	\0�\"b�o͂UF6�\�Y�\�\�2\�`��*7i^\�C6��\�v�ܞ\"\0\���ީr\�=N6�F�\0I�\�\'\0\�hb�X\�-$]~	׾�d�%��C�R$��l$�\�9�L\0�if]�S�ɇw]�G��KSl\�\�M�L\0��\�O\�vD>Ğ�\�/M��\���\�~R�4J4TTT\\HF\n\nF�y���!�\0܌V&R�\��\�iTk:TG��\�%\�\rR����\�b+\��\0\��PWI�v\�0��y��	Z�r4\0x\���6\���\�|��E\�\��?��\0\��V�q���K����\�\�9\n\0�Y�M�f���g��\�%\�\�\0�\��6��\�\�{&��\�\�\��\0\��������\'�\�F��\�\��\0G*�\�ȇ]��[\���U\�\�s\�$\�\0�\"EEEW�\�N�\�6{y�?\�!�\�L�8@�`u7�Lb�\�R�\�ǫ�\0y�N�\'bۧ�1���}\�k��N��\�\�\�\0y�Tk\�\��t\"�c��\r�Ulz�\�\�\�e�<E\�V���\�\���LF:\�s�\�y]d\�*�ۏ\����\�Tl\�U\0\�*g�\��\�\���5�p;{\0\"�ۃ*\�0&����>\\�\�\�M\0\�@��w[�3?\�R��Bo�`O�Y�A�\�\��y��\�\�E\0\�Dqq��ěnz\�ڕJ䶓=\0�$�\�ObM�K��\�\�\�\"�\r\�=\0HHYY\�z\�Jnԛz]\��·��\0�&Ç�Dd�\�8�\�W\�zh��\0\�2v\�\�/�0v�8���_\�\����G\�=y\�1\0H�^z�J\�q2~ˡb; �0�\n\0Rm\�\�y�3~��z�\�s���\0)�����q�\�ĦWq�\�C\0\�#�b{\�\�p��Ħ7b\�\0@���\�>�Ld2\�!b\��\�Ϟ�ter�U�\�\�\����\�2d\0\�V�\�\Zm>�ﯹz:Y\rC�����~O\�\�\"M����:P�^�eO\0@&��\"��=ş\�$>\�^\0\0\�\�)��jO�\�2T�\r�\�_��ҍ=�r]\�\�M\�\0\��)�T4��\�\���,d]՛�\��&�i\�\r\0�\r\rD\��a����߻1Vn1\��\�\0\0쮮ޑ�}�?k�߄b\�\�Z\0\�D4�:\"�4�\��{�\'�\�\�\�\�\��\�<\0d\�0��n\�\r\��;E��\�M��\'\�\0��\�\�ak�҉6�Ζ�\�\'\�\0�m�M�\�6ێ\�\'\�\�\�1\�\��d\0��\�ǯ]�\�\�\���`0x]Թ5&r��\�m�uA\�t׈#>U���S2\0�n�^��C�\�\�M\�\�L�0o�\����#\�)��	yT\��Q��S�����/�߷o_�O�>�Q\0p\�\�j\nS���&1\�z==\�5\0@n���D�y&1\�ߔ��\�\0�i�����\�b��\�\�YOx\0p\"��L�lE6�\�\r\0�(��\�n�@`D��*�v*7\0p>�\�)\��\���\�\�a6Œ�\08�뮻n�\�~�3�_�~���Wp\�\r\0EXJQR\�%��\��\�q\�\r\0�#�(��>�0�\�^]H-\�vTn\0\�(�X��\�-�H\�\�\��\0\�Dj��-�\�\�\�,\0\'I�;��IRj\����\0�s�u%���+7ι@N�֕\�R�\Z\�R\0\�(�[B�O�\��ĩ\�Z�婰\��Y\�r��Tl\�6\�\�f�\0 �\�Q�αE��\���\�\�Ϋ�ܬ\0Y�[���v\�\�VV�\�P\0\�\�\�TTv�<�C��	\�R���\"5\0pD\�-��ɍ\�����\�*�tΉ!5\0pE\�\�\�\�,\0�\�*�T$�\�\0�5�[2\�Ҳ.\0��*�\�99�\0��[��\�\0\0\\\'�i)6S\0M�B�)`�\0�R\�6j\�(����\�\0�\�\0\0\0\0b\0@l\0\0�\r\0\0\0b\0@l\0\0�\r\0\0�\0b\0@l\0\0�\r\0\0�\0 6\0@l\0\0�\r\0\0�\0 6\0\0\�\0��,\0\0b\0@l\0\0�\r\0\0�\0 6\0@l\0\0�\r\0\0�\0 6\0\0\�\0�\r\0\0�\0 6\0\0\�\0�\�\0\0�\0 6\0\0\�\0�\�\0\0\0 6\�\0�\r\0\0�\0 6\0\0\�\0�\�\0\0�\0 6\0\0\�\0�\�\0\0\0 6\0\0\�\0�\�\0\0\0\0b\0\�\0�\�\0\0\0\0b\0@l\0\0�\r\0\0\0b\0@l\0\0�\r\0\0�\0b\0@l\0\0�\r\0\0�\0 6\0@l\0\0�\r\0\0�\0\�&�Y7q�L��\�V֝\�|>\�,2\0n�[Sb;VXXxY\0\�Tm~�6\0�\�-޹�\�Tk\0੪�sk\0\��\�Z\0O!ژ(�M##\0\���-|��j\r\0\\�\�K+3�Z떏���lm\�u�@`^EEŅd\r\0IQQ\�U\"�\Z�ՙ$zD\��\�.\�\�zy��,�c*4\�b���\�D\0\�\�\�\�I�u*VP\�Ǐ7\�ϟo��\�;\�}�\�S�N��>666�\����\�/�\'N�\�\�\�a7�]\0\�:z�3�GK\�\�{\�\rK���\�L�\r6��\��\�B\�\�\0Y�Zt\�SgVVV�$�X/^lJ3��y 7\�O�Z(�\��\�G�v�\�\'��w\�}�Y�\�R\0\�(z� ���JMϙى��h�\�97.(\0@&������vUj�*��f\�\Z�\0����E�W\�sj�DϹE�o\�&0{\0lEo����y\�\�3\�L�:5�IZ\�^\0\0\�\�sk\�=\n���l�iӦ�z(H�go\0�-\�m\�ҹ�#U�o\�վ�\�\r\0��Z�˂\�l��\�/�\�劽\0v��cb\�&�M�\�\�=\�\�\0\0[�t�_;p\�@VŦ��Ey\�\�\0\0�*��D:�g�{\���\0��- 6\0�b\0\�α�+6���\�\�\�}l\0๦\�\�\\�<�\�/I\�\0�kJ�6���ך�k�G�\�F\�=�{\0�\�X��\r\0�V�\�fk\�[o��t �\�\�:A�\�<�뮻��\0\0��\�\Z\�$�{��h�1K\0dSnS�\�f׼�1\�O\��\�\�-r�TgvO���\�ӧ3<\08�Y\Z}\�-�y�=֮]\�[\Z\�8��zM\�=\n�o��>�F�\0r��؏�Z�f�\�B\08�\�M���\�=�	\�Q�7\����E\0p$\��\�\�[�U\\S��GQ]�k�v\��I7)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0{��avv\�]Q\0\0\0\0IEND�B`�',1),('8',1,'/home/dell/stconline/server/target/classes/processes/Contract.Contract.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\\\0\0\0\nF\0\0k&IDATx\�\�tVՙ��uڙ��ں\�:]ߔ\�quuj�f��\�Q�\�gǱNAޓ�ͅ�B @�p�p	7\�b@���؀X��X\��\�(���C0B!\�\�~�9�7���\\\�9�\�Z{���7ɓ�}~ﳟ��-�\0\0\0\0DJ\�3�Ո��\�L��@�9n\�n�9�\�\"�_\�\�Ӝ\r:nEs߇h\0\0��g_;{s\��Z}��J��F\�$�Z���5\"�4�vĢ<9\�l�з\�/\�~!\�=�WR5�\��6�\0\0\01r�\�\�z�0�{\�Lÿ68\�\�7�q{\Zd#\�\�|�~�&�\���\�F-�\�\�~s\�\n\0\0\0p r��!�K7ԥt\�d#�\�3ǽz\�˪C g���|�������ʉ\�x�&\0\0p����dF,lT#�$�v\�¯�uǍ��r۰�b�\�}�\�\�A\�=Tw\�C�ɨ}C\Z\0\0\0.\�H\�\rK��\�\��ʂ}l\�q=�?nO�\�\���\�\�j\Z�\�A\�\0\0ܓ��\�\�\�ޔ��\�juA�`\�_��y,39�\�\�\���\�Ǎ�jV\�������t�\�vv�\����oy\�fl\0\0\0�N$�\�Y�\�\������\��*G,�\�T\�\�\��˫\�X��U�lĢ<s\\�R_�\�ؕo\�n~��k\�^(��߿�\�2�\�\0\0��O������&�$���h\\@�U\�a\�\�5�k\�,+�\�+G.\�k���\�\�J{ߏ\�\0\0\0��\�\���\�۷oZ�hїs\�έ5j�JLLT111*>>^�1Beeeݘ:u\�\'Æ\rI\�\0\0\0\���\�\�Ǯ^����\�\�\�\���ժU�\����է�~�*++%��nܸ�\�\�\�\�;Ｃ֬Y�\�\�\�Tzzz\�	��~�\�D\0\0�ch?�{�\�\�\�C�Us\�\�UG�1\�\�^�;�-Z�RRRԨQ��Q\0\0\0e!,XP����:�\"\�ĉjذajРA�%&&~�\�\0\0��+W�\�\�\�R\�<�|���2\"\�7dȐ/\�\0\0\0pq&B$b�\�\�\�\�͛*\�,Y�D2��\�\��D\0\0�EHM�gH\�#$\�f���*..���\0\0�)����h\rg�6̑��V\���3�:\0\0��!\r��!33:)������^\0\0�\�:2ų3�>}�����-D\0\0��Ȋ��\�Tge#l>�\�\����)�\0\0p0������beGX�Dbbb�eY)�\0\0\0�\�!\�^w999\�bbb��W\0\0\0p(��\�\���\�[7�H|\�_\0\0��\�.��WWP^^^�E���\0\0�C�-�\�]<;\�L�!\�\0\0\0\�P\�Bޕ \0\0\0�_�~]���E$\0\0\0\�ȑ#��F���\�5\0\0\0f�\�\�U]5kc��\�e\�\�\0\0\0p0ӦM+\�u$���JYG\0\0��6,)--�KV��%�Y\�\0\0��2Q\�\�{m\�۷O�5\�k\0\0�\�L�8qϜ9s:U$X\�\�\0\0\0. 11�;�=v\�X�H\�\�o�].\��\�7\�\0\0p\�\�\�YC�U�/_\�P��v\�ZM ��%\"��\0\0�����Osrr:��V�2˲>\"\�\0\0\0.C\n\�\�\�\�-Z\�2Q;as�n��m\0\0\0�\�\���\�\�͛��^�\Z�\�!C�Hq\�\�\�E\0\0\0x@&\�\�\�?JMM�=|�pą�R!\�d\"\0\0\0<�D\�\�\�ݜ<yr�E(\�����\�nv��\0\0\0^D��e���BBBB\�ܹs���\�7KKKknܸQ���l��cǎrY�ZV���u\"\�\0\0\0\0��x\�v\�V�\�\�lԪ�B�}�\�5+V\0\0@{\�B!\r\0\0\0�H�\�\����\0\0\0��eY�			K$\0\0\0 ,�HLL��\0\0\0������\�2�\"\0\0\0\�\�\�\�\�\�!\0\0\0�HT�|���\0\0\0�#U�e��H\0\0\0@\�h��#\0\0\0�H\\�����\0\0\0�LLL̗�t6�\0\0\0���,\��D\0\0\0BFK\�Z&�	\0\0\0G$.\�I$\0\0\0 ���\�D\"\0\0\0!cYVi �F$\0\0\0 dbbb>\�\�I\"\0\0\0\�\�9�ߟC$\0\0\0 d�D��,k1�\0\0\0�����)\�m�\0\0\0�pD\�\�r�\0\0\0�#G���\0\0\0�#�t\�@$\0\0\0 d,\�z\�\����H\0\0\0@\�\�\�\�\�\�2�\Z�\0\0\0�pD\"_�]D\0\0\0\��]\"D\0\0\0\��\�2�A$\0\0\0 �آ\�\"\0\0\0!\���6����D\0\0\0BF��,\�}\"\0\0\0!#\�c\�2\�D\0\0\0\���q�\0\0\0��	K,\���H\0\0\0@\�����111\�D\0\0\0BƲ�\�Z$>!\0\0\02�@`���R\"\0\0\0!3Q�D\0\0\0\��L\�.	\0\0\0G$�Y�UA$\0\0\0 d�~�n��\0\0\0��\�\�\��e�Tܭۯ��\��S\"\0\0\0\rQ�,\��j\�jtS-�<�\0\0\0MВ����V����\"\0\0\0M��h-q�(\0\0@k2�JK\"aYV\"\0\0\0��\�\�\�\�Hh�x�\�\0\0\0@�Ȯ��E\"66\�\"2\0\0\0\�.\�fp\�\"�1\0\0�v\���3l���D\0\0\0B²�\�\"D\0\0\0B�n�OD\0�	���۩���O��O\�q\�h4\Z-��w�w�G�E��\�\\a��_�J����z\�wTee�\0�𨮮V\���\�ӧ�����}�\0ד��^-\0\0\�\�7��M�\�f�q�W#\���\0\0�\�r\�رZ\�\�\�\�Jn�\�\0�@�9\�\�&\0\�-\0\0\�1 �H�q�\�{\�m�\�c�\�\�>|x��?�\�O\r��\�H\�I����\�7ێ;\�\�\���\�q\���|QQQ�\�\�\�\�Ֆ-[Ԋ+\�\�R`���&\�\�\�g��\�\0D \�\"q\�ʕӛ~�a\�\Z?\'�r����QUUU�{;\��\�#�ԟ\\˖-k��\�/~aZ 0\�W^1-..\�|ͼy�\�?w\�y\�^P���\��\�oWuk�&��}��\�G�Q�s\�ϗ��kggg�\�_\��\�򸰰�\�\0	����\�\�\�?\'_yN�!��\�\�\�1\�\��\�w�u���0aB�qrLc9h�d\�����\��&2 M������<s_D������d#�����i�;\�\�\0 \00�a_\�ԯ�\��\�w\�y�i\'O�lr��>h\�K6BϜ9\�\�\�ك\�\�`�o\�n^�lDcN�>m^�Y\'�HF��*--5�{�\�U?\�a;3�{�\�&\�L�2��\0	��	�X\�\�竉\'\�\r\�c�߿�\�\�Y�9s\�\�gd��\��\r�A�\��W\�}�Q�-���\�d�C��&\�o���������\�}�4��\"C�5�>\�D�ɈH�F\�&\� \0\0�@f$\��?��?7x,�R�`gD\Z\��\�G�_+�	��\�\Z����\�&+\��\�P��yN��\�[o�\�`\�#�g��ȶm\�\�\��\�?o�+l<X��\�p�\�H��\�ً��`:,\0 \0)k׮5�\�bEF�_��)\�o_�e�-�h{��d�\�ҥK\rj,\���\0��lĆ\r\�,���\�ӧ\�\�(��\0\0�\0\�\���)\�u\�]\r7Wc\\�\�X$dhA�\�;�#O>��y]2��O��ќH\�\�2\�q\�w\�|\�ɐ!C\�)�\Z\�?\0�\0\�@��qF���(X$n	��q�\�\�fׂh�H\�3,d�\�^Bց���\�\"!\�<��Y�\�$Cag3\�15\0�H\0t�H�Y��\��4)��(SKv�.��\\\� ,X�@\�[�\��\�aO�\�-���\�\"!u��\�$	�[\Z\�8�\�Ht=2\�$\�)�\'�F�2�2\�\'>>\�\�\�H\�\�駟V{�\�!X�H\08U$\0�ɵk\�L��Ԫ<X�Z�ʬ>�駟\��޸q\�ȣl4\'\"���f���{\�9UQQA�\0@$��\�ݻ\��ܹsՑ#G�0�Y�dѢE*%%E��\�k	\0D��������u\�С�\�\�ĉjذaj�\�\�\�\�ի	\0D܌d���\�3\�<�._����!y�\�\�L�:\0�\0@$�͙��ٳg��7oF���,Y�F�\�`\0D\0�\0� \��9\����?~���\0�\0\".A\n+�&\"Z\��\rs\�쏭[�t@$\0	pː�\�ΐ���`\�n\�K\0\"�H��u\"d�gg\"\�\�K-\0\"�H�Ñ��\�\�F\�\��+����	\0D�,{-5Y`\�IIIj׮]�\0�\0@$��\�\��\�uW�p\�B5y�d��H\0 \�Td.\�;�+طo�Ɇ\0 \0�8\�\�S6\�\�\n\�\�\�M�\0\"�H�C�-�\�]<;Y�[�!@$\0	p(]}!G$\0�\0@$���\�׏� \0�@xte�DYY5�H\0 \�d����l\�ƞ={���\0\"NFv�\�u$�z\�)֑\0D\0�\0\'#و���.Y\�R�5X\�	\0DNW\��\�\�\�\�X�\�\0D\0�\0��r\�J�\�eg���\�H\0 \��^����;֩و��\n��\0\"n`۶mj\�С\��\�\��}�]�fV\�ܺu+AD\0�\071v\�X���ӡ���G�6\��H\0 \�2��q̘1jѢE\"2\�S֍��\0D\0�\0�ʄ�v9o޼�]�e8cܸqF\"��\0D\0�\0\�\�ȑ#ՠA�\�\�Ç#z/)���\� �\0\"B\n\"\�ԩS�P�2\�q\�\�!Ss!�3(�D\0�\0�\"Y)��U(e�P�����JKK\���]<e.\�;C\� \�XY\'��@$\0	\0�\��\�\�Uzz���-�\�&� 5�&M2\�^�b% \0�@�HF\�\��@$\0	�\�9z���\0@$\0	���9�f\0�\0@$\0BfӦM*%%�@\0\"�H\0�\�/���B \0�\0@$\0Bg��f+p\0D\0�\0�3f���\0�\0\"2&L0N \0�@\�ddd��K�@$\0	�Б\r�֮]K \0�\0@$\0B���l\��\0\"�\�\����	 \0�@\�UTTD \0�\0@$\0BGv��t\��\0D\0�\0�\�\�J#\0�\0\"2\�Νcq@$\0	��x�\�wU\\\\�\0D\0�\0��;w���$�\0\":\�ׯW$�H\0 \0��|�r5l\�0�\0\":�\�\�Scǎ%�H\0 \0�3u\�T\�\0	\0D dƌ��~�i�\0\":C�5u\0�\0\"22c\�\�_&�H\0 \0����h֒\0@$\0	���U-<H \0�\0@$\0BG�ِ�6\0	\0D dd\�O\�\0�\0@$\0B����-\��\0@$\0£��H�\0\":��\�S���	\0D�u\�\�\�ժU�\�֭[Ց#G\�\�ӧ\�����@$\0	�����55��LMNNVP7n$P�H\0 \0M�<yr�\"a7�\n*�\0D\0�\0hvx�5�\�\�\�!H�H\0 \0-3bĈf%B�.��� \0�@\�\�ر�Y��\�	\0D�M��2X\"\r\ZDP\0�\0@$\0\�\�\�ٳ�ĉ\'\n \0�@��z����!1z�h�\0\"\ZÇ7\"�\�{\�@$\0	���\�SO��\�KY��\�\�\� \0�@�%\�\�[oU?��ϕ\�\�S�&M\"(�H\0 \0\�[���<@$\0	�vID[\� \0�@�d�~}ڴi	\0D �H�	@$\0	���-D&n�\�62�H\0 �D�W� _\'2Af	\0D�����\� \0� -u����Mj&\0�\0@$\0�[$\�L\0\"�H\0�HDc�\0�\0@$�E�H0\��\0\"HDD\"afs\0\"�H�\�%\"\\��	j&\0�\0@$�,�6�9\0�\0@$���={\�t��\�sO�3\�	�W�^\��9\0	\0D��hm��#3\�ƍ\�\0�\0\"n\�hK0B�ދ�a\r@$\0	�L�#3f\�`q*@$\0	p�LH�`�\�\�\"+V�P�{�V>�O͛7O=z��\"�H�[8��\n\�\�k�L\�\�ʖÇW/���\Z1b����*..NM�0A��ꫪ���? \0�8���r5e\��ƌc$�#�\�5jT�\�kjj\�޽{\�0G�~�\��<x�z\�\�TII	@$\0	\�\�TTT�\�ӧ�̀dN�<Y�Z{\�y�%\�\�E�<�D2\�H�\�Evv��\r�\0D\0��n��+W\�\�ٳ�@:T9r�\�LB$+PF�\�s\�p�{\���-;2,\"�H\0 \�\�TVV���S!C���&\�\�\�S\n3�~�i5`�\0#)))l\"�H@g �\�/^lb\�������C��������H\0 \��H]�L���|�ߵkW\�\�e/\"\�\�0Gnnn����;R�	�\0\"Q����\�*>>^%%%��[�F\�}\�\�4\�5�%\�A�& \0�D�\�/��\�t\�ƍQ��d®�\�N+VR�	�\0\"\�d˖-*11\�d!\�Bّ4\�諽\�]\r��H\0\"Ј;v�\�\�d�{ժU����3<��#w�`	@$�\�\�\�\�Oֱ��jٲe����\�\�L\���ӷ�`	@$�38p@\r\Z4\�L\�\\�pa�z>{��\�bL�&\"�H�\�8|��JOO7!\��W�^%(�\0��\0\"�\�ĉ*##\�\\�fΜ�.]�DP�\n6	\0D�\�ӧUff�I�O�:U]�x��t3(\�D$\0	\�v\���/�@L�8Q���@�&\"�H@�\"��e.@\"\�Ν#(B\n6	\0D:����\�eii\�\0wA�&\"�H@ԑ�IY�A.*ÇWǏ\'(��MD\0����i�r����<HP<��\0\"\�No/Z�Ȭ!J\�߿��@(\�D$\0	h�,]-Y\�ZR\�yyy\���\0\"\��O����&Uݿ�}�v�e�(\�D$\0	��n\�:���`>An޼��@ԡ`�\0@$\\ȦM��<�D�_���@�@�&\"�H8�m۶�\�\��e8��k\�*(\�D$\0	!���R�B\�\�˗#\�\�`�\0@$�!��\�S���f*\�\�>K�Ak�l\n�H\0\"��,%�\�\�\�\�1�K8�\��M\�Vx���\0D:Y�Z����e�eyk\0� \��\�&#�H\0\"Q���\�l�%���+��7r\�\�D�\0D�Iqq�\Z;v�I�\�\�\�eee\\\�\�ÇM\�\"�H\0\"RZZ��x\�	�\�l���L�O�\�o��O	D	���r5u\�T��=z�I�x��[��\�\�dD�\0DBE�&gΜY?\r\�ĉ<��\�*ә	D	h\'2\�m\�ܹf���t3F\�U��ys � \�� ς�@�����<�-2��	D	h�\�\�j�d\������Mq�9}��Y�U��\\ϙ3Ǭv�H �H@#d/�U�V��mRL�s\�N��FVg��\�暈����$�k\�.D\0��6k׮U���*11\�\�/\0\0_!���$\�D���\"�6l\�`\�\�\�.�r\0\Z\"�t�&�:C\0��琹𒒕,ċ/�\�\�\0� \�Is!\�\n��H\0\"\�Qd,7%%Ō\�X��\0h˖-kV$�<�	�\0D\�!\�Eǎ�OAA���!S9/^\�\�1]�p���0�Kĸq\�<D	�`wZ\"\�T��5 D \�ϟ�*++�*\0���\�\Z,25�\0@$#v0`@�2G�QÆ\r3��d\���+W�\0D���}\�fu^�\0D¡\"��hN(N�<i����>}�I\�@t:t�9�>��CD�\0D\�\�\"���!�\�\�b��<7y�d�C\'\0DY\�R\�1�\0D\",Ν;g:�p���\�0�����������*疃\�-D�0:��{����23\�~�p\�\�\�\�S�N�\�\n\n�[=�	@$\�Hi\�\�E�\��\����\�s�\0D\"D\�Ĥ��n�t,\0\�3\�-D���\n��\�ù�H\0 A\�\�/>U��Jۙm�ܗ\�\�\�	\�\�B$\0�Vە�O\�\�\�Y\��F7h�F�H\0\�\"�H�\�>>�\�&�\�J�m��C$�s�\0@$Zn\�y�\�\�N^��C$�s�\0@$ZlG_�\�bg\'�\��!���H\0 tv�pn!� \�\�줒��\�N^��C$�s�\0@$ZlE�Z\�\�\�5:8D8�	\0D�\�v�#\�\�\�MS��9y��\0\�-D\0�h��)\�m\�\�\�stn�pn!\0�D\�\��uU�֒��W���F�H\0\�\"�H���ީ��-�\�\�k���H\0\�\"�H4���i\�n��kZ\�\�\�&\�ȱ|�B$�s�\0@$\���\�\'(D8�	\0D�\�ή=��Z�Eg�H\0\�\"\�a�����\"�[�\0Ŗ4D8�	\0D�\��\0D�s�\0@$\�\�\0�\�\�B$\0	:;@$h�\0\"AC$�s�\0@$\�\�	@$8�	@$\�\�	@$8�	\0D�\�	\Z\"\�!��;\�Կ���7x^ۯEr����\�\�\�?��ڵk�xJ$v\�ء�\�\��M\�y睦\�}y.\�sЉ\�\"\�r��v\�\�!�\�{\�\�\��H���{�\�5��\�\�فgDb۶m\���gϞ\���󪴴\�ܗ\�e\�+\�\"\�r��OJ)))\�\�\�T�N,�c�\�q\����SMHHP\��ַ\��=��:s挺x�y�G�\r~Ny,�\�.\\��H�#D\�\�(\�۷��9�\�8�\���\n�\0p�HlٲŤJ�9bn\�qK�X(\�\��7\�x\�\�\�G\�_OLL4\��\�Ǐ���\�w�y-##\�<�OtvzX\��d$�)\"!\�F�9!���\�<\'o��W��\�EB\��\�\'?1�P䶥O?�k7I��>}��u��\���\�o�ݼVTTd\��\�\�\�<�[y,\�#\�V�p�y�H\0x@$V�Xa\�\�m[\"ʱ���\���>ؤût\�R�?W�>}\�ǒ\�VS#N	{h����\�\�\�/�KϝW��D��\�\�=�ʕ+\�\�\�6�\�\ns;;v\�\�f\�\�N\�\�_\'�\���\\����tֹe_��NAj��-_y\�ϝW�\0\"ѱ3f\�0�\��~�X���\�\�f�ӥ\�ԶƟ\�	p�H\�2!��v�@�;rss�v:\�B$\0\\*4D:\�ܒ,A�\�\"�H\�\�\"\�\�&���\r�\�w�k�drn!\0�� 4D\0��!���H\0 4D8�	D	:;D	\�-D\0���D��H\0 tv�H\�	\0D��H\0\�\"�H\�\�!�Hpn!�H\�\�!�Hpn!\0�� 4D\0��!���H\0 4D8�	�\\(��\�G}�o\�>�M�Ďz۹s�\�\�ϯ\�m	\"Ag�H\0\"��\���ػw�*++\�\'\�v\�\����W��b.\"\�b��� }8���D2HDteB��U!̀�F�����\0\�3\�-��\"\�1\"�H4\�\�ӧ%e�>�\�n��~��c:�S�Nqǜ[N8\�:�\�r�H0��Ht�H\�\�\�ݻ�m�ˎ;�\�\�7�ݹ(�\0��[�\�X \�\�Xg�[^�/��T}�\�*ulg�ir_�C	Wq\�\�%#\0\�q\�9VQQ\��8xI$�T|��n\�R��4�A�\�\�5\��p\r\�ϟG$\0:A$���	�\�\�\��\�D\"\�Vrl�H���\'O�\�\�Xzz�DαÇ#��<բH\�k\�\"\�\Z\�}�]GOЁ�\�\�O��曈��D\�\�\�SZ	y\ry@$\\�tn			��\0H���նm\�	D�@$\�\��\�\�M\'\0Gjj�Z�~=\"\�!��Y\Z-����< �a\�ƍ*%%���IOOW�V�B$<$E�Z	y\ry@$\\Ú5k\�\���\�\�:��#G�E�!���QGwLn:����אD\�5�\\�R\r:����0a��3g\"\��\�\�6	yq@$\\�|J\Z5j==@2u\�T����HxI$�_WEo-i:����r���\"\�n\�Ν�ƍGOЁH6B���7DBV�<U��\�\Z	y�\�-	\�0}�t5e\�zz\02�D�\"q����h�z��	-J�\�\�9�\�\"\�x&M��f̘AOЁ<���f\�\"\�^�h+Av�p-2�1o\�<zz�D֐��$	��D{��e\'	D±H��ii\0\�֭[Urr2\"\�b�W\"\�H �eذajŊ��\0Kѻ_$h��gE\"--M�]������?\���!�D�\�޴i==@r\�\�\���	D��H�ٰK6\���\�\�ŋ�D�\"�\��\���\"�HtC��\�g\�o �\�۷O=�\�S�\�2&&F]�z�˲~/�\�\�j)�\��o\�\���u}���Y�\�����׭X?�P\�\�\�ҷt۫\�N�\����ݠ\�j}\�r��3�v�~��oG閪[�>\����\�\�\�{OBB\�\�>��\��c\�.��\"a#\��\��\�ϟ7�|>\\�/>j̘1\�\�_Vd$\Z���\�\��k-u\�r\�!ЭR�G\�\".\��\�\�\�\�rq���~�\�\�/}\����(R�\�|�\�\�\�d\�e}�E$BdB?~�N.�\��a\���(\�\�s���U��\"+\"-�Ո\�\�B\�\��@$ꐎ\�\�ɓ\\\0\�@:@�t:y�d�ݓ\�A����\�Ǐ�6DB_�?����1�;c�\\?��d\�OLL�5�\"\�M��O>E@��WdƓ\\E d�\�m۶�\�\'uC&�2TѧO��ֽt[]�@�/��\�2z�.�\�\�	�#\'�K�\�\�\0Z@Ώ\r6��cǚ�@�o{�����H\�و�vQ\��\�A\���~���m\�FAA��\�\�~�\�\�u\�w�����Q}�+E\"\��F$JMM�9�\�\0���ٳg�\�\�\"R,9s\�Lӑs�D.R\�H\"\�&5o�\�\��n���\��\�\�\�ȑ#\�FH��zgg��ވ��?i1%\r@�\�\�R�\�/�#F\�Ifff�u\�\�Q$\�\"QW\�\�D$��Q\��_ܺ�\�׿�u�\'Nt\�\�me	\�\�v�\�{\Z�W\�\�\�\�_��_�\�}�\�w��w\�G(	�\"��x�\�\�j�k\�.5u\�T���h.b��\����ͧ=\�8�б�o!a�+n\�H<�\�C&rQ~��M��d����v��)���ڼy����\�7y]dAQ��dۏ���\�1��H�/R4&��\0�@QQ�Z�x�\Z<x�\���x5q\�D�ꫯ�\�\�J\�y\"q�\r��v��\"!���\�ǫ��\�\'�\��\�?j�\�c��hK$\��]��uh\��\���4\�B �w\�}�����\�\�O���t�\"\r\"C�U\�=��*..&@]\'-\�F|iY\�	\�\�\�\�`�/�]XXX�]�\�\���mQG$\���@$\�HnC:׹s\�\�I\��ӧOW���Iv�i�\��Wd�Cj\"��PF�D\�w���Y\�T\��\�{&�]�\�\�2\� \�I�-77�ա�-[��8��HH&DK\����ǆt�\0N���\\�^��A�\�Q�\��\�o\�O$�@<\��E�\"�\�c����d\r\�\�+\���\�\�R\�p\�]w�X�\��y��\�-\�	x\�nPl\�1�ظq��\�\�$��g\��������LZ|��\�駟6[uC�	7\\(Xْ�-�:֬Yc\n\�\0�3R-�d\�5d\�#R\��\�O�Ԭ\�7�B$	D�\�RV�\\i�\��y�={ֵ��ȁLMYiy�X�l��\n@$	D�\�&\�~2�\�B����U\�\��-\��2<1p\�@#2l1m\�4���G�$\"�H �DwE�cƍG\�\�0���\�[ս�\�kn�*R)�\"�v�\�ȑ#Ջ/�h\n(�@$	D\�ȴ�)S�л9L\"ly�O\�N�	\�*\�L���l�L͔B\�y�\��L\0�@$	D\�hƌ�n����\�ȢO��Szzz�J�&L0�DQ$�H 4D\�Ȱ�|\"gJD\�\�%CrQ��\�\"+\�\�r\�R$)��<H��,K}��i���H\�	�!\�\�Rp	Ε�p�9dgKY�!܌�lp���c6��\"I\�\0K6\r�dc,\0D��H�\�\�~Ŋ�n��`��\�\�ڝ����~���=W\�dn)�|饗\�\�ѣM��Jfdd�\�xei\\\0D��Hx���4S9Η�\��h\�\�8`\�!x\�\�ϖ\"ɽ{���3g�\�\�\�\"\�9s\��\0@$h���EB.R�\�_\�RfB6�!h�\�\�\�%%%���\�q\"RO�a\�u\�\��@�H �\"��	S6\�gI\�-A�\�6\�\�\��lݺ�Y��&C�P�,�.�3\'O�\��\"�H \�#\r\�J�G{\�\"\�D�G$�\�L�Z��E���̺�\�w\0@$h������,Mэ�t\�pF{E\"�}%\�К@\�Mv�@$	D�hrq!u]\���d\0\��\�>Ԛ�PDB�阽{�V}��U�\r2\�\��qc\�t@$\�F�7s�G$	���ϟ?O\�\�\"a7�`�_�>j�H�f\�j2�C�\�\�&32d�I�YE�\0�\�ٻwoMYY�VRRR�E�\n�p\�E\�ҥK�n(v�z�\�\�\�\�\�G$\�\�\�\�:,]\r�D\�\�޽{f^^^\�g�}\�m/\�ׯ_w�D\�ܹ�Z����Ð��/t��h�ɢC��v�O��	\�nr��U\r�ɦL2#$99\�L1�&�\'\�Ѳ��\�e\rY>Y>	\�\�XÇ7�1¬����i=\Z;v�I�\�\r��rVV�\�hL\��\�\�\�f(�D-\�ٳg�Me;jYmq��f\�,Ѽd\��\�,�%C���\�4)\�h�[�N���\�fz�L�ݲe��ݰm\�6�c\��J�lg-��2ur������\�ԗ\�\�G�5KL�Y� q�\���\�P[K8i�/@$�3�\�7U��RR�ݭI\'}��_\��\�kԪ\�$�\�H�LH+�O�����egY�P\�����3g\�ER.�Ǐ7O��\�\�T%���,Z$[�\�\�?�L+���\\�7o\�l>�\�\�ZR\�2�\\\�\�b.��rq����e\�\�E_.�������\�~ �\0�\\|E\ZDD\"D&&O�l\�B$C\���\�|�3ƈ�H�ȉ4�����i\"6\"9\�DxD|D�D�D�D�D\0d��`y�\n�+9q\�S\�h�{ݙ�h��ЫW/s\�ٳg��\"\�2z�\��Mݿܐ>�h ࢡ\r�\�\�\Z�\r3tdF��J@$܉\�\�\�\�w��\��S\"�H�\�EB2��i�ή���\�`X	wbYV\�j���<��H�CEBV�\�\�\�o��Κ�\�V\�\0�D�G�=�}����\"�H���u3��̦�D$�%��@$�Gll�\�ܰ�\�\�\� :�x\0�v�=�[\�X\�R�N	Wg#.5\'�e}Dt	��\���\�%bEk3\��~���\"\�Lt\�\�\0���Вp�\�B�&�e�G�	�Xf\"��$	\�\���\�hY(\�\�K�F�6\�v��KD\�LDux\0�p/Z&D,��L)�ԏ\�\�\�P\"�H�3�H�\�\rw\\��|��\"P��T[\�2œ\�J@$�����G�\"ЮL�]S�D\0\"u\"Q\��؈@�d\"��\'\0	ψ�\�۷﷉\"ЬL\�\�\�\�a\0D\�S�w��\'\"\�\"v\�`O@$��l\�}2ݓH \0�f&\��4Ʋ����F$	�V�\0@$�1>�o�\�\� �\0\"��L ����O�\"�H\0\"\�\�H\�Z�u�H \0� �Hl\�\"��H \0� �H\�� �\0\"��#\���@$\0	@$ d,\�*�\�>�\"�H\0\"!\���?\�m�@$\0	@$ ���k����@$\0	@$ ��iY\��!�\0\"��#��q�@$\0	@$ $�g\���H\0 �H@XX��\�7\�	D\0�\0D\�\�xD�*\"�H\0 �H@\��|�A~��2�@$\0	@$ d��4\�7�	D\0�\0D©�X\���?$�\0\"�����W�L�G$	\0D	�\�2_�\�n\"�H\0 �H@8CGt[O$	\0D	\'#qV�ED�\0@$\0��pD\�n�\"�H\0\"\�ė~�?�H \0� 2Z\"n<��\��A$	\0D	\'#Q����#\"�H\0 �H@�\�&�)S�F(	\0D	����Z�UK$	\0D	�>\�\�/\� �\0\"��S/�6�\"�H\0\"!\���\����r\"�H\0 �H@\�X���\���\"�H\0\"!�����D�\0@$\0��pj$v\��&�@$\0	@$ d�~�\�\�\�L$	\0D	\'#Q�\�\n\"�H\0 �H@8\"�n3�\"�H\0\"\�\�%݆	D\0�\0D\��\�@\�1\"�H\0 �H@8Ŗ5Z$~F$	\0D	\'#�~�\� �\0\"��ģ�>�]\��\"�H\0\"!�/�O�I$	\0D	gX\�q\�*�\"�H\0\"\�ZfX�UA$	\0D	-�u��	�@$\0	@$ ���t;I$	\0D	�\���\�\��H \0� NFb�nۉ\"�H\0\"\�\�q�߿�H \0� �H|\����&�\0\"��#�\�I$	\0D	G$��5D�\0@$\0����,�:..\�WD�\0@$\0��p2�			K$	\0D	��={~��?	\0D	�\�\�\�{�~\r�@$\0	@$ d��i��\"�\0\"��S1���\�D�\0@$\0��pDb�n�	D\0�\0DBƲ���}D$	\0D	�ϷQ���\"�H\0\"!\���\�\���\"�H\0 �H@85��L�L$	\0D	\'#qƲ�\�D�\0@$\0��p2e�e	D\0�\0D\��+�e�	D\0�\0D\��Z$~C$	\0D	-��� �\0\"��\�m\��\�\����\0@$\0��P�5�^�Z\"�H\0 �H@\��|��u_PM$	\0D	�\�����D�\0h�\�\�T#��~��(@$�7�1V��D�\0h����6Eb���\n	\�e$\�\����@$\0\�d��-JDbb����\"H�Hx˲^\�\��@$\0\"\�J��\�K	om\�Э�H�X$\�S\�ƍ\�\�ɓ\�\'ʸ���@ �RRRԤI�\�ʕ+\�իW\�i�E����\���Hx6#�\�\��#�p�H��S�6����Eff�:q\�=�++Am ���8�\��D\�E\"!�gΜi� �h�I��4fРAd#\0�\0{h\�S-���KD\�ȑ#�co,�V˖-S��\�W�|򉪬�4\�\�mYY�z�\�w\�\��{���\�\�k\�\�\�Ձ\�}��]�v\��Ȱ\0\"\�i��²��D\�\"!�{\�a�ѣGI�y�f�\�\�СCj	\r\�G\�&\�kh�]+A6	\�\�H\\��|�C$.\"�C���j˖-!	Dc^{\�53���ph��\�ݻ7�\0D��\�M\�\�%	\�q\�8u\�TTN��gϪ�C�6\�L0\�\�SO=e:d��@$<-��;D¡\"!i\�\����y�&�~�2!5`\"�\�z���\�{\�-2��7\�۷\�_\�u�H8X$dvF�pF�2\�e&��9�x\�	z#�K�-ӦMC&\0��H�B�6��CEB։������Dj&�\�%dH�-m=�H�}\r꭯�D¡\"!�M\�θq\�F���cǎ����h �_�\0\"\�\rdڧL�$	���\�)S<;\�B��YQQA��D\�\�0 \�B�\�׃�D\"!\�0�,#�\�*��V\�\���z�jd\�#,�\�v�	@$�!\�\�k�I\"\�@��\r�\���+:�$\\�fM�%��˖,^�\�\�\�cس\�;�u\"d&\0�p7��\�\"�v	��\�\�i_\�e\�\�\�D�Q\��\\�|yy��7o^�5-	\�ID\�\'3���E\�-\�F�H8P$�\�#>��\�N=	e]�\�:	���\�Y�����Xs\��QSSc���\�\�h|5�H��\��\�\�\�	�D��\�ހ���\�\��\�|�\�ѣ�\�|\�%�h\�82�H�:#qN�\�!�� �HOO7��*YM�2\�,�%\� �-R\�=��\�\�\�5��\�Ν;UAA�:x�:y�*))Q/^ds�.\ZΐC]\�ۢLK�\��a\0D�ۊ\�E�\�7�H���(#!���w\rn�V�RK�.U�\�\�W�g\�6�L���Ըq\�ԨQ�\��\�\�Ր!C\�n�r\�JJJR			\�=e\�D�L��M\�\��#\�\�\�\�\�\�{\�{\r6̼�|�xegg�\'�|R\�\�䘟��\�Wk׮5[`o۶M\�\�\�=Dd�\��\�Ӫ��T]�r�\�T�\�%�%I���^�a�	W�\�U\�D�\Z��h\\#!H�@2=�!\�G����l�d-${!Y\�fHVC��\�l��L���,�dC$+\"\�ɒ�����\������Jd�I��4\�F]��BR9N���y4h�\�.meZ��\�\�\�vID��a6 ��j�\�w?�p�Ht\�Y�\�\�3fL\�p*rA�bQ��3gΨ�G��̅d0$��i\�&�\�K/9:\�2k֬ve\n���o|\�했\�2A\� �(��\�}\�\�	�Dw^GB��\�*A\�Y\�	�\�\�As2�D0\���{\�ٳ\�7\�v���h8P$\�SpW�l)��ۻ��tOdGW�_�\�{B�:\�h���\��|(�\�\�\�|��\0��#�=�u��H8T$\�Sk�Ο\�\�\�\�\�hg$dX\0�p�H�F_���CEB�4v����0a��T&:�F\�ދ�a\r@$/)�Zp�H8X$���\�\��yG�\�k�5�\� \�	��LDs\��S\"\���d}-(#	!�\�R�&�:u�CN<ǖb=�{I6\�\'\�ͦ�\�:R \�l\r@$\\%K�\�3D\�\�\"!S\�]6\�\�K��M\��d��=\����;�k�/�\�\\\�R�� \�@_6X�u�H8\\$Y x�Cd\"Z�	\�DK�|�~\��a�h�D\0\"\�:�أ[�p�H�7on 2\�!5�`JMD�p�4Y\�\0����	\�0�g�\�\�\�X/	W�\�!\�J	��Ds2a\�\�8t\�PH\�#E��*c\�%��\�e&\"�i@\"\0�p7�e}�\�R\"\�\"���9�k&��;d\�w\�y\�\�\�ao�%�R!�!+V/6\\�p��H�G\0	W�D��FL!.	A\n!�gsD\�dv��d&B�$	\�m\\\�m\0�p�H\�\�:�r`�\n�\�ir�,6%{<\0ؙ��s\�O\n+���HT�\�\��?���E\�F�Ӗ�9$K!8oAn��\�\�)� e\����p2\rvM��7���5}���1���H4f\�֭��c\�z�X&�[\0�p}FB\��D\"!\�[$d�!�pd��{\0 \�!!!\�o�5��HxP$6n\�ؤ&������x\��\�\�	ok�ڲ�j\"\�A�HJJj\"����,VfB��@$<9�\�\�\Z��H�^��ř\Z��\�w����)\�@$��\�\��\���D\�c\"\�\�BUv��4\0BEV<�t\��\0D\�{\"�>�?&	��\�\���^	\�Dyy9�\0D\�{5k,\�:F$<$�e#��\�U$JJJ ޫ�خ\�>\"\��bK��\'O���\0\"A��Μ9C \0��H��|�	�\��\�\�\�V\�\0���H)\0\"\�9�8�\�D\�\�\"![�#)�?$�K\0��\�D\�nO	��l\�%{n\0D�\�\�@$<�eYZ$�	��t�r\0����\� D�\�@ ЛHxX$�\�ߏH@\�$&&���<���D\�fll\�	�DAA��4		�\��Ν;	 \�	�裏~�HxX$���U�~�\�Q \"��ﯶm\�F \0�����\�� �={���4@$\�6��7o&�Hx+q�n5D\�\�\"!\�hIKDԆ\r \"<fY\�u\"\�q�ؾ}�IKD A�\�>.\0���2Ct��Hx\\$^}�U���L�1d\����K \0��H\�\�\�S\"\�q��qm\����C��\��@\0\"\�!|>\�J-ED\�\�\"�i\�&D\"f��\�\�\�#�Hx�\��G\�\n��\�EB\n\�P F���}�Y����6\n,\�z�Hx\\$֯_�RSS\�Q \"233\�3\�<C \0��H\�\"���HH��T\�D¸q\�Լy� \��b�\�?�Hx\\$^|�E���F�1q\�D�\�O@$�%\�>�o<��HȔ=��	�&MR3f\� �Hx˲�j��\'�U�V���tz���S��\�\�l���2\�~��\"\�q�X�r�Y\0 $!Y	\0D\�S\"Q����\"\�q�����\0@$H}�\�I\0 ޠo߾ߨ\���6�\�q�X�t�\�\�ȠG���2s\0�����?�,��H jѢEjԨQ�(����%�Hx�\���n7�\"�,X�F�M�!�Z\�\�\0��g\�#�\��%�@$TNN�\Z3f=\nDĲe\�\"D\�[\"��\�\"�H0�\rQAv�d� \����\�Z$\�	DB͙3GM�0�\"��\�\0��H�\�\"q�H Lۃ���-�HxN$v���7�\"�fΜ\�BB1lG���\�qP�W�\"��O���L�B��y�f���B \0��N�\�i˲�	D\�\� �$\0D\�֭[Urr2�\0D\�;\"���D�`�%�\n;w\�TIII\�~EE�:q\�*..&0�H�wh\�n�D�0\�\Z2�\�^D\�\�\�Ull�\������kd�\0�puF�*��@$L��\\�\�\�ɓ[i\"\�\�\�\n	��D��0q�@$\�O<�fϞM�!g%���EB��\0	W��\Z8p\��	DB�?^͝;�BFVEmI$Ο?O�\0�p)�{��k}���\'\"�cǎUO?�4=\n���h�F�%\��p7qqq�\�\�z5�@$��\����\�Q ,V�\\\�D$�\�\�G`\0�p1����\�\Z�@$���j\��(62�Ö���@$\\�\�\��\��ω\"a9r�z�\�g\�Q ld1*[$\�>\0\"\�n,˚�\����\"a\�\�\�PK�.�G��HLL4�\0���\��Z��\"a>|�z\�\�\�Q \"6n\�h2\0��\'2�\��}�@$C�5sн9w\�)bܵk�z��\�ia4Y\�;??_��Dd5o\��\'\"�H\�\�\�ժU�\�Q��D\�ݻW������*Z\�*//O�:u�,@$\�\�H�\�\"�{\"�H��rss\�Q�1��@\"�+�\�@$®��D\�\�l\"�H\�\�\�ԋ/�H�ҍ��\�&C\0�D\�C�e	D\�0h\� �\�K/ѣtc\�\�\��\0D�e$*-\�\�K$	Cjj�Z�~==�D\�\�/>U��Jۙm�ܗ\�D�(�\�M\�\�#��a\���jÆ\r�(�+���۳\�\�?�n\�\�9y\ry@$\0���HȊ�\�\'��a��jӦM�(������Dح\�\�\��\0D\"*<��\�!\"A$�zRRRԖ-[\�Q.\�y�E��אD�hЧO�����\Z\"�Hԓ��\��.���OiQ$\�5\��\0D\"\Z�|�Gcbb�	D������\�۷ӣ � \�&~��n��\"QORR�Y:�-2K�%��אD�(�\�t˲J�\"Q�\�ڸg\�z��DQ��EB^C	@$�ALL\�\n\�>$�D=���3��E\�\�\'G\�\���k\�\�\�5\��\0D\"J\"�I�w�\"QOBB�*((�Gq�HH;S�\�D$\�9\��\0D\"�\"�W��D��\'>>^\�߿�\�\�\"q��*zkI\�a\r����< �HD˲\�\�\"��H \rD����\��\"!+W�*X\�b���\�ꖈ Q\�H붐H �\�\�ũ�ң8Q$�_W�\�V\�6�E���#ǒ�@$\0���\�_&	D��H9r�\�a\"\�V�\�\"�De$���|��\"QOll�:~�8=�\�D�=Y�ֲ�\"�D�@�\�\r-��P \rD\�\�ɓ�(�p%\�n�\"�D���xi������!\�@$\�	\��\�\��(N���!�\�~;\"\�~����\�[\�\�\"�����M#$�D�(..�GA$	���\�\��V\�\�\�HLL���\�%B��u��\Z=���\�\�W%%%�*�\"�\�\�;\�T�.�n��/|#!!\�o�\�*m=^�\�\�RzD�\0\�\�H\�~�\�111E�\�\��z�\�G�\�\�MY�_�H�	U^^N��H \�Y��\�۷\�j�8�\�M˲\�\�\�\�F\"Ze\"�	DDEE=\n\"�H�\�E\�&66\�\�2Q�e�Z��\�k��ѪLԐ��H\�E]�r��@$\0�h�\�h��\\\�Vi�xF?u\�\�\�Ր��HH\�\n�\"�D�B��\�\�*��4$��	D��H\�\�\�У�X$:d���������׿nn{�\��r]Gl���\��s�k\�.D\\%6\"\"uR�\�b��\�\��vd`\ZG̈́\�D\�ҥKF$\�͛�L�T$dgW��\�T\���y\�ĉ*111�\"!��\�\�k\����?D$��\"a_<�~�|\��\�\��\�\�\�DY\"N\�\�\�d+2\�\�qd&���8z��\�߿�JJJR��gq�H�\�\�\�t�;v\�h�4�xݺuF\�Vl�X�\�w\�?��\�			\�[\���y���RgΜQ/^4\��\�ѣ�\�\"�en��	\�\"a�L)Ĕ�L-�I�fW](Djda�0���\�\���\�d\"X\"\�,�\�$\�$�$���cfp̙3�섋DB.\��TYY٪H�$�$��i.��\�hMB\�x\�\rs��G�]2�\\AA�\�N\�\�w\�}浌��x۶m\�Ȏ<�\�\�H@w� ���L�)�2u4�W��Ȍ,�U�ow\��\�j\"���`�h\��[\��H\�HG��\�t����Hg\Z�\�\�w\�m^��İa\�\��Is5���\�\�\���7[Z���\�}�^Cn\�<�H�SD\�F��ŬdQ+Y\�J�\�D��\�\�V\'+z�\��\�0+[����S\"�\�\�U���.4ىY�f�\�\�jzm��v��\�\�h,P��\�\�\�1����\�f�#33\�\������\�\�4����\�S?�\"��\Z	p�H\�\�2\��\"�\'sY~[߿�DB�\�d\�cb��3����$��LP3\�����\�SRRLvBR\�\�L��K)��L�=4!ŖR�`�\�}\�t\n�	\�\�\�m\"v�\�\�\�y9�9���H${!�\��\�\�رc���\�\��\�d���-���t�H\�\�F`Z$g	�4\�\�Է7�\�\���U}�r]\�\�\�\�\�V��o�\�cI\�n{e\�\�\��o7\�Z�\\ֶз�Z	�]\�_����Ɔ8\�МL�\"sxY$l/^l�ӧOg�	���#G����8#2t �?�p�\�/����뮻�t�/\��R�y�\�/\�3f\�0�\��~�X�*\�\���>�2*\������\�,A5�Ϸ��LE�>}~�/\��=��\��\�}k�n��\"?B2\"2#D²:YxY\�n��Џ߮��㺉l\�\�G[\"�z�\�m��\�B��\�L&��\��Px�\�k��\�c\"!Ș��T�~�\����\�}&4D�N$:�F�%��X\�GF3\�\Z\�f�vFb�u���Ͳe\�Lv\";;�\�\"�H\0\"\�\r�\Z�²��|>\���Yh\�\Z��\\\"\r�5\0RSS\���g\"�H\0\"ѥ\"�\�:��\�\��t\�ю/\�\�Y,N�H4\��\�\�Mvbʔ)�\�	D�ΧO�>?�Y\"a.F\�\�l�h�#\�l\rD�M��РA*>>^\�\�\�\�+!� \�bb3�h�l9�\�8\"\�.V�Ze�YYY\�\�ի�N�\"��s訽6�D\"4JJJTZZ�\�N\�ٳ�\n�@$\0�p^f\"X&�\�Ҿ\�?��c�D\"rdA#ٲz\�ĉd\'	D	ge&\"�i@\"�\�q��y5d\��\�Ν;\�	D	gf&\�D\":�]�\�d\'Əo�OD�\0D\�q5H\"ѵ����#ccc\��\�\�\�	D	gd&\�3\�Oa%\"\�i�[�\�d\'ƌcv�D�\0D\�љ	���@$:���25|�p��غu+�\"�H\0\"\�L�hn�	@$:�\r6�\�Dff�����7C$	@$��LLq\������\\edd�\�Ė-[\�\�	D�\�]3!2�w�x\"ݍM�6�5j��x�\"=[3\�ڵ��?\"�D�g&,\�RH\"\�-������\�ݻ\�ԗ \0\�i2�H\�\0�\r\�e�o߾\�&�D�E�8D&d\�C�>\�+N�>����\�g�}�DI\"N�:\�? ��Dm\�޽��H \�\Z)��\"L)Ɣ�L�_�ؽ{�I\�w\�&�u\�O\Z�DD\"QcYV\"�H8�*\�	�.*i}\�\�ȧ}I{ ���}����@$�,\\5v\�X������\"K�#�H�^$�}>\��D�p���d\'d�m\�\�\�\"�H�^$����\"��c?�\�\�_��X�f\r\�f�\�I�\0\"\�j��fYV_\"�H8\Zٖ\\�\'�m\�e�r\��;w�\0D\��\"�>ϓ�\"\�x�^��&N�h����� �J\�\��H�Z$.\�6�H �A\�V���Wiii�����t!\'N�0u,\0���E\�n�D�p]v\"++ˤ\�W�ZE@��#G� �H�˲\���d\"�H��7\�|\�d\'\r\Z����	H\'SXXh\��H�:#�nO	DµTVV�)S��\�\��\�\�	H\'��~D	��D�eY\�	D\���������Μ9C@:)#$1@$\\-\�jˉ\"\�	d\�\�\�\�l��X�d	\�`d�\�\�D���E\�\�r�\"Ṕ{�~�Ԁ\�E\�v\�ء��� \��Öe�\'��\'�ӧO7ىŋ�\�\�W_U\�\�\�	�%\�ݏ��H �EfH�=%%E�<y��D�M�6��\0\"\�\�D�n;�\"\�i���լY�Lvb\������D�\r6 �H�?#�[��o	D44\�	I\�?~��D\�K/�d\��\0@$\\-�\�\�\�\�#�\�!و9s\�\�DNNىX�z�\Z<x0�\0D\�\�C�t{�H ЈÇ����WG�% a ˓���@$\\L ��eY\�	DZ\�N̛7\�d\'\�\�Dh\�J�Æ\r#�H�;#�n\'�\"� 	\�LH�B2\�>�.]�F�A \0�pwFb�eY	Dڑ���	\�NH\rى�Y�h�\Z5j�\0D\�\�\�>1G���\"\�DfsȬ�\�!�<�e\�ϟ�F�M \0�p�\�\�L\�>%������&$;!\�O\�:\��+7n�\0D\�\�\"1Q�D��0��0eEL\�N\�\n�Аٳg�\'�x�@\0\"\�b|>\���\�s\"�H@\�^����;d���3g���,���k$Ru�L$	�\�ET���]EewQPjڴijʔ)	wm\�[�u�H %�-[f�\�\�ٞ\�N�D�L\0 \�%�\�2QI$	�\"gΜQ���*!!Ax6�&M2\�\0��{�,\�7Z$��\"��\�(\�	�d^YY\�\�_\n-�\�\0�p/qqq�\�2QM$	\� ���\�����*??\�S��L��)�\0��{\�ӧ\�O��\Z\"�H@#XIvBf1\\�z\��sff�z\�g�\�\"\�b�\�\�\�\�	D:������f�{�\�q�\�+\�c\�2\�\0���E\��Z$�\"�Inn�\nj\�ĉ�\�NȆ]K�,\����\�ٳ\�7	D���\�ϫ!C����8�s\�NW��C�U+W�\�\r��\���2e\�׈\"]�ڵkMvb���\�ʕ+��\�\�\�\�Mm\0\"\�~�\�۷\�_	D��\�\�R5l\�0��o\�\�\�K\�A^|�E���H�˲j���@$	\�b֭[g�cƌQ�.]r�\�#\�^\�w@$\\���\��\�!�t\�\�\�\��\�\�Mvb\�֭��]d\�\r6�GD\��\"qS���\"\��\0KvB\�b���p\�\� [�o޼�?& .\�\��\�x��\���H \�\�(//W&;�e\�\���\�\�ɎϪ\0\"���?�<F$	\�lڴ\�Ȅ,�t�\�E\��\�IIIjǎ��p�\�\�U\�D��n�������HLL�\�\n��H 1W,\�J!�8\0\���!�\�.\�\�d\'N�hP\�ѯ_?�w\�^�h�H�h�B\�\�0\"�H�C���aJ1fw�!?�,J\�\\�\�\�D~d�\�+�\"\�b\�r�\�7�H \�0��Q.\�2]T��v%�O�nQ$얓�\�\r	wf$J��iD�\0\"W�;\�d\'�z�\'YH�%����l ����X\�\�\\\"�H�����%;!Km˒\�\�-+A6	W�\�-��\"G6��Ϳ\�\���5k�\�g��\�\�F\0\"\�\Z�S>�o%�@$�%ȶ\�=�lS.ەw&h\"˖-\����k$�\�s}-�@$�EH`\�ĉ&���۩\�[6\�%\"!!AUUU�D\�\���>�o#�@$��\�\�\���x��wIII�|\�]�vՋ\�ڵk�#\0\"\���\�~-\"��8;���e\�sX�jU�|\�\�\�T#NZ\�\0��\�r�n��\".\�\�7\�4\�	z��(;���|ջwo�5\0���H\�� �x�\�\�J5e\���X�|y�}���z\�tȓ&M\"\�H��\���\�S\�&�x���S)CgΜ��D\�z\�\�\�{\�5�\� �\�Hl\�\��@$�cȰCvv�\�N,Y�$�a\�ôiӐ	@$\\�\�C\�\�P\"�H�Gٿ�٩s��fu\�hID[\� �\�H�Э�H \��\�\��\�\�Mvb�\�\�Q��ƯK�\0�p�H,�e��\"�\nUbb�JIIQ\'O���D\�0\���;	s,\�*!�����Z͚5\�d\'.\\�jjj\"��`��\�\�\�L\0\"\�\"�DL���)%�@<h�\�\�\�\���\�KD�׉L��\0D\�5Ccu+\'�@$1g\������\�\�D��\�L\0\"᪌\�P-_	D�E>����T���Մ	\ZH�ȅ\�T�6\�\�q\�L\0\"\�\Z�H\�\"q�H \0m���\�o�[5~���\�z�\�a:_�mI&Z:�\� \�ǯ\�\"q�H \0\�\Z��%B�C]\�ۢLK�\�\�\�}\�L\0\"\�L|>ߣZ$�	D�M�h|�oN�e��\�m\�\0D\�\�\"��H\� �@HіL\�4\��HD��a6 \�#66�_�H\�$�@\�њL|\�\�h�D4�	j&\0�p�H\�\���k�\"�D�&�H\��H8�����׭�H \0��={\�t��\�sOH_\'\��3�X��^�z����\0�\�\�$&&~G�qC$\0�\�H�w�!\��q\�\��G\0D\�܆H \0\roD�F\�ދ�a\r@$7�!Ӻ��H \0!\�D4gm�8 \�	�\�7�@$\0Z�\�77�\"Z\�H\�\�\�2[	g�D�eY��@$\0Zvh�1�\�ʖ�F�\"ȀH8W$j��ψ\"\�0G��\�@\"\0�p�HT���_	D�ݙ�`��C{v�>��\"\0�pZ\"���\���D�\0hwf\"��$	\�e$*u{�H \0.\��	��+E\�K\�\�\"СR�D\0\"\�ڡ�K>�o�@$\0\�\�L�g�C�xRX	��k3�k�E$	�\�L\�5H ��2ݲ�\"u�hn�	\0D\�u\"q\�\��\�\"�@Td��{\0 ��sZ$r�\"1\�\�\�ʲ,����\' \��\���_J$	���z���\�R�\0D\�#h�8\���O$	���x���g\�@$�#G�y��H \0SRR\"\�	@$<�>\�}>\�f\"�H\0D\�\�ӧU  �Hx�Fb�eY�	D b�=�bcc	 \��<\��	D b\nU||<�\0D\�[\"�]���\"1*!!�@\0\"\�!�>B\�$�\"1�v\�R���	oe$\�\�\�\r\"�H\0D̶m\�T���	 \��\\YK�H \0�i\�&5`�\0���\��\�\��H$	��Y�~�JMM%�Hx-�cbb��\"1�W�V�&�HxK$f\��D�\0��+V�aÆ@$�U#��[�@$\0\"f\�ҥ*##�@\0\"\�-�\�\�\�s\"�H\0D̂\�\�ѣ	 \�\Z\��E\��@$\0\"f\�ܹl��\���|��H|I$	���9s��8q\"�\0D\�[C�{�bՙp���\r��,H\�%/Z���P\�R�B-�\r�\�s\�33ƨ�\�\�\�7��ML\�č�i�I�tm16)v\�\�0Gd4-M\�`2�kQ3�3�\�4\'�νw��{�\�Y�e~\�{\�w\��\�\�\�ɮ�&!$�f6lH���!��s\��m�T\Z2	!5[�v\�\�]	Q\��Q�X6	!5[�jU�q\�F�@Hĵ��\�\�u\�$�\�,|c\�\�3�DD\�\�\��$I�Q�P�x ݼy�A $\�ZژU,����څS-_y\��@HDd\�\�\�B\�\�\�nɒ%\�o�i���I�\���I	�ɢE�\�\�\�n�@HD�g\��C�P�\�\�\�t\�Ν���L\�l9o޼?6	!5iooO�\�\�c��6\\�455\�jBj�`�����\�3�D|K����\�$�\�d޼y\�!_H\\(\nmBj\�\�ښ���\ZB\"���&�;MBH@M���ӣG�\ZB\"�͖\�\�bBj�\�ǏB\"�;g�\�n�P�R���8q\� �\��%Ir�I	�I8�fpp\� �\�`v�0	!5�ę3g!_H�&I�.�PsH���B\"��8��\�\�&!$�jCCCc!B\"ʐ�4��\�$�T\��\�\�B!oH�Wvm5	!U�H%I�a�T\�fB��\�\'��\�r\� qޑ8�];LBH@\�>�裱�@HD�ٵ\�$�T���/mii1�D�!q I�3	!U;x�\�\�\�?AHD\�g\�/MBH@\��\�ߟΟ?\� *�J��$I�I	�ڻﾛ\�}�\����P�Pؙ\�D�I	�ڮ]�Ҏ��@HD(I�\�b��k�P�w\�y\']�p�A $\�\\\���,$������m۶-]�x�A $\�#�9��OLBH@\�^{\�t\�ҥ���3$��X,~fB��e˖t��\����P�\\�Y&!$�j/��B�\�CB\"ΐX��\�)�P�g�}6]�b�A $\�\�l�<�N�����=�\�S\�5k!�b�ؙ$\�\�&!$�j�=�X�~�z�@H\�\�\�:kB�\"\"\��(�H�$I�oLBH@\�²FX\�\0!\���ɮ&!$�ja�e\�p	B\">I��e�X6	!U_�_!eH�Y#&!$�j˖-;�\n�D|\�\�\��\�ĨI	�Z8;�\rB\">s\�\���b�h~B�w\���o���A $\��\�Bj\�\�ٙ\�ر\� �\n!�\�$�T���#ݽ{�A $\"�;\��&!$�*,H�\�\�g�xCb�����P����t������T�T\Zijj�\�$�T%�K$\�\�\�1�D��$nii�+�P�\�\r$\�\�\�3�D�K\�Q\�&!$�*\�\�\�\�c\�!oH�/\nw�����d��������wi\�l�>\�bB�����@HĻ\��\�\�\�$�T%|�����2�D�!�\�B���I	�:$���!\�\�Ʃr��\�$�Tlddd,$@HD�\��R���I	�ؙ3g�B\�\�\�g�B\�Y�P���A!�����?\�r�\�&!$�b\'N��\����6�g\�\�&!$�bǏ;�\n�D\�!�\�r��\�&!$�bG�	K�K�\�/LBH@\�z{{\�\�B\"\�;�\�_MBH@\�8�Λ7\� +�J��$ɿ�����\�۷/]�`�A $\�#�/��\�$�TlϞ=i{{�A $\��\�I�2	!۱cG�p\�B�@HĽ��NGLBH@ź��\�E�B\"\�;oe\�G&!$�b���z�d\��@H\�}G\�,$�\�$�T\�\�_N�-[f��%I�YH��������\�\�>h���6�ʮ�&!$�b�6mJ}�Q�@H\�?ͮ\�\\Z昕]?jjj�\�d�\\\�ƍ\�U�VB\"����$9��\�pv������k�i		��\�<]�n�A $\��kD�F\�\�\�hRB����+ݰa�A $\"�+�]׺\�kJB&d͚5\�O>i��b\��+$�$�S0!+W�L�y\��@HDxW\�j{$\�#\�MGH��=�\�#\��\�?o��\�埏�\�\�\�\�d�L\��\�\�ӗ^z\� ���\r�\�!�	�\���ߟnݺ\� �.q,�\�?�����,^�8}뭷!�]����0C!\���矧ǎK��\�\�\�t��톃��\�w\��\�bqͥ�$Ne\�и}�\��\�`\�C\�\�\��}S0\�\'��\�4a�U\�\�\�rEh��h\�\�\�pZe�s\�W8o\"I�ñ٦($�\�ٳg\�\�M\�o\Z�W�6(�D�݁\�B`\��^���C!$�\�\�O?}\�7���B�1̙3\�ǥR\���\�y\��e˖���\'=y�dz����9�~�\�\�|���\�c\�\�\�9\�\n�\�]�+$�T���\�j�\�!\�0(;����8p*�\"\�\�ŋ�\�#G\�\�7�Y\�\�\�2e!A�\��\�\�B\�\��D\�DD~)#\�ڽ{wE1\�޽{Ӷ���w\'Ą� F}}}߉�͛7B�A�3��\�/c|��Ǔ2\�O?�4�\����3a�CH���A�kehh\�P\r��2�\'\"DD\��0�\�\�˿�=6`\n	\"t�\�\�o\�6m\�d �\�X\�؛�a�\�D\\\�\�ĸe�\�(F\�!Q\�\�9�}aOč�L\�GÒ��z!A�\n\�;w\�Lׯ_�vvv�:�o>\�u\�\�W_}u\�	�%6��vƅn�\�W�X�_\��\�G��������}�s|8\\\�\na��\���\rB�>�F\�O�_�\n�%\�pfv\��q/$h�;\�8\�\�8\�.ܥp�!1\��Ft\�7X\��5\�J\��\n\�\��q/$�s\�/���秓y�]kkk\�\�\�k������˯׭[�N\�\�m\�v\�\�>\�u\���\��\�2\�d�dN\���P�Č\r�S�_�Ꮕ�\�_r\��}\�	\�8\"�\�$;1���y��o�G|�\�S:�pG3�r�B�:�3B8L\�Iv\�΄e�Č�#�\�k��\�T	�/��}\�	\�L\�X�\�1\'م=6`\"$ffHL!!$�c\�\�\�q�]x�	w$ܑԱpN\�t�d�T@H\�#a����N�æ��$�ph	\�\��\r!A\n{#�_����\�\�ݐӧO�������p����ʄ�a΄�\�³9@HL�\�Ɠ\��~�l\�2\'[\n	\�Qx\0\�L�$�\rBbz�gm��	��!$`\�\�S<gh{{�����ћ\�35w%�\'\�z����\�\��GL\�.\�O�\��kjj�-{M�N׷�\�̙�c�B�:2��7Bb\�m��\�\�ʌ{8`�\�	\�8$b�� $����\��I���\�\'\�.]�4��q.�^\��#\�B�\n���K��\�|D�\�~��	\�= $��\�cb��<n9#܍\�2m!A��\r�\�\�\�os9r��ن�x�]����?WD	\�s$@HLd�#�g\"�\�\�7:4vG���h�g�\�b#�\��M\��DX\�4�\�\�\�t&�d\�dK�\�\�߀��6G�W���B�����gm $��p\�D�$��\'`N\�\n\'V�æ�\��ߙ�����^�:�Γ\�<�!Q\�qڗ�\�\�R�\�?�<w\��\��\0��\�\�^	\ZXxѧ\�u�]�;B�u,�\�r*O�wC@H���Ν={6mmmM��$���\�\�!B�\�\�\�{\�Ǎ<\�.����@H����\�ڵ늘�Q\'\�m߾ݰ $�!&&�$��sEB�,s\��LL\�Iv\�\�Y\�@H�� a#d�\��\\\�\�6V\"$@H�p\�\�ʕ+�8s\"W�߇æ���!B�؅\�ó9\�]��\�\��#\�/�Cx�gx\0Wxv�c� $\0�	\0�	\0!B@H��\0 $\0	\0�	\0!B@H��\0 $\0	\0�	\0!B@H��\0B!��\0! $@H\0	\0B�\0B!��\0! $`�C\����^\�\0�lxxxTH\��n�\�\�C�y\�L�Ç�\�\�f/����\�z\�Ξ=\�+`�\�|�Ϳ\�\�f���\�ͺ馛����\�G{zzF�����jX\�w\".E\�Px��1C1�]�/��>u�\\.WMWX\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\����\�-Bl#\�\0\0\0\0IEND�B`�',1),('9',1,'/home/dell/stconline/server/target/classes/processes/TestPlan.TestPlan.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\�\0\0�\0\0\0\�dZ\0\0>gIDATx\�\�\�p�\�q\n_\�Z[�\�Y���\�,)˲,<\�-�\�j\\�{-κI�;=��qAPp�����r\�Uv�#*W����+ 1\n�	��wB^\����\�\�!��d2ݝ�~��\��J�y�\�\�\�\�ݧ\0\0�\�/��\�o\�\�ӭk�	��\�\�^Xn�\'�nx\�\�\�x\�o\'�����ʺ9}\��\�\n�n\0���\�\�k9$\��#�\�\ZĿcs\�\�ߡ!<O\�_�v+v\��ϗ>mѐ�<���q/��5\�c\���\�&��\�\�\��hVY\���\�⥷\�e�v\0\0��\�\�p\�\��\�^����\���&\��\�\�\�X)�+9mBC[�)0�>КS\��\�C.mq\�\�I�\0\�\"\r\�	/�i�@};\�\Z\�3?�\�\�\���A�z����m�π.{xfit����X����:\Z�]\�\�\�\�\�oL�\�z�����\����\0\�M�?zp\�\�\�C3WE\�\�\�ϯ�5p\�\�p���Y��\�g\�\�\�~�A�ˇ��*���v��\�g\�rY�N\��ߧ�u�{�s\��w\�	V�\0�/\�P\��6\�&|����s/9���s���6j�;���WG5�o?���R�N�_D\�\0\�\�\�\�O\�\�\n\'X\�N�����%G:!=w\�\��uK�<q̹\��r&\��;�\�r��8�)�7\�\��O�\�]��#��\�\�mt\0�\���\�\��\�\�\�|{h�K��|�M�nu��ϥ\'jt���~@*���5�\'���eAYM\�\�\�}{\��?���\�O[&\��\\\���\�߷h��[\�\�\�;�\�d/,?z�\�X\�:\0@\�\�{�\�b�k4lu�4�;�;\�r\�#-��{\�Q�VN���onl\Z\�\����)���\�0{M\�#/~\�\���\�y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\02Fڳx�\�g̘q|��\�чzȎD\"vAA��\�q\�\�\�S�Li�6mھ1c\�<H\�\0\0p\�7\�|�7o\�\�x�5j��ꫯڟ|�]UUe\�\�\�\�q\�\�\�F���\�^�v�=�|�\�{\�\���\�I�VY�՟.\0��I���\�\��=ږI\�޸qc,��UQQa˔n>ܖ)}\Z\0���\�?�\�Oѱc\�\�\�\�\�vwlٲ\�3f�}\�=�\�D\"\�]\0\0\�\�رcc�L�b?����ѣG\�t\�\�\���\�\�ìF\0 \���SO=e777\�\�6s\�L���\�\�\�\�G�\0\�&��[W�\�\���\�s\�م��{\�8\0\0ݤ�\�g\�\�ZU\�\�*�{\�7jY\�X�\0@\�\�rݪ\\�(\�݈-\n���7\0\0]�\�\�֯�e\�c�=\�XPP��\�\0�\"\�s�\�%SSwܗ_~i\�\�\�\�\�k\0\0�h\�ҥ\�\�\�zr#��D\"�\�4�s/\0\0�\�W�\��\�\r\�>�l]AAA)�\0\0)Ѓ�\�\�\���\�7KxWr/\0\0�=:�d\�\r�Jx7p/\0\0�=�g�\�`��:\�C�r/\0\0�\rO7\�\0\0�h\�СnN\�Q\�\0�=�\���}\�]SS\�\�g\�\0\0�h\�ԩ\rnmm�x�\�\Z�6\0 E�>�\���\�=eʔj�\�\r\0@�ƌs׽�\�\�\�\�t��\�a\r\0��xK��m^VV��\�ٷ9\0\0]1y�\�O?�tF\�{Ĉ\�U\0�.�D\"\�}�\�ъ������~z@�n�\�\r\0@7\���SF�m=z�G�����%6Jp��\�\0\0tӽ�\�[�\�\��\�\�kQ�7jL\�\�I�\0H\�xL&�3f\�\�\0�N�4\�k�^����\�\0\0�1�G�Q�_��_��\'Ҷ����\�\�\r\�*��\0�\n�p8�s\�ȑ\�\r6t{\�4��[W�3q\0\�\�t��\�\�\�\�S�6i���*}ݺu����U9�\0�):-\�\���N\�C��N�>�n\�ʕ\�\�\�\�-z<n\�\�\�Ճ�,Y�\�\��T�����\�\�f59\0\0.�0KK\�@�\�\�y&T�~�-U��<e\�i\0\0x;ԣ\�p�r:\0�»\�0�[\�\0\0�	\�\�\�C\�\0\0>aY\�	\�t\0\0�L޺\��t\0\0���&	\�\�\�\0\0�	\�$��\�	\0\0|²�w�\�\�	\0\0|\�0��%��\�	\0\0|���\�q�*:\0�O��9Z\��0�\0\0�\'øS»�N\0\0\��@\�z	\�f:\0�\��b=��\0\0�G4��\�\�t\0\0��w�\�ut\0\0�0M�n�F\'\0\0�\�\�}X\�>:\0�»Jw\�B\'\0\0�Oxo\�ݤ\�	\0\0|BL\"\���\0\0�?�w�\Z�N\0\0\��`�ޛ\�\0\0>a�\��\�{\�\0\0���\'Y�u�N\0\0\��a�\��8�\0\0�?\�}��w#�\0\0�\'LӼB\�;J\'\0\0�������\�b��\0\0��N\�\�p�r:\0�»Q?��\0\0�\'��\�V\�t\0\0�\�\�yKxO�\0\0�g�ޣ{Z�\0\0�\'�7Ix�N\'\0\0�Ox$ὔN\0\0\��e��\���\0\0��a/Kxo�\0\0�DAA�\�RUt\0\0�0Ms���a:\0�O�q��w=�\0\0�\'���\�\�t\0\0���\�zd1:\0��hxG\"��\�\0\0�	\��\�\�\0\0>a�\�I\�p�N\0\0\��\���\�\�-˺Q�|�\�t�t\0\0�	{�u��!����tT?�nU\�999�\�\0\0 �\�_ù��>U\�\�\�\0\0\"=���\�\�Ͽ�.\0\�\0?\�\�Խ�\�\0\0\�A�P\�l+��3q�\0�Gɔ��Ux7��\Z\0\0\�\�؉[��\�\0\0<β�����B?�#\0\0x��&�\�n\�	�n\0\0\�\�\�\�\0\0$�m�\�Ν;+\�\�\�\�e˖\�K�.��P\�\�\���U��R3yT\0z�wii�]SSc744Pݨ\�\�Z���$*A>�G\0�\�\�\�Mp�7�eo\��\0\�1���\�Mo\�jtY\0��AC\�\�\0�^\�\�W\�;׾jW�>VzZ/#�	o\0�\��ء}��\�S\�\r\�?rZ\�ez�Mx\0<ޕ\�\��\�[���&�\0^\�/W��\��\�\�l\�\0\��޴��\��\�\�l\�\0@x\�\0\0t\'�u\���\�[�#�	o\0�\�\�{�\�톷^G`\�\0\0����}\�MK���\�\\.\�\�l\�\0\��\�ڵn\�᭗ք7\0��\�}��\�g�2�\��:��\0x(�uj\�V�\�\�g\�z{Y#�\0^o����/���pR��/��ޖ)��\0�ޝM\�L\�7\0�c\�̴\�\�Nx\�\0��wW�;^�7\�\r\0\�pxS�7\0��&�\0 �	o\0\0\�M\�\0\0�\0��&�\0�7\�Mx\0o�\0x;��,Yb��\�?�\�?��X\�i�,�6�O\�\���\�i�\���u�o�u\�9\�\���o�f/[���\0 \����#�999�7\�|cWWW\�N\�e��\�\�\�\�\�֯_\�\�o��KKKc�/��r\�\0�t�w|r.++;u��n=e\�Y��\�Ç\�.9rd\�|G\�?\�y\�:�o�b\�;߉]~\�m�ٻv\�<�l�����z^\�\�\�\�\�\0\0\�[Wk\'�V}}}\�2\r\�ց�hѢ\�\�lܸ1�\����ʕ+c�\�\�S\�G\"�\�e�W��7o\�;}\�\r7Į;vl켮��\�\��z9�7\0��\�Bx\�\�k��&6\r벽I;�t��W_}u\�z��[\�欳Ί]�}��\�\�����ץ�\�\�	o\0\0\�-_\�nݺ3V����?m3�gϞ;�ˎ\�[O?��ñӿ�\�/\�\�#G���7\�\�\��\�]�z\�K�y6\�2˲F,\�\0\�xx\�R?w\�ϔ7X[�pa��c��%z[\�;f�\�\�?v>�\�y|���	\��}�U\��\�\�\�\��[���]\ro\rk\�0\�KX��\�>$K۩J�\0���w<�u\��D��\�\�Ν\�a@\'\�Z�\�b\�o�\�\�y\�0mԨQ�����6�V\�ү����3\�o����l�\r֍	a}Z���!�@\0�+\�X:\r�IX%�mUWWg\�\�vb\�\�\�\�\�#\0\�zx\�\�j:�^r\�%��oec�\�\�\���v\�-<�\0\0�o\�>��B?��>\��j�\Z���e�<x�%<\Z\0����&�\�_������L�{B7b�\0?\�\\v\\N����\�\0\�.~ULC91�5���D\"9_�@n[-��ܛd�S�R&a�[TTt6�X\0\0\��\�yK\0\�t\�;���ӯ����\��v�\�	�m�lp�V�\�0�q\�p��<���zx\'-�\�u�\�\�}%?7@��q	�O�N�j�ӟK�?#��\�\r\0�7\�{XKb\�NʠA��+�}�\�{\�U���j�0\�%A���\�gU;\0ޔ\��m.��+	�%��\�v]E/a~@._.�\�\r\�x\�\0\�My��$�H\�\�`0��w�\�gU�		�r	�\��\�l<\0��&�=|T�@ p���\�R�����j�\�-����)�9�g\0ބ��\�~�\�]��-�<\�l\�~@j�P%77�R�)\0@x\�&\�}�\�4gU�ag7�uz���yY\��3\0o\�\�\�F�q��\�d\nG���U\�\�R{dj��,��j\0��8	�[d\n�%��Y��U\�%\�W\�u���]\0\�C�-[F\�\�\��/�S%�WK���j�\�_\�rFaa\�\�x�@�����\�\�\��i��{�\��n\��Ǖ�j�)�.	\�%��\�\������p�r�0];����|��\�KJJ���\��|0�<y\���]\\\\\�$5�G֙$�o� Q�B�ޙο�Z%S�$Y��.@�$l�ɴx\\W�z��,Y;\Z���F��	\�\�\r6\�2�O\'K�J�넹��&	���q]\0�\��\��yӉ\�IW�\�}�\�~K¼\�YͮU)\�\�\�CY\�\0>�[4�sv�оQ�p�\�\�\�\�2\� \�#�):�\�%\0��yK^^\�Ut\"{\�7\���U\�\�\�U\��9�~����\�%\0�]�ʁ4�HW�\�\���%{��\�\�-\�uKw\�\�]�|�S\0\�^x7\�\�A\�:�\�)\�\�K�o�\�ݺF�\�\�\�w\�\�\0d.�Oʋ\�o\�R�V�\�\��\���7��R_\�d�R~~��t	\0z.�O\�~�\��C�\�.�mI����gw�hם\�쓋ߕˇ\�S\�\0����\�cQ\�	��\��#�mp��u��V�GX\�#�\�%\0\����\�X:�<\��\�\���\�zl���v\�\��\�t	\0���k�kBt�VTTtv(2%�ߐ\�-\�\�\���E�F�U\�\0\�y���z�N�$���\0V�\��\�R�\�\�]�\�U\�r�c�H\�J���.(�Z_,\��(_�\�\�t��%r�\� ˭�|E\��\�t	@6��W�-:?\�U\��͗\�\�\�޻tU��U{��\�0�{\�W?�^O7��\�\�|��:	\�g\�q���>��\�\��Q�O�#!v��7��F\�`�N��<x�%\�\�\�q],U\�l\�\� a�M�s��\�\�r��t\n��\�{�\�D�N��\�U\�ع\��c\"\�%��T���@��\"�\�Et\n�o辩��\�	d	�RO\�c����v�c�fV�O�B��\�\0/O\�\�e�XI\'�\���\�\�c�<\'j��\�e�Cj�a������&\��;�t8M_=`�<7\�I�k�7:�w\�/�X~�>m\�\nyaZ�[\�\�	�c\�\�H=%ϗu��]W�s\\s\0nM\�\���N\0)?wlv\�\n��a��_��@\�᭟���\0\�x�!��N\0��7�5\�\n����\0\�@\�\�ݢ_9�\02N�{�nAK\'���;M���?�\02\�0��\�\���\�\� �+:�����\�	 \�\�N�����N\0\�8˲\�\�\�C\�	 \��>!�\02\�4̀�\0\�\�	 \�\�\�Qy\�\�M\'\0d\\ ��L\�\rtH9�\��\�\����\�Q^��\���s\�a\���\�\�\��U\��\Zy\�T\�W-\���\�=D鞢\��rx\�\��\�	\0���X�@\�\�[\�: \�����7Х�\�aY\�Kt�[/Bzh\�s\��\��f�\�<:���<x�%tH\�y��4\�7\�\0�^��\�p�r:$ϲ�u�a�C\'\0��\"ġ\r�\�\��~,��N\0p\�E�Iw\�B\'���7%R+\�\0�&\�\�M*�\0R\n\�\�:}\�	\0n�\�K\�\�	 �7���N\0p+���1�N\0)��\�$�\�\�\0�\���\�}tH\�y3O�\�M\'\0��\"tP&\��tH\�y3[j;�\0\�֋\�~�\":���yA�oN\'\0��\"\�ё����\�y��N\0p+�9:�zx?*\�]M\'\0�²�m�a�L\'�\�\�sf�<w\�	\0��\�B&\�tH\�M\�X�Ct�[/B�\���\0�\'ox\�7�G\�\0�&\�O$�ߧ@Joz\�s�N\0pk�X%��N\0\����ka:���^\"��N\0ɓ��W�i�\0\\��.=on\�\�\�\�	\0nMoʋ\�:$/�\�M�\0\�\ny�+�%�\0��D��7�Q:��\�{���WtH^nn\��!��ò�g\�E\�k:$/\\(\��N\0p��\0=.U\�y\�\'//\�Z:7ٶ\�o\�Ν�eee��e\�\�K�z�4���w%Vqq��jժ�\�LU��\���i\�\�V�������S%tn\�\�.--�kjj솆�U[[k���D%ȧ�\��;i�v\�Z\�aÆ]F�\�&��	\���L\�|/���-\�\�Խ�.�m���\�Mo\�jtY��|a{\�m�\�\0:�i\���7�V\�w[�yKp��;�Sx?\\e\�\\��]Q��X\�i���&��^)\�lޡPȤ3�Kx;�\�޴x��\��GN+�L�#�	o�Wr�<��w%��»�\�\�3�;^{+؄7\�;Y�56\�z���O\��\�?�\�z�Mx�y�>\�\�)����W\�iiQ�\�\�؄7\�k\�\�\�O�\�[�I�5����&�x߄s\�9G�Ժ�y�\0�_\�[�.o/��:��z��{2����\�3\�\ro���&��l\�\�.<\��m�7-�z\�*s�L�#�	o [�����i�\Z\�Z�\�\�=#��2��-�\�X�o��ɓ���g��\�\\.\�\�l\�ȶ\�N�&px-�uj\�V�\�\�g\�z{Y#��l\�ğka�\'\�[&\�\�\�\�/>�\�np\�Ko��e\n\'��l\�\�?\�\�»�i�)��zsp��z\�Yv��\����w2\�vGS8\�Mx~\�}��7��x{�c�k\�\�\�\��\�Mx~\�>\�$m\'T[�\��\�\�\�����ӯ�\�M\�@6w{��\��]\�*ttIAAA�K��&�$ܝ�\�Iw\�\�V\�H5�㇠m4M���&q�\�\��!�\�n\�|��\�;^\�uR\�o\� ��\�V��\�q�BG�\�;��KM&�	o �\\\�nE�?wvw�sy*>\�\�E9^\�V\�Ҫ��jr�QW�:\�Y�t�^K\'6Y\�\�v\�y\�?�%�=*\�#R�\�Cr�[9}PKN�e�\\^#\�����e�\�>�*���\�#�[n�K�_\�r�,�Km��\�\"\�/eY!\�M��B��\�\��zY~&˵�3�\�\�2�VK�\�e+eY\"\�/�e�,�\�r�\��a�\'\�E�|Gn�PN�]��\�r�\�e�@j�\\��\�+r��e��\\��\�_\��\ZZ.{V�{&>-�=)��\\��N�r\�T\rHYN�\���\�\�\���r�hY����\�\�wK�NN�eX*\n�LY\�\�\�\�J�FN\�!\�\�\�\�~�����\�\�r��\n&\�\���\�uyyy\�\�\�^-˫\"�ȕ�=N���\��(\�Mx\�6y\'�\n;ݓ��3�}�~�)\�\�\�����_�����{��8�PN_./\�WH\r\�uY^#!0\�y��A\��D�\�F\r\'n�\�~�a!/ꃥ\�\�\�0���\�	�\�\�\���#5�4�\�1\ZNNH���脗�X�,\�pӐ�\�?%5]\�O\�9�\�\rE\'g\��\�\Z�\Z�rz�,\�k�\�\���,\�t\�VC�mY�\��r���Yℵ��\n\'\�K�>��X\�	�5�\\\�	\�7Z�7	�fa��\�a�\�n�,w8o.�M\�.\�M\�\�r�Rn�\�yCR\�T��E߼\�\���\�[�C�fG\��\�\�#r�Q\�\�\�q�N8o�\�o�\�o��MUC�M��\�\�ވ5\�u�7g��\�I�\�;U.\�\r�\��\�\�\�g\��}��\�\�Zm�o t\r�_W�ǟ7�7��\n�tnm\�[\�\��\�5%�o�Jx���\�@]�z�=p\�@���γ\�?�|�\�k�=\�wtv=\�\r S\�\�V\�\���w�[��{\�\��ۻ]W\'\��B�����]�q\�F���\�3fLJ\�\�\02er�q:��6��\�]�\�-tv�t��9\��|˖-m�\\g׷��흏\�\�W_}\�\�j}}|���\�Kc�v���\�\�\0N\�t\�ۜ\�F�Jwx\�v\�m�\�5(�\�_\�S�N�M\�\�^�םu\�Y���\�w\�y\'vzРAg\\��k׮S\�\�̙s\����˿\�\0Θ�|V�\�*�x;�\�\r߆wuu�=q\�D��k�9u��n�)\�\���~\�Yx\�\�\�\�*>]�u}[\���A�^\�Nx�����5�\r_�wb�[�\�Ԕ�\���\�\�\�ܕ�N�<\�\r��\�Q\�\����\�ok���\�N�_�>v����^Wi\�e۷o�\�Ν\�\�j�E���\�<��=�7\�\�	<� &�\�+\��7��M,�uz\�\�ߺJ���<\�\���\�\�}\�{m~\r��\r\�4�\�\�`��Н	<�U\�\�>l���7Ex\�<�\�?#\'�Ax\�\0|\�m}? �	o\0�\�	�͞\�@x\�\0<.>i�������7\�\r�\��\�o�\�\�Mx�\ro=7�\0\�Mx�Wx_H\'@x\�\0�\�\�	ބ7\0��wԲ��t�7\�\r�\'Lӌ6\�2:�\���D\"W\�	ބ7\0�(((h	�BW\�	ބ7\0��\�ut�7\�\r�?\�\�,u�\0\�Mx�Ox7Y�u#��,[���%�$ލ�a\�B\'\����-555�n�j\�޽{$�xd��L\�\r�@\�\�t^�|��\�KJJ���\�\'|\�\�\�\�\�MR\�yd�o�>)��`:����&\�\�q]\�\�Ś3g��{&�\�ߗP\r7\�{û>\�\�	 \�\�\�\�h|\0\�\�4\�B��I\'�\�Y�5V�[KN��#\0ܚ\"�K�\��ܛ\�xxKU\�\0n��1�\�\�	�\�\���ܱ2\�N: \�,\�:*5�N\0>O�K��o�5t���a�(F\�	�\��^\�Fp\�J�?\��L�(}k\�8:�?u;��\�)�o\0��Jx��@�ϑ\��[+:lذ\�\���1M�6N�@�S�~#���\0/�[\029U\�*�@ҁ~����B?\��\�\�\�]Kg\0d2��\�\�\�1:$\�0�{\�9s�N\0p3��I=I\'��\'\�R�\�\07_�*e�x�N\0IO\�\�ys�N\0ps�\�c�\��tH�9S�ۊ\�	\0nN޻$��B\'��\��I���N\0p3�wHxϢ@\�ϙg%���\0ܜ\"�ʋ\�+tH���\�5Vt��\���\�\\:$\�0��%��\�	\0nN\�\���\�yR�\�\07_�6H��I\'��\��\�:�5�e}n\�[tH�\r\�\�R�\�	\0n��:	\�w\���s\�}��?�\0\�|!�T\��=:$=y\�aB\�\07_�>�ZL\'��\��\�{9�\0\�fx�\�$A\'���3e�\�\��Q�\�\n:$G�\�2}�K\'\0�\�|~���)��;�\0\�\�\�b�ܛN\0IO\�\�\����\���ޭRs\�\07\��]��N\0I?g8\0w\�\�\�t/ktHz�\�#\��<�\0\�\Z�\����\���\0\�|!z]\�{�\0�~\�TKx?J\'\0�\�9�\�tH�9S+5�N\0p�eY�\�ֳtH:�J=L\'\0�\�/\�\�:$އ�\�\0\\g����N\0I��1y\��\0\\�_yѯ�\�	 \��>!�\0\\c\�3�eU\�	 \����t����S�b��N\0I�w���\�t��/D�KU\�	 \�\�L�eY7\�	\0n�I\�@\�ϙf�\�\07_�&\�N\'\���s�%//\�Z:�\��	R\���s&j�\�t�k\�gYַtH>�sss/�\0\\#\�h\�c�\0�o{РAߥ\0ܜ�\�\���\0���\�\07\'\�ẻG:tNC[ÛN\0p{�K�@\�\"�\�E�7\0\�YB^�\�\�\�9\�PM7X�\0ܞ��u_\�tHj�\�4M\���\�,\�}�N\0�ӝ�X�\�B\'\0�*�Z^�\Z\�\�9\�-�\��N\0pU~~��ލzZ7Ƒ\�7�B�\�\�L�aܢ&�\02J\�����4\�?\�j��\�N��3\�@���t@�\���B;V:}\�)\�Ll\�	�999�t�n/�MӬ�K@�o~\�9r�N\0�\��\�\�\r��=p{�nh#�+\�\�axs \0��Mkc\�Eg��\��\�a��t��/DG$��\�\��Z:�52i�M��\�\��\�\�\�c�|��\0<1}\�	�s�`�i\�4�\�	\0�2c\"\�\r$�f��\�t\�\�l\�\�s\�\�ʲ�2{ٲe�ҥK=Y�ey�o\�*..�W�Z��ɣ\nn��{�<_v\�	�\�\�.--�kjj솆�U[[k���D%ȧ�Ȃ�����t\�\�t\�&�\�\�2��_i�9y�.ὉN\0���*\'t\�[�\Z�G\\���.UN\'�^L���%�ѫ\�{�\�\Z:\���\�U�ε�\�ſ���\�\�k\��\�\�R\�	 \�\��ء}��\�S\�\r\�?rZ\�ez�Mx\�;L\�\\nY\�J:dyxWV�{Fp\�ko\�\"����&\�$��\�	 \�\��\�l7��:����&\�Od�~�N\0Yޛ��\�z�Mx\�S\�^\�{!�\0o��\�{cAA�t\���֭\�\�o���&�\�ܛ�\�\�	 \�\�{�\�톷^G`\��Txo��M\'�,\��6ڛ�L=s��\\�\�؄7�ò�]�i��N\0Y\�Z�\�\�=#��2��\�»\�0�g\��\�\�}��\�g�2�\��:���w|#��\0�8�uj\�V�\�\�g\�z{Y#�\��\�/UD\'�lo����/���pR��/��ޖ)���\'\���\�:dYxw6m3�\��.˲I��@��w2\�vGS8\�Mx\�\��>j\�=tȲ�\�jpǋ�&�គ��\�\�C\��e\�M\��/\�4\�B��I\'\0\"�\�\���Lރ\�@xS�7�ލ�e\�F\'\0\"�\��n��N\0�7Ex\�?\�\�,u�\0o���O\�\�ݒ��w�\0o���&\�\�\�@xS�7�\��\���/�\0\�}ZɏuX���\�/~q\�\�\��\�\�\�k����._�`\�\rt#�G�q�\0\�N����///�]�~��3B>^2)\�\�s�}\�Yg\�N\�@j���ζ,k!�7@xw;���\�Ç�]6r\�\�\��\�?S[[\�;\�\�T�<x�\�I�ꫯ��l\�\�\�\�	o�6�i�J���,�q\�n���E�ba�q\�\�\�RϷ��_|�\�\�r-=�\�?���ߵp\�B��wމ�4hP\�\�gju<\�L	\�ʤ�H�E\�\r��/]\�n����\�k\�Ėm�\�M7\�d\�;߱O�8+=����]����\�\�\�~\�׳\�����RǤ�e�,\0\���={v\�.[_�gϞv7|۵k\�\r�1m����~�[j>\�6@x�HxwtݓO>;=dȐS\�\�.{ꩧ\�X-_\�\�\�j�\�\�\�\�\�<\�\r/0\�N=䧄�	�\���v%����\�\�\��\���\�\�z\���\�\�\�LW�w�AZ{\�\�𫜜�~\�\�:m\�ro\���� \�\�\�\�72I&\�v�,kB�Џ\�\0_��y\���^OxÏtG+\�%�%�L\�/\�\0�\nov҂l#�����\n�\�\0��G�%�?\�i\�4Ϳ\�\0�7\�\r3c��I	\�}����\0 �	oxT$�H�\��\��st\0\�Mx\�\�$�\�j��://\�*:��&�\�Q�@\�b��\�\�g\��`�i:��&�\�aڣ$��vE\"�+\�\0��G\�1�%�˥���#\0o\�&a=F�m��w�\�\�\�\�\0��GIX�7M�g\�.�#\0o\�ޞ��j�\�*�C:��&�\�Q����JXo\�\���\�\0���iX;\��\�!C����\0\�˖-#p	ot��wV�kp?LG\0��\�\�Җ��\ZB7M�w\�\�=\�\r<��jڞ��\�i��\Z\�\�/_�xIIIt����Ɠ\'Oz>��������\�\���+_�\�/\�+`c\������&\�\�q]\�\�\�Z�d�-/����F��	\�\� a�����r\��\n�vhx\��\�ܢ�3\�ݚ:\��(:\0�0M3:lذ\�\�\\z�=�\��\�E\�\0$7y\��\�	d��S\�\���n:\0��w�a7\�	d�L\�\�J�\�\��	\�\0@\�\�����`:��&a}�<\��\�cN\��.:\0]\��BZH\'\�Ï���\�\�A�}��\0@7Hp�\��:���\�SH`WI\�K\�\0�g\":(\�=�N \�LӜ\�lI�rĈ\�\0H_xWˋ\�4:�t	\�\�c�F�N*@G\0 \�d*��\��:�4���[�\�rYNNN?:\0=�b��LG/\�	t�<�~\"�}@O\�\�\�\��t\0z6�7Kͣ袾\��i{q 8��\0@χw�\�\�\�R%�}�n�(uL\�:\0�\�2�\�R��\�1�nIn\�{L\�\0���.�ZA\'�	\�[L\�<$S�Q	\�_\�\0p\'�?\�\�N�#EEEgKp�\�\�%\�m=OW\0��I\�-��>�h�<>n��>\"u8??�V:\0\�O\��t�s:���m	\�w����M.\�KW\0�t��¼�N Q0�]�\"�\�Ʒ2\0<F���{Y�P�\�n\�|o{\�6\0xs\�zT�oN\' ��\�\�Ҥ���\0�w\'\��\r:��t\�i.\�i[\�5:\0\'/֣��\�t\";\��|�R��P\�\�t\0�ޅ2u��\�E���;\�q��=��\0���1X^�O҉�z\�f\�}^�\�:H]GG\0�/\�7\�x#�\�����r_�\�g\�\0�)y�/\�t�w��8,U/�M^^޵t\0|,_./\�Q:\�;\r\Z4\�Α\�ZL\�|��\0@/�D.�v�N�\�i�w�=�Te(���\0@\�ї�\�o\�\�8\��t:\0�sB���N��a�\��\� �G�{\0�^J^\�Æ\r��N�\�\���/��q��v�eYO\�\0\����~uh ��훯\�؍�\�)u�\�\�&�\�?\�p��r\�m\�i[B{\Z�\�\n�5:\�2i?�o����\0dgx�\�}�\�	\�\�\�ͽT�\�\n\'�\'\�\0\�\�)\�n�L\'<�&k�w�Ԗ!C����\0@v�\�A=�7��&\rj\rlgڞ@G\0\0\Z\�\�l�\�\��f��AZ��2�#\0�˲*e�~�Nx�n���\�\�\�GG\0\0����d�{�NxC0|ԙ�\��\�`t\0\�Vxo��G\'ܥ;X�,k��Õ\�t\0\�Qx�K��N�z<�Ӷ\�g��S:\0\�,8�x\�\�	W�\�z���F\�\0@�\�]\"��Nd�n$(�\�\"�)Gu\0�\Z\�\��M\'2#\n]-�^\�-�\�\�\�\0�+\�[2�}N\'2�F\�=��\�ǃ\r�.\0t5P\�\�\�t�\�\�\�\�]+=����\n\�\0@���9K&\�t�\����3m�\n\�\0@�9NU҉����^{�T](2\�\0 m�=zUӉ��!zY�$��{��#.�#\0�t\�x=��\�>\�\�\rR�z�tyS�KG\0\0=B&\�QzLo:\�\�\���Ӷ,�\�\�\���#\0��\�B\�4OЉ�),,�����:n\�`:\0\�q\Z8�\�:����\�uݒ\\\�\0�Υ%\0�LM\�7\�q�\�Dj=�:$\�}4\�NG\0\0%\�3P�G:�ܴ-��7\�a\��MK\0\0�/�0�҉�\�\�\�\�*}:,uD�6:\0p�\�Jɦm\�\�Z�󶳗4=\�y_�\0p[_»m�@\�\����~���s\�\0�ghxsL\�\�B�\\\�0\�\�i;��i\0\�92]F�\rv�8�չ\��\�m��o�#\0\0�N\�:a\�\�\�^\�t\�h\�^\�\��\0\0x=��d\�)[���r\�˜�\��\0\0?��\�lܵ��K���Ӷ\�+<\0\0~\n\����l�?\�1�E�s[��ͣ\0\0\�+zT1��\�Ɇ����ث�s~	\�Y\��\0\0�N\���\�Y�&�P���RUپ�\0��\�]-S\�\���4h\�w\�������\�\�\0�\�0�V\�\��L/��ݥ\�ɛ���P\�j\�m\0@o����p{�7��t�qܟ\�\���	\0 �\�{so\�1��H��?\�7%��\0�1�˝#f�Z �X��I5K=\�=\0\�\�\�]&��\���ɴ\�(�K�\�+�W\0�=�K�V��o�\�ߗ�\�5\��`�Q\�M\0@���:}�\�\�6c��ݍR;8*\Z\0 �H�eY\�\�~�{\�o\�/��ə��r\0�q�[��\�\�x=\n�\�V�r\�\0��\�\�[�\�zZW?\�\����!C��@\��K�����\�\0\0Y#\n�X�\�\�\�U�0*K���\�5����\"77�R\�E\0@6N\�;;m[\�=\'\'��\���`��,\�\0d��\�QxK��\�7\�t�4Ynԯ�q�\0��Ms};\�ݢ�w\��\\��\�|l�\0\0]%\�\"�ux�q\�o�,\�	���kk���{	\0�3�\�7\����\�L�2\�_)��n�\�0\�\�\0��Q�x]Bx\�q\�\r\�t] ˵z`\�\0\0:\�\�\�\�-S�w���)�R�ݓ�7\�\0\0 �\0?�\�\�7\��y{٠A��\�=\0\0@�d➚��\�\�\�-\���\��$�Oʿ9�\�\0\�u�4���\�?g:[�.�\�\0\0t\�x��\�zg�\�\0���N&\�jY\�[�v\0��\���\�t�\�ݙ�W�1\�\�\r\0@z���˓\�\�~�FJ���O�\0\�\�n}�\�T�eY�\�\�i.�\��M\0\0Ȇ\��Ki���Od\�> u<��6\0�\�\�N�N&�\��\�mΥ\�\0\0�܉?\�\�\�\��q���R\�dھ�\0\�~p����\�\�9�I�L\�\��M�\0\�\�\�+���\�H\�\�\�>�я~4WB����	�_\�^\0\0z>����\�\�Զv\�m\�\�.(�����\�o�`\�\0�烻�3I\�	\�V�\'w�fů\�\0\�\�{b\0�\�n;`\�\n\�\�\0\�\����\�\r\0\0��\�`m/�\�N2���\0��\r\��!�\�n\��i=\0\0=\�x*�\�*t\0\0�\�2\'t+R���ۘ��\�S��qW\0\0��\�\�*\�tO\�Op\0\0\��\0\�\�g\��}��\�\0��tnmޥÆ\0�������\��=\�p�2\0 \�&�1w{k	�tZ\0@\�L\�i۷9�\r\0@f\'�\�\0�\�\'���%ގ\�s\0�\�	�;�Q\�\0\0x`O%�	n\0\0\\��S	b�\0\0�L\�ɬB�a\�4\0\0|3�\�?#\'�\0�A����p\0\0\�\0��\�\�9\r\0\0��b���G\0����\�Nx\�7\0\0> �}EAA�Nܗ\�\r\0\0�1y_/\�\�L\'\0\0�����[-\�j�\0\0�D0̕ɻ�N\0\0\�2u\�%\�}�N\0\0\�\�cL\�<D\'\0\0�OxO���\0\0�\'���\�G\'\0\0�Oxϐ\�E\'\0\0�Oxϑ\�J\'\0\0�	\�4ߔ\�H\'\0\0�	\�0ޓ\�{\r�\0\0�?��r	\�Ut\0\0��\�.�ZL\'\0\0�	˲>�ZH\'\0\0�\�\�Y\�{>�\0\0�?\���i��\�\0\0�	\�J\�0��\0\0�\'��e�F\'\0\0�Ox�z�N\0\0\��e�\ZI\'\0\0�\�\�]\'\�m\�	\0\0�\�\r�`�v:\0�O��\�TXX�3:\0�&\�P(t5�\0\0�?\�\�\�ͽ�N\0\0\���srr�\�	\0\0|@C[ÛN\0\0\���\\W�\�	\0\0|B7T\�\r\�\�\0\0>�_ӯ�\�	\0\0|Bw΢;i�\0\0��\�Uw�J\'\0\0�Ox�\��\�	\0\0|B���\0\0��i�\�$��\�\0\0>a\�3�eU\�	\0\0�3yϒ�\�A\'\0\0�		\��\�t\0\0���B	\��t\0\0�(((X,�1�\0\0�?\�Jj�\0\0�?\�Fj�\0\0�\'L\�\�(\���\0\0�?��V˲^�\0\0�\'�wK�@\'\0\0�Ox#��t\0\0�0M�6N�\0\0�g�>,>�N\0\0\���>n\�P:\0�»^\��N:\0�»Q\��:\0�»Y\�::\0�\�;\Z�/�\0\0�\'�\�H$r�\0\0��jx\�V\0\0\��@\�b\'�\0���y�~\�M\'\0\0�\�\�}�nmN\'\0\0�����[-\�j�\0\0�D0\�\�=�\�	\0\0|B�\�t\�\�t\0\0��\�c�\�!:\0�\�{�T-�\0\0�?\���\�>:\0�\�{�\�.:\0�\�{�\�V:\0�O����\�F:\0�O��L\�k\�\0\0����Kx��\0\0��w�\�b:\0�OX���\�B:\0�&\�\�\��\�\0\0�	\�LӜE\'\0\0�OxW\Z���\0\0�?\�]-��4:\0�\���\�\�t\0\0��,\�\�H:\0�&\�:	o�N\0\0\���n��\�	\0\0|\�4ͦ\�\�\�	\0\0�3y��B��\�\0\0�	\�hnn\�t\0\0������ӏN\0\0\�\Z\�\Z\�t\0\0�\�\�\�ڜN\0\0\����n�F\'\0\0�	���~U�N\0\0\��s\�I�\0\0�\'t���{T:\0�\�{���N\0\0\�z(P=$(�\0\0�\'LӜ&\�]M\'\0\0�	\�0��,��N\0\0\��\�{���:\0�OHpϗ\0��\0\0�\'�Jx��\0\0�DAA�b��\�\0\0�	\�UR\�\�\0\0�	\�5R�\�\0\0>a�\�F	\�7\�\0\04lذ\�,˺Q{@\�\�U.{�\�\0\0\�\�)�y	k���J5ii�\�-\0\0<B�\�A�k��5\0\0�D�\�\�:\no�n\0\0<&\'\'���ts[�m�\�:\0�IP���w\�l\0\0�C4�\�\�:\0���\�\�	�\��D.�+\0\0xX~~��	�u/�#\0\0�c��v�0��n\0\0\�1\�V擥J�j\����n�~P�,\�d5:\0\0.\�\�˻V7F�@n\�d\�,��\�\�b�f\��\0 ����\�\�v*�\�N�1�\0Ѓtc4��\�[��Q�\�Y�fٟ|�o\�>���\�V�����?�\�3��\�^�ǎ\�\�\\\�ø�\�\0�f�\�C�PKb�>�\�#�`nnn��U^^nO�4���L�\�\0\0�1�W�K�ۋ-J)�[��\�\�H$\�z\n\'�\0\�.]U.�M\\E�m\�6;v\�\�m�=��	�U\�\0\0t�n�����~��N��\\?g#6\0\0�H�*O\\U�����	�\�*�5t\0�\���?\�\�ϸ{�~������\�^\0\0 ��ĭ\�\�6a\�\�\�\�\0\0$I?\�N\�s�~,6n\�xڞؤ�so\0\0��\�V\�Fj\��JX�w\��B\�\�\0\0 	\�AFb:{�l;�\�ϟ\�\�S�7\0\0H.�k\���<\�$]E��\���\0\0I�\�<�ywUUUF\�[���x8Q\�\r\0\0���Oh� #���^\�Ͻ\0@�\�\�\�\0\0&o\0\0z7>�\0��7[�\0\��\�{\�\0\0��L�O����x�=�\0�*ݷ�~\�̾\�\0�=�v\�Q\�21}O�4���\0\�Uz<o	\�(\��\0�_\���\r\�B���m۶	\�ݻw\�C�M\�5t\0�.�D\"��Y���~;\�\�\����W�\�\�K�\0\�\"\�0\�L\\}���	\\\'\�\�\�\�G�=�\0@�||b�\�*t��;�\�gܭV�\�\�=�n\0\�C\�\n���<寃M�2\�\�\�\�Kp\0\�3~g\�g\���\�uOlk׮�\�=~0]\�g\�\Z�\�\��$~\�ͪr\0\0z�nL��z7k\r�\0�!�=p��\�\'\�-�\�=�\�X��\�\�t\0\0\�T�}�\�4^�x8фݜ҃�\�\�\�\�)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\�����z(D�ٯ\0\0\0\0IEND�B`�',1);
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
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','2501',2),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-07-05 02:06:08.594',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('Contract:1:12',1,'http://www.activiti.org/test','合同','Contract',1,'1','/home/dell/stconline/server/target/classes/processes/Contract.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Contract.Contract.png',NULL,0,1,1,'',NULL),('Entrust:1:10',1,'http://www.activiti.org/test','委托','Entrust',1,'1','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('TestPlan:1:13',1,'http://www.activiti.org/test',NULL,'TestPlan',1,'1','/home/dell/stconline/server/target/classes/processes/TestPlan.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/TestPlan.TestPlan.png',NULL,0,1,1,'',NULL),('TestReport:1:11',1,'http://www.activiti.org/test',NULL,'TestReport',1,'1','/home/dell/stconline/server/target/classes/processes/TestReport.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/TestReport.TestReport.png',NULL,0,1,1,'',NULL);
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
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_contract`
--

DROP TABLE IF EXISTS `tbl_sys_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `assignee` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneeaddr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assgineeauthrepre` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneebank` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneebankname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneecompanyname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneecontact` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneefax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneepostcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneesigndate` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneetel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assigneeusername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientaddr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientauthpepre` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientbank` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientcompanyname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientcontact` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientfax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientpostcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientsigndate` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clienttel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `clientusername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contractbody` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `finishtime` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `quality` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `signdate` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `signplace` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_contract`
--

LOCK TABLES `tbl_sys_contract` WRITE;
/*!40000 ALTER TABLE `tbl_sys_contract` DISABLE KEYS */;
INSERT INTO `tbl_sys_contract` VALUES (1,'p20190606171309','',0,'A',NULL,NULL,NULL,NULL,'A',NULL,NULL,NULL,NULL,NULL,NULL,'A',NULL,'A',NULL,'A','A',NULL,NULL,'A',NULL,NULL,NULL,'A','85733','A','A','A','u20190605134344','',NULL),(2,'p20190606171310','',0,'B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','B','2357','B','B','B','u20190605134344','',NULL),(3,'p20190606171311','',0,'C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','C','5225','C','C','C','u20190605134344','',NULL),(4,'p20190606171312','',0,'D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','D','36432','D','D','D','u20190605134754','',NULL),(5,'p20190606171313','',0,'E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','E','12343','E','E','E','u20190605134759','',NULL),(6,'p20190606171314','',0,'F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','F','1123','F','F','F','u20190605134754','',NULL),(7,'p20190701205847','',0,'G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','G','1141','G','G','G','u20190605134344','G',NULL);
/*!40000 ALTER TABLE `tbl_sys_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_entrust`
--

DROP TABLE IF EXISTS `tbl_sys_entrust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_entrust` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `process_state` int(11) DEFAULT NULL,
  `accept_opinions` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `anti_virus` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `check_sample` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_ex_storage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_in_storage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_other` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_system` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code_line` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `company_ch` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `company_en` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `developer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `encryption_lev` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `entrust_entity` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `expected_deadline` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fp_num` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `func_description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `func_num` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info_email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `infofax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `info_postcode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `infotel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `infourl` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `opinions` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_choice` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_file` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_data_base` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_ex_storage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_hard_frame` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_hard_other` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_in_storage` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_language` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_soft_frame` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_soft_midw` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_soft_version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_support` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `server_system` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_basis` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_specification` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unit_property` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `web_environment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (4,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无','2019.07.25','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171312','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','无','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','科研院校','认真搬砖的一群小朋友','1.0.2','无','u20190605134754',NULL,NULL),(5,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无','2019.07.25','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171313','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','无','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','科研院校','认真搬砖的一群小朋友','1.0.2','无','u20190605134759',NULL,NULL),(6,'',0,'测试所需材料不全，未达到受理条件。','已完成','源代码','90','2','无','Linux','100000','中文的ABC','ABC','NJUse','机密','无','2019.07.25','18','有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来','17','南京大学仙林校区','keysoftlab@nju.edu.cn','emmmm','miao','1234562146','014030','14956563232','www.miaomiaomiao.io','用户手册','p20190606171314','由本实验室销毁','.TXT,B/TXT','U盘','mySQL','5000','PC服务器','无','100','Java','C/S','无','19.0','无','Linux','little mushroom','操作系统','GB/T 16260.1-2006','功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求','软件确认测试','科研院校','认真搬砖的一群小朋友','1.0.2','无','u20190605134833',NULL,NULL),(37,'',0,NULL,'basic-form.others.viruses.complete','\"\"','','','','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','','','','','basic-form.others.SecLev.public',NULL,' ','','','','','','','','','','','',NULL,'p20190704142958','form.sample.radio.destruction','','basic-form.mediumg.label','','','\"\"','','','','\"\"','','','','','','basic-form.radio.system1','\"basic-form.radio.basis1\"','\"basic-form.radio.target1\"','\"basic-form.radio.confirm\"','basic-form.radio.domestic','','','','u20190605134344','',NULL),(50,'',0,NULL,'basic-form.others.viruses.complete','\"\"','','','','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','','','','','basic-form.others.SecLev.public',NULL,' ','','','','','','','','','','','',NULL,'p20190704191843','form.sample.radio.destruction','','basic-form.mediumg.label','','','\"\"','','','','\"\"','','','','','','basic-form.radio.system1','\"basic-form.radio.basis1\"','\"basic-form.radio.target1\"','\"basic-form.radio.confirm\"','basic-form.radio.domestic','','','','u20190605134344','',NULL),(39,'',0,NULL,'basic-form.others.viruses.complete','[\"basic-form.others.opword.book1\",\"basic-form.others.reqword.plan\"]','','','','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\",\"basic-form.radio.opsystem2\"]','','','','','basic-form.others.SecLev.public',NULL,' ','','','','','','','','','','','',NULL,'p20190704143058','form.sample.radio.destruction','','basic-form.mediumg.label','','','[\"basic-form.checkbox.architecture2\",\"basic-form.checkbox.architecture3\"]','','','','\"\"','','','','','fasdafd','basic-form.radio.system1','\"basic-form.radio.basis1\"','\"basic-form.radio.target1\"','\"basic-form.radio.confirm\"','basic-form.radio.domestic','','','','u20190605134344','',NULL),(49,'',0,NULL,'basic-form.others.viruses.complete','\"\"','','','','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','','','','','basic-form.others.SecLev.public',NULL,' ','','','','','','','','','','','',NULL,'p20190704185453','form.sample.radio.destruction','','basic-form.mediumg.label','','','\"\"','','','','\"\"','','','','','','basic-form.radio.system1','\"basic-form.radio.basis1\"','\"basic-form.radio.target1\"','\"basic-form.radio.confirm\"','basic-form.radio.domestic','','','','u20190605134344','',NULL),(40,'',0,NULL,'basic-form.others.viruses.complete','\"\"','','','','[\"basic-form.radio.opsystem1\",\"basic-form.radio.opsystem3\"]','','','','','basic-form.others.SecLev.public',NULL,' ','','','','','','','','','','','',NULL,'p20190704143523','form.sample.radio.destruction','','basic-form.mediumg.label','','','\"\"','','','','\"\"','','','','','','basic-form.radio.system1','\"basic-form.radio.basis1\"','\"basic-form.radio.target1\"','\"basic-form.radio.confirm\"','basic-form.radio.domestic','','','','u20190605134344','',NULL);
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
  `function_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `function_object` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
  `role_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_roles`
--

LOCK TABLES `tbl_sys_roles` WRITE;
/*!40000 ALTER TABLE `tbl_sys_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_sys_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_testcase`
--

DROP TABLE IF EXISTS `tbl_sys_testcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_testcase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `design_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `designer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `expected_result` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `regu_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062933 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testcase`
--

LOCK TABLES `tbl_sys_testcase` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testcase` DISABLE KEYS */;
INSERT INTO `tbl_sys_testcase` VALUES (2019062909,'p20190606171311','',0,'note3','d3','3','note3','c3','p20190606171311-20190629205845',NULL,NULL,NULL,NULL),(2019062908,'p20190606171310','',0,'note2','d2','2','note2','c2','p20190606171310-20190629205816',NULL,NULL,NULL,NULL),(2019062907,'p20190606171309','',0,'note1','d1','1','note1','c1','p20190606171309-20190629205733',NULL,NULL,NULL,NULL),(2019062910,'p20190606171312','',0,'note4','d4','4','note4','c4','p20190606171312-20190629205922',NULL,NULL,NULL,NULL),(2019062911,'p20190606171313','',0,'note5','d5','5','note5','c5','p20190606171313-20190629210039',NULL,NULL,NULL,NULL),(2019062912,'p20190606171314','',0,'note6','d6','6','note6','c6','p20190606171314-20190629210242',NULL,NULL,NULL,NULL),(2019062917,'p20190606171312','',0,'note7','d7','7','note7','c7','p20190606171312-20190629223943',NULL,NULL,NULL,NULL),(2019062918,'p20190606171309','',0,'note8','d8','8','note8','c8','p20190606171309-20190629224200',NULL,NULL,NULL,NULL),(2019062919,'p20190606171312','',0,'note9','d9','9','note9','c9','p20190606171312-20190629224229',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_sys_testcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_testplan`
--

DROP TABLE IF EXISTS `tbl_sys_testplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_testplan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `approver` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `auditor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `body` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `hardware` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `progress_table` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `staff` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062916 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testplan`
--

LOCK TABLES `tbl_sys_testplan` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testplan` DISABLE KEYS */;
INSERT INTO `tbl_sys_testplan` VALUES (2019062901,'p20190606171309','',0,'AA','Aser1','Aser2','Abody','ssd',NULL,'nju','Aser3',NULL,NULL,NULL),(2019062902,'p20190606171310','',0,'BB','Bser1','Bser2','Bbody','ssd',NULL,'stc','Bser3',NULL,NULL,NULL),(2019062903,'p20190606171311','',0,'CC','Cser1','Cser2','Cbody','ssd',NULL,'dev','Cser3',NULL,NULL,NULL),(2019062904,'p20190606171312','',0,'DD','Dser1','Dser2','Dbody','ssd',NULL,'online','Dser3',NULL,NULL,NULL),(2019062905,'p20190606171313','',0,'EE','Eser1','Eser2','Ebody','ssd',NULL,'2019062905','Eser3',NULL,NULL,NULL),(2019062906,'p20190606171314','',0,'FF','Fser1','Fser2','Fbody','ssd',NULL,'2019062906','Fser3',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_sys_testplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_testrecord`
--

DROP TABLE IF EXISTS `tbl_sys_testrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_testrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `approver` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `bug_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `design_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `designer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `exe_process` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `executor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `expected_result` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_consistent` bit(1) NOT NULL,
  `pre_condition` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `real_result` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `regu_notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testrecord`
--

LOCK TABLES `tbl_sys_testrecord` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testrecord` DISABLE KEYS */;
INSERT INTO `tbl_sys_testrecord` VALUES (1,'p20190606171312','',0,'a4','000','note4','d4',NULL,NULL,'4','\0',NULL,NULL,'note4','c4','p20190606171312-20190629205922',NULL,NULL,NULL,NULL),(2,'p20190606171312','',0,'a7','000','note7','d7',NULL,NULL,'7','\0',NULL,NULL,'note7','c7','p20190606171312-20190629223943',NULL,NULL,NULL,NULL),(3,'p20190606171309','',0,'a1','001','note1','d1',NULL,NULL,'1','\0',NULL,NULL,'note1','c1','p20190606171312-20190629205733',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_sys_testrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_testreport`
--

DROP TABLE IF EXISTS `tbl_sys_testreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_testreport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
  `approver` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `approver_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `auditor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `auditor_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_company` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_contact` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_fax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_post_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `client_tel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `hardware_environment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `report_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_menu` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sample_state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software_environment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `software_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_basis` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_conclusion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_exe_record` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `test_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tester` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tester_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2019062912 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_testreport`
--

LOCK TABLES `tbl_sys_testreport` WRITE;
/*!40000 ALTER TABLE `tbl_sys_testreport` DISABLE KEYS */;
INSERT INTO `tbl_sys_testreport` VALUES (2019062901,'p20190606171309','',0,'A1','20190620','A2','20190620',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A3','20190620','1.0',NULL,NULL,NULL),(2019062902,'p20190606171310','',0,'B1','20190621','B2','20190621',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B3','20190621','1.1',NULL,NULL,NULL),(2019062903,'p20190606171311','',0,'C1','20190622','C2','20190622',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C3','20190622','1.2',NULL,NULL,NULL),(2019062904,'p20190606171312','',0,'D1','20190623','D2','20190623',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'D3','20190623','1.3',NULL,NULL,NULL),(2019062905,'p20190606171313','',0,'E1','20190624','E2','20190624',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E3','20190624','1.4',NULL,NULL,NULL),(2019062906,'p20190606171314','',0,'F1','20190625','F2','20190625',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'F3','20190625','1.5',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_sys_testreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sys_user`
--

DROP TABLE IF EXISTS `tbl_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `roles` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user`
--

LOCK TABLES `tbl_sys_user` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user` DISABLE KEYS */;
INSERT INTO `tbl_sys_user` VALUES (9,'$2a$10$yicg4parlvccAlZF5YuUBukgN1lvBsSrZEG3x7cZzySzmbTsGyrN6','SS,STAFF,USER','u20190605134944','SSB'),(8,'$2a$10$IqcgtoVcKYWSbWm8qgHPAukbAY5ckeHlYOOWUSUf7uQ7kflCdoq9W','SS,STAFF,USER','u20190605134833','SSA'),(7,'$2a$10$6l33U7F7cjQAE195sh2sr.9zDQEdFlD62TKAny4pzhfF/8IflYPcK','CUS,USER','u20190605134759','CUSC'),(6,'$2a$10$ZgVEAigy6ThCL8omHD2wP.v6JmWcMyMg6GNDqff3AFFZKbVuaN2ni','CUS,USER','u20190605134754','CUSB'),(5,'$2a$10$8Abi3J5mBkt56T7D9gt.geulQbsdP0Vm3ScwiR.7KbYcoCGu5UzMy','CUS,USER','u20190605134344','CUSA'),(10,'$2a$10$vwjMP/wk3Y784K1b4DYdIuOPxmQa0BoQmXOyuOP4keEhHrHoFWZV.','SM,STAFF,USER','u20190605135114','SMA'),(11,'$2a$10$aYX7pelQ8quDWK9oUmGf9uDMyA/69YW9W3lOVyLqPJYc8m0sRvZDC','TS,STAFF,USER','u20190605135358','TSA'),(12,'$2a$10$ADZhPAEFjKQwRaXpzsX0iudNRGYZNyJyVtvSwYfydhuSK0f7y6.qC','TS,STAFF,USER','u20190605135411','TSB'),(13,'$2a$10$JcDZImu1LBuauLLJsyGpiuN1zXYimgGTlpXGUPmM.ljrjfKgc.tny','TM,STAFF,USER','u20190605135543','TMA'),(14,'$2a$10$8JQTL3a0SiiHIdL5su8cmebzsTsY/MrRpmqpi8w2MP5ICO8MFRiiK','QM,STAFF,USER','u20190605135736','QMA'),(15,'$2a$10$N1UDFDHAAIaZa/GkSPInLO/WPTY9mY.5BiKEZreAmU7sccBkKfMs2','ADMIN','u20190605135828','admin');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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

-- Dump completed on 2019-07-05  2:07:31
