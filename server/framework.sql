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
INSERT INTO `act_ge_bytearray` VALUES ('15002',1,'/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','15001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('15003',1,'/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','15001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('15004',1,'/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png','15001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�g\"\0\0*�IDATx\�\�\��\\u�/����\\\�B)\��R�%EQ�\�uq-�\�L�tO&�F�1\�\�Mna%�(�\n\�E��@BL! b$�0�\�$���dB�s����ۄL���\�>�Oտz�1==�3����y�ϠA�\��|�A\0\�\���\�\�\���\�a7/\�_8��9��\�O�|~܏,?���[\�\�Y�\�\�\�\�N_��\�k\�\�gm�]\����9\�]7w�j4�\�aϚ��E�\��g�����^:�?fm�??�\�}\�\�ޜ\�Խ\�\�\�_��ew-_�/7-\�8���Ͼz\�֟/͟K���\�=�\�\��x>���Z��ճވ\�\�\�\0h�80��S���7>���\�\�q\�C[W\�mz�}��_�9\�\�=�n�-7D`|����s\�\�	|f���\�<??\�-�;�\��+\�\�\�\0�Q��w��Z�����<�\�\�)l���)~4���\�ּt��o�\�\�4��e\\��M\�u����<�ʸ[�\��z�~0c\�K\�N��!^�}�(���θ�7/=�\�\��\�\�ؘ_�\�\0�_�\�=�6\��{l\�s\��\�k\�lN�\�v\�w�\�\�\��\�9y�}�Χ\��\�\�6Dü|yz\�q�.|�6��������;e\��x�{�Z��\�@\0\r\�)�O�\���Y[\�\Z�\�1W\�\���\�|\�\�=�*:\�\�\�\" \�ȡs��\�}ɝK\�\�6�\�\\t݌\�W׿.ޯ��O\�w\�m5u\�`#�C�#\�\������dl\�{\���}�=�/}<ϿW[ï���ikb��n�ݦ�7>\����+�{\���QA��\�R\�?\��k|]�\Z+\0Ί�\�n�Æk\��8\��\��\�\���\��|^lJ��5��=�\�\'\�\�N\�y}E\Z6<�1=ٯV�z�\�u�~�h�\���o���������\�V\������\�0\��|(���S�*\�!��82(:\�I?}f\�\���\�˵\��oy:�\��+�ݖ\�=qT\�ԕ�s18\�ڇވ�	j-=w^j���\�\�\�\�;w<�h\�m\\RNA\�Py\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�J�\�\�s\�=���\�\�M�<y\�9眓wvv\�Ç\�;::�\�>;?~��I�&�8z�\�o�@X�lY�-�ܲ\�[\��V~�\�\�7\�xc�\�C\�˗/\�7lؐ�M�6\�]]]�#�<�\�z\��i����y\�[ǎ{�\\>X�o\��\�3f�>묳�\�/X����\�U.\�Ө!?\�S�4j���\0M�����`\�1c���\�\�{\�駟\�G���z\�+;;;T]��v\�\�\�\�Ǐϯ��\�|͚5y_�\�F�~g�qƫ64� \�{\��^�y�漯M�2%F/<x\�h � 6\�\Z����\�����#�Wq�;�c@_m\�Ѧ�\�N;mk�\\�\�\0\r 6\�Q@qP��\�\�\�\�[\�\0h\0q@ڟ.��\�MÇ���\0(\����kP�\�SO\�i$���\�\0hڴi��3��\�\�\�\�tvvnɲ\�K`�\�\\@1\�@�\�+\�>|��\00@b2��h <�\���S,�\0H\�\Z��\r�իWoM!\�m)\0���6h�	\�b*jK`�D\'<��\0�\0:餓r$�U\0�o�\��O���k�}\0h	\�ut\�=�\�\�\�\� �t\�E=?P\�	�?~��\0\�\�ѣ�\��3�c\�g|l\�﹃\�Ν��\�0\�ƍ�\�\�/��_C`ԨQ+\�\"\n\�\0\��\��\�7�.\\��_\�\�^�\0\�\0hg�y\����̾��\���\�T*�M�,\�`N;\�\�W\\qž\�I�5���,\��6@����iD��ꫯ\�A�u\�ر��b�j4h�\Z5�\�\��\�\��\�_�\�6�q\��#x��\0\0M���\�on��\��\�;�c@l2\0h\"��vĈ�\'L��F��\�l\"�7oު\�\�P=\n\�N`�fk\�i-��X�9r\�\�ɓ\'��5k\�\�+Vl�\�\�f�\�\�\��\�\�1D�	��`�@�H�zGj\�S{>C\\8�kݱ\�?��1�3���ĉߩ\0\r�Q�F�\0\r�����Q	�b��V;\n�}T%\0\n\ZY�}\\%\0\n�\\.o:t\�a*P\�8R%\0\nh��\�\�\�\�>�\0\���X�gU��!P*��V	�*�˛�\r�e�\0(ft�����J\0\��\�\�7�J�!*P\�ؐ\�0�\0(f�/\'*P\�X�Q	�b��\�\��Y%\0\n�\\.�I\�*P̑�����\0\�	��\��\0(\�H\�\�\�U	�b�V�J�U��#��\�ƫ@1C`E�e�T��!�<�KT��\�(\��J�r�J\0s$�\�r�|�J\03�K\�*�\0(�,\�W*�)*P̑��\�r�z�\0(f�1���T��!�Tj7�@eY�0��m*P\�X�B\�v�\0(�\0�S��J\03M\�*P\��]jSU��!07˲�U��!�@\n�i*P@\�ryV\n�*P@\0*P\����T��!pw\�V	�*�J�*�\��@1C\��T��!�\�)W	�ʲ\�\�Ç�^%\0�?I!��J\0P\n�[R{R%\0\n(.-��T	�b���q�y�\0(�J�2%˲\�*P@ipUjϩ@�\�\�+R�Y%\0\n�R�\\�e\�*P̑��i$�L%\0�9�(�V�@1C`B\n�.�\0(f�M!�J%\0\n�T*�?|��T��!pv�\\~Y%\0\n(�\�H\�U�\0(�4\n�fjkT��#�Nm�J\03:R[�\0TNR�W	�b����A%\0\n�R��e\�F�\0(f|5��U��\�\��1)6�@1C\�B\0� b\'pj�N\�R�h\�5�Kw�R\�x�(\�h\�yhaY�M\�-\�\�\�3h�\��\�턀\�L$\�m\�r�t�(N�V�.P$i\�L\�(`��\0t4�\0T*�.\0�@�\��/^�x\�ܹs��\�/�6m��m��\����߿5�)����0{�켫�+\�\�\�\����Z�*�9s\�\���eM!F\0�o� �L{\r4�\���\�\����eM!:,�\0��ۺW�\��1_8�;=-��\�t�B\0h�X�ʋ���\��\��\�\�\�xN\�/�����\0��N\����C\�\�~�\��\�t�B\0h\�xb\�\�^C �\��@hB\0h\����z�xN\�/��Es�\�5\�9�\0Z8^zqA�Ľ޾)(=\�\���\0\�\�!mɼ�\��N_\0�7\����MA\�xN\�/�\r�8#��9W��O �sְ\0Z-\�\Z��E3�?\�=�\�\0��xM�֨@\0-;[�7*@�����\�hT �\0\�\�!��PkB@\0M�\0��&\0!�	@hB\0�\0��&\0!�	@@K��5\�{	�\�C�\�i�\�v\�=\�̙��\�\���\�\�}\�{�#�<�aB`o\�[\0�	\�i�y\�a��|߂�U�V\�G�е��|o!\0>�-[�>�gM?\�СC�+V����\����\�{�\��h\�|\�\�\�\����\���\�h\�\��p\�\�>�\���\�n�\�mｧ#!\0���\�y\��]w\�\��u�Tz��c�9�\�萿��/\�&L\�Կ\�;\�񎝆@��{\�o{>:�%K��y���nz��?�A��\0!�/B \��\��\r6���:�=��/�0?\�#\�|���>�-\�[��\�:\������\�=���0ۮ�@�SԷy�\�9*�\�\��\��\�I\�\�}!\0�}�9h\�ԩo\�t\�	\'\�s\�\�\����\�\�y>F�\�cSM<�hѢ�\�o\�\�\�\��oosО�@-�\��a@\�FDZ�c8���ŵ\�;�>\��\��\�4��7��m���z\�I�\�\� \�\�1�\'!0y�\�Q\� ;�!�	@hB\0�\0��&\0!�	@hB\0�\0���\0B@\0!\0 �\0�\0B@\0!\00@\�\�>�\0�j�\�\�[���t\�}\�^x\�\�St�\��3.�9s\�֕+W�\�^�fM���\�\�\�Hm��,�i�NkRZ{]�1\Z�\�%*���~�\�\�#F�ȯ�ꪾz\�n\0��T/^\�\�\��z�o�\\^W�T�<x�(HdYvw�o��0\���ۃU�\�C u��ׇ@]ے\����<@���\�\'�|H/!P\�f\�LЂ!P\rl\�-\0\�s[R��\0-\Z\�}���\r�e�h\����\0x\�\�a�b�@\�6pO�*�\�OU�\�C�����j\�5�q�X\Z|�z�\�7T��C��ދ�\���F\�㛳,;B�Z8v�3�ګ(`$����2�G-�\�@턲�N\�JK�`!P�\�\�\�ıR�t�%P�i$pM�R���P�����9��/��D\0\n�F�:�\\.��\�`�%P��J\�q�@�k�\0,B�:1\�\�\�-���@���<��1턥P��~�%1儥P�2d\�A1\�hj�YB\0�P*����,;\�R(X�\0�∡���\�-)���@(�˳R{Ō�\0��\'�3}Ʈ4*x\�\�(X�����\��BiDp�%P�\�\�\�Yu\�\�!�\Z@�B dYvm��\�#G���%P�������\r2\�(@�B�:\�\���\��\0\n\�\���8 �,A���@Ȳ\�\�Q<bĈ\�Y�\0��B\�\���q��!P��ϧ�GK��!\�\�\��ꌣ�X�\0�P.���^�\�\�(@�B T*��\�\��\�СC�T\n\�\�ev\Z\r�\�\�\��nK�`!3�fY�*�Ö,@�B ��xlJ��-]���@(�Ŗ��}\�(XT�\��ԺO<�\�[\�\0�\�\��Dj/Z\�\0������\�om�ew[\�\0�j|:f-�J\�[\�\0�\�\�8:v��g-q���@H#��\�\�\�\�c�}��P����f(jČ�Y�mL��͖<@�B ��J\�8Z*�N��!P���Η�0��%�\0�b�\�sR{Ɍ��(��q�\\.�N����\0B��:;;?Q�q�{�\0!P\�߿\'�U*���k\0�@�J��:l4\�( \n*˲�����(�ڌ�\�r�ת�joo�L�H��\�\�\0�@�J��#R;J5\0!P̚L5\�( \n�\\./M�yJ%\0!P\�88M\�&\�\0�@����c�H�jԡ\Z�(f}.3\�( �]��1\�hL:�\Z�(��n:B \�@5\0!P@�9(6\�\�!\�\0�@1k\�;�c��j\0B����)�CHUŬ\�Sq2�J\0B��b:��V\"��P\r@�nG\�Ds1\�j\0\�\�q��N\'m�J횘r:� ��V\r�B�cg!�e\�$�ڭ �u\\�&.J�\Z@3����\���\�J�\'.K��T	��Gi��R\�}q��T�\�`�j\0\�\�\�7�\�(`\�U*��Vg��\�t���$.O�|�����4z,3\n\�{)LJ#�\�f\Z��:�.ƩHߨ�qt�j\0�>\Z\�\�7`\�\�{hlJ\�\�\0\Z9:�1�o�J��\�D�_Q\r(�<\��_�x�ҹs\�\��\�w_>m\�4m\��\�\���\�kjS�4doN!����\�C�+�@\"\0fϞ�wuu\�\�\�\�\�^�U�V\�3g\�ܚar��S{\�H�\0@\�A\Zt7\�\�Bm\�\�R�t��(�\���\�\�����\�!˲\�VO$\�\n :,���F\�\�\�\�\��i�! zںW�\��1_8�;=-��\�t��\��\�f!\�\�־�b�\�=\��\������x,�\��^�/����(x,]�˷@���p���EC f-�\�ݩ]\�?\nO�����@<�\�o\����;�S+�o����\�&�\Z񜎿uC dY69��H��B@,�#�ߥXe\�Q(`\�\�@��@<�\�o��G\�\��\�)f�������9W�\Z񜎿�C :��\�,T�T.�\n��^\\�?qo\nJ�\�s:�b�@H���ǌ�Æ\r���(HD[2\�淅@<�\�/VT�\�\�\�8\nE	���ENy����X<�\�/VT�\�3�BB \�~f\�U�\��\�5\\�\�\�\�<0˲\�S\�\�Z1\�\Z��E3�?\�=�\�\0��xM�֨�8!F��8�,��Y����B`gk�FB�f��\�Č��}\��H\�\�\���FB`Z����\�\�4\"X3jԨ�GA���@�	�b�@�_\n�eY�-�-�\�]#G��H\n�\�\���! \n�R�;�\�\�\�3�Y �@��\"�6utt|\�!P@Y�=���ˌ� �@\r<x�4\"x%�Y�\�@�joo?<\�H��I�\�@�bn:%f-�J_T\r�\�ү\�ӄ@cH!p[\�8:dȐ�TZ j�lomw\�\�]\�zW�����}�\�\'Z7��D%�\�F{\�\�\�\�\�ٳ{��\�\�>fsP��GS�O\�\��e˖\�\�>\�{\�\�ӆ��X��\�\�u���ڑ#G\��W\���1\��/Y�$饗z;�\�C\���\��{\��\�|ժUo{\�\�ޫ��?����@\�ד\'O\��޸���\��t\�AB��\�\�\�\���t{�j@��@@<~\�w\�w\�uW\�ץRi�\�7k֬��������|Zs\�ylΜ9��O>\���QG\��ܘ1cz\��\�7�\�\���܏Ƿ��v�^ю;\�֮]�q\�=_\�\�k��\���	\'� �H�RG�\�O��p\�\Zw<�aÆ��\���m�#Ħ�?�\�Oo�����w�\�/�_��\�\���\��q?\�\�g\�\�{E��\�{?~|\���\�s;iҤ�\�x^��,˦�\��kf!\����\�\��������}��o\�\�\�\�x�6\n���}���\�\�\�\��|l�9\�Cz�P����\�~�3!зb\�\�\�)\�+`s\�ԩSw�9(6\�|��=�kG\�6\�\\p�\����MH�\�M=�}���W� j\�����=�]v\�eo>V?B}#�}|4\�JAp�j@�@쌭\�1_\�\�\�޾/:߸�\�G�܏���~z\�\�A�~\Z��\�c���\�ϴ+\�;�\�P\�\�\�\�\���\�qG\�i�\���q4�mS\rh\�Є�\�H#�+cDp�\�\'�\Z �@17\r=�\�\��\�~�B@L\�8�B\�\�\�~�\Z �@17Q=`�j�\�\�,�\�\�_P\rB��\�H\�1\�P[[\�ߨ!P@i$�l�e�U��(��X�\��B@P�T:�zE�SU��(�\�㈡�C��\Z �@1�\�8� \�%P\rB�xb\�\�\�r�q�\0! \n(\�J!�)��\r�B@P\n�\�c&\�N8\�P\�\0! \n$u�7U\�$>K5`�]\�E�&˲1\���aþ�\Z��̞={KWW�λ�\�/��|\n�nY{���\�ݩ�2��\�\�\�퇫\�C3f̸d\�̙[W�\\�\�\0�>}��M���\�g�HmU�\\>XE��NkRZ{]�1\Z�Ŏ�F�|\�\�-\0�\\gg\�\'\�r^�ڳ\�\r\0\�4q\�\�wV/^O�Jk��O�;-\�Ux�Q�F Z:\0\�Ջ\��T5�\�m&8P��R�t~�\�e�lWGGǇ�@\�ɲ\�\�9\0��ЫO<�é�ت�#u��N!�FZ�_S\r`�b��\�a�P\�\�??�\r�}JE���C�@�;�\�cߟF\0KS{9�GU\�%C�=,u[T��Gsqm�Ԟokk{��\0�G\n�\�\�\�\���\�\�G\�\��T\�-i\��\�q�J4�J�r\\Zvo���j\0{$u\"G	�\�e\�Y\�s\0�R\r`�Ŕ�6�M\0��\�\0��\Z�^)�J_�y\�U�iB�g1rKAЦ\Z@_t*\����_\��J˪{Ĉ�S�OT*��FǢ�+&�K�8�k\��\�*�e�:��*ј�\�z�NmY\\FE�>�:�aq��J4�8�#-���=SB�\�\�\�\�\�\�@ [��%-��\�Q[\�v�j\0�L�\\W��\n�S\�,\�7���C\�멳Y���R�\\T\r���\�Zg\\�\\%^Z7W\�\�P\r�_�J�S\�\�C��\0���æ8yO5��	\�4��\��hkk{wZO\�&��\�[E�~�\�>Ǥ��J��!C��:��uŵ�U\�w�:7��T�\�G`�ƾ��\�<xD�T�0uD�U�_k~tLՑ\�l\�\0z$0>6G�D�ջ���v�j\0�\�)MLm�J�Ϩ�z\�%�4�r�|qꔖ�ľ�eٵ\��|S5�F\Z	\\�ڋ*�O\�\�(�\�V\r����\��\�I��}/f�L��\�c&\�T\�O�\�p\�\������J��\�\�\�#\\Sm_9r\�GThH���*�\�T�\�ttt|,\������OE���\�V�I��%*\�g�zTjS]Iw�S�\�C\�Ϫ\�ޫT*\'\�9\0��w�\�J�\�c\��\�\��\�\�!�\�W\r��:��R��J\�\�\���1�4[ܒړ*�\�#���M@�)H5���e\�OR\'��J\��R\�~W\�	�Y\�\0�5\��Tb\�\�a��fKR{-U�i��\�\�\�W�]\'~\��b��8!LE�f�_���J\�\\L��FN\�S[SB�\�\n!05�m�Ď����cL�\�=���r��\�f��J\�0(��\�%N�S\r�\�:�{R{P%z�\�%\0�Je�j\0�\�\�Mw�\�^GI�V���\Z@KʲlF\�\�f�\�\�\���\�6�\�|A5�V^۝A�1x�\��c\Z�\�\�\r:�0Z}���\�T�\�:\0J�\�J5Y9dȐ�T(B\�u\�\�A�\�k�1\n�р��\��\�8L�\�5(�J_L5\�d\�P\�x$u~�,\�\�G�\�@1�����!�XQ���:�qq@j�K\0\n)&��I\�\n8�> \��W\0y$� u��,�\�y�b> @\�C`a\�o+\�\�\Z3�\��1\�СC���KKa�h\��\�\0�k�x\��\��qv\�M��;\�տ\�\��k�-5j\��:���E�\�Ъ�_\\�7��\�\�tw?K�N\��m\�y�S\�?�z�\�-i�\���״\�\�U*�\�N���t�\�2@\�k\�ϧ���~��}\"\0Rm	\�x$���֖S\���\��~�\�-]���5�P�T.o�_e�h�\�ﳱ���3�,���9/K�\�\��;����/6k��\�\�\'�|��\n�\�#�i$pQ�~��#G~$u�/���\�c�}�%\n�{#���Ml\�\���\�6� �SBX�\0�ߑ��)���s-&�K\�,E�=\�LW�vA3}\�R�tjZ�T�X�\0{/�vn�|\�؉]=\�K`\�;\�WR\��5˲�\�9\0\��-9��	��\�M�9H��T*m��\�H\�\�\�ި�o�\���Wg:]�F�Zb\0}���\�)��\�:::>T=ziŐ!C��\0�>֥��I���\�\�\��ϖ\�Smmmﶤ\0�M��Z��>Ӱaþ�>Ӧ\�~k	\�Cq\���֝5\�\�QIZ.�l\�\0\�����J�rb�|���ߒ�i�%\�?\�ƴ�=�F\0?�\0H�\�-���\�4�\�\0�\� �\0�b�\0�o�)��3?;��I�\�\�9�n��4\0&�0\0�7\�g/O?{uj[\0o�N����3\�Z�\�\�\�\\�~��F�\Zu��\00p!�9���\�\�1\�s�\"��\�\�~�\0@�u�q\�|\'������}4h�\�I�wX\Z\0�,�\�Y\��\�5���ܒ\0�\���\��\\.o�Y;��ϼ�z!�3,�\r\�Q@\n�_\�\�\��\�ǩ>@Ȳl�����(`��s�i)\�\�\�>�\�\0\r�T*�m��ʾz�c�=��\�=��\��t�Qh0�s^V\0��\�( :�\�u��F�4@���\�B �.\���\�>��\'�\�\'N|�*4�h`E�@L᰷\�3��`y#\��Je�#:N<�\�|o\�\�Ӛ�\�\�C@�VU�\�q~jyj{|������48_9�+\0���X�v�� u��\�4�tyJ\0v=\0j��\�\r��\0�\\.w���\0�m\0\�\�񷈩�S\��l�ek:;;?��\0\�\0\�>?n{O\�\�_R\�*.\�G\�8P�\�MCq�\�8�,.��TN�\��� \�R\�5�\�2��ݧ�\0�\0�߷\��\��+MA�#�(F\0�x��\�����\��\�\��\�\0�\� �\�{���_\��-�;\��.ٛ �1\����rv�w��n�G\rи0��f�׵\�A}\0\�\�u;y_\0\Z<\0z\�\�\�`g\�\�\���\�\0l\0\�,޹�P�s��\�	�A�n��A`@����`w�Ʀ!�vH��^��\��\�\�\0����\�{�E0�#�]\�4\�\�#�K-�\���\�\'P�[Ȧ �&	��<:ȉc\0\r\Z\�;j��\�\�\� ��6n;k\�}y\��d%h����;H\0\04و�>��k��ֿ\��\0\0M<\"؛m�\0�\�F� \0�EF�ӡ\0�\�ʦ��AvrDPۇ \0\0\n\�;�\0��qu\�L`����\�d6P�b���\0����\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0B\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0! \0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0B\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\04n��\":���u*К!б�Ȳl�J�n�\�A�<x���P�\�@�\\�T�\0Z?��o`�Q\0@AG�\0+�\0TZ�?�.Ʃ@�F=��\0Z\\t��Ɵ\�\�\�a�\�\�\�؜\�K�ͭT*S:;;T5�&7t\�\�#S\�>3u\�v\�l\��\�E�dY�0\�~^�p\�?u\�w�\�?ߝο�6\�\�\0�I6\�\�i\r~ö��駟�_w\�u�C=���\���\r��]]]���>���\�?\�ǌ��\�$֗J�\�U��\�Q?\�\�\�[\�;��\�;���߼ys��\�ϟ��;v\�0\�\�|���\�?)�S�\�V翭�\�;\�\�\�tb@#�M@)\0�\�o�y\�g��\�s\�\�g�u\�[F6\r4�\�	\\�  ����x�� �}v4�8\n�~P_�\0�7\"\�f\�\�\�T`\0\�y\0��b���\��\�f(K`�ĉ`�Gmڴ)\�\�.�\���\�B-��\�\��\�@�Â\�rfqj[\Z\0�,լ\��7��\��\�b�!K��U\'�\�\�o�ᆼ?\�z\�o�V\�\�\0\��x��1D�MOu��^�4\0�Y\�|\�\��|��~\r�8o�~\ZjK��Govĵ\�\��K����oi\0`!\0`$ \0�}\0\�	8:��!\�<��Jk\��\�\�\��ַ�10�b\�\�o\� ���9�\�g\�\�@���\�\"\n0�\�zq�G\�\0(\�h`v]Y줓Nre1�F\���k�\�\�k�y普1ЈJ�\�����\"�jD#��\0��?O\�\Z+ί�\�4��fgq\�\�fP�&�6@A���\�\��a�\�ǏK\�\�+\0\0\Z?��\�GP��(\�,~\�Gz\�\Z�M:��\�?�\"\��?�~�M@\0M\"v\�\�5��\�wv4�8� �\�?Vf�88N�T*_UE�&SLT\�\Z�\����i�\�x%&����L\0\0\0\0\0\0\0\0\0\0\0к��\�!W��Q�\0\0\0\0IEND�B`�',1),('15005',1,'/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','15001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0F_#�\0\0�IDATx\�\�\��T��\'�\�\�C�IUȭ\�Z�Z[�\�ݤn��T6�T*)+��J�\�<D��g\'\�A\��G(YY�\Z5��D�hb|D6F��6W��#�b\"��B!^\� 0�\�\���/\�� \�\�s���\�t�nzN��s��\��]\�\0��e٧\�N�\�3vj�\�\�\�}\'�\�v\�\�\�HP�+F�\����\�4\�\��{��,�r\�v߱,�\�0\�{�\0Uu\�\r�\��Η���@��D�z4�\�\��/�\�em\�\�\��z_w\�\�Y\0TM�\\�0\�i��wӢ\�H\�_?\�53�<\�6��7\�3�+��\��}u\�\�\�x\�~�讱׵�\�ϲb�U��Y��Ϯ|\�3Yve�v\\\�ue�Y��\�-	\0T\�&\�\�Jn��\�l\�eX޵\'���:���T�?/\�3e\�\�7�\�_�\��\�[���\��_\�ۙ���\�\�+7V|\�ͩ�߷�\�~eܯ���\��7���Y���,\�\��C\�\��\�\�ty\��\�N�׻w FG6��Ͻq�\�\�C�94�0\��po�´G�9S\�\��\�\�\�\��ul�wev{��\��_\�\�)w�׵��3S\�g)\0P�ܾt�\�\�^�g\�{n�kw\�\�:z*:��\�Q�˲lR�?�\�]�ˇ{b3h�\\t��kܲ1M�c��\�%\�\�x�\�w�yS�ri9���3W��8K���}q���le_\�]qϫ[.�ó[/�\���{\�f\�O\�&̱�L`\�\��\���x\�{�|5{vlt~7<���ײ��7W��\�\�A�\��\��\���\�ٶ��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`���\�lƸ�m�\�\�˲\�=m\�\�͌<\0U�\�;��\�\�\�B\�w~}\�M��f��f\�}\�\�v���=���;\�ϯVvc��\�0{]{\�\�M�f\�\�ڮ{�7jvWvÞ\��l�w\��\�V\��o|$�\�\�q_-Ȳ)�\0\��^_8��\��\�\��\'�\�g��W�f3\�\��\��)��X����O}hg\�U��Y���\�\�|1�ޕ\�\�L{x[��奄\�\�MnͲ�\�\�?k	\0P�.\�\�ʎ+jʜmʝX\�\�\"���7�M��o\�ϊ\�ܶd\�3Yv\�\�w\�\�=ax\�/��)\�.�\0���\�\�]Y\��eY6\�\�KW�\�-�V��}B\��ӿ�W��V�n/_�\�\�\�&Њ�g)\0P�vf�\�R\�\�G7wGv}\�~�=��M`s��\�n/�tl¼�7Ol���Ǵ��{aE�>$\�߷�����A\�g3\�=y\�SٽF�ܻpڂ8�\�$#\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@\�dY6d\�̙�L�:u\�\�ɓ{/�\�����5kjj\�F���;6�0a\�\�I�&�3f\��F�A\�\�W_m���\�_?\��ѣGg�\�rK�裏fk֬ɶoߞ��;wf���٢E��\�ӧg�F�\�\�9\�\��\�\�\�/�J\�\ZE\0꽳;v\�ܹ\�=�\�,uvْ%K\�\�v��.]���0;\�3�\�N2�\0\�mw��_�����-[�xqv8���l̘1\�Yg�����u�\��ntuu��0aBv\�\�f���zv$\�f\����\�>�5�;��/\�g?�Y�{�\�\�H�6mZt|��z�\��fb^lҌ�l �ϔ)S�SO=�#@\�\�A+�\�Hm\�<Ц\�Q�F��J�6�@\�\�f\�8J3�Ь�8�����\��=\0�.\�Ë\��\��\�/\�\�\�\�4\�\�P5q��8�Z]^�\�{.K�\�.�\0P5�f\���q���<x�?���=\�b�K���kiƥ\�j\�k�\�\�\�\�\�a)\0Pq�踖f-<�\�#�S譴\0���[B\\<�6l\�ЛB�\�R\0�*\�@}wK����uܚ\�R\0�*\"tjI\�P5��vZ-;�^�@՜��5ۧ\�\�ٹ\�>=\0�f\�ĉݵ:zs\�̙��\��j.�\�Wju�ބ	\�:O��3f\��F�\ZU�+�\�e\�\\��j_O����p\�\�ش\�ڛ\0T\�%�\\�\�\�W_]\�\�;�\�3׺\�\0U\�\�\�:\�?�A\�ҥK�x�=�؆\��\�O��8\�s&čd�\�\�۶m\�inn\�\�\�\�\0\�ԨQ�\�\\s\�5yPKo��\�bq�\���⠒\��m�:u\�@_\���\��\�\�\�\�T�\r@]ߙg�\����<{\�7�\�&ͳ\�>;\\Yi?\0u|#F�X�\�������:\�Vb^l\�\�\�P�\�`�SO=u�ĉwE�\�&\�\'�xb}\�#\�s���V\0�ѝ�.\�\�\�F�\�;y�\�m�\�\�۽v\�ڞ�^\�\�\�\�\�>�\����X\\i%\�.\�ó9�A)�؈T�S���p[\����c�]��qi1WZ �A�\r>�}F�F	�	\0\Z\"�N:\�	\0\Z!�zO>�\�1\04D\�1\�cF�F��b��	#@\�J��aÆ}\�H\0\��\�\�\�Ç\�H\0�{\�bqש���E#@#tzqC\�/	\0\Z!��S��u#@#�ގT\'\Z	\0\Z!��777�l$\0Ƚ�\�BKKK\�H\0\��\�ָ向\0�B�+\���\0�W*��\n���\0�\�\�V,\�5\04B\�mJ\�\�F�F�\r�\�	\0\Z!�:SM0\04B\�-���\0�z��J�+�\0����U\�\�\�W	\0\Z�\�{%uzS�\0�z+RM5\0\�^\��^*�7\Z	\0\Z!�^,\n�1\0\�^SS\�s�~k$\0Ƚb��4�\�\�\0�\�\�=��\�.#@\�J�\'��\0����E)�\�3\04B\�=�B\�\�F�\�kjjZ�\�A#@#�\��\�\�\�5\0\�^^�T�g$\0h�Л�8�\0��\�?R-4\0\�^���-	\0\Z!�\�N��W#@\�\�%\�\�RdF�F�;R\�=c$\0Ƚ��P\�^\�H\0�{�R\�\�z/	\0r�X,ޘ�\�%#@#�\��)�V	\0r/ޔ���W�\0�\�\�MN��\�H\0\��ޕ)�^5\0\�^ss�e�\�[k$\0Ƚ\�\�MH\�i$\0ȽB�pq�T\�`$\0Ƚx�No��\0 �R\��)���\0�W(\�J\�\�#@\�.\�\�\�u	\0r/ވT[�\0�WJR\�m3\0\�^ss�\�)��	\0r�P(��Bo��\0 ��\�\�\�S\�u\�\�\�\�\�!�R鄖��\�\0�j�S\�\�J?{\�Ϭ�Zf�\0\�C\�\�v��+Wt{F\n�Ao\�СGG�\�_\��ťF	��\��ty\0\�\�\�\�O蹃:\0�S,\'\�\�md\0ȥt[*Bo� �Rg\�V\�\�\0r�X,��g$\0ȽB�p�\���,;z��\�+.\\�͙3\'�5k�RG�fϞ�͟?�7\�4m@\�E\�uttd���Yww�RG�֯_������\0�\�/��\����F�ί\�_PS�I\�JYU�bs��8��bEd��� �*j\�kk�\�nɖξ�\\�8�Y�+�\�*��6�Ξ�9!{\�\���bZ�f�����\�[���}��V-�a�����\�{�z��z@nB\�Y?\�7�\�5+t%�\0���\�[\�\�њ��^�f�����\�[�`j���Y�+�\�&�6�^�=�\�\�}7m�i��z@nB/j\��\�\'�b���z@�Boǎl\�#\��ݴ��\�kV\�J\����\�ʋ�\�w�^�\�,J\��;�R�f\�\�\�\�\��x}\��\���\�]\�]w�\�SB\�M\�Lww��\�\n^	=`Є\�;\r����WB4���\���RBzJ	=@\�)%�\0����\�SB@\�)� �jVi�\�\�\�s%�\0�W�!�w�\�\��Bz��s;\��=��Az˖-\�>�\�O�\�	V>?��Q\���ۼy\�\'��\�}�\�ٽ�\�k�\��^~;�c�9����\�\�\�%� �\�z�\�\�W�ysƌorGuT��ڵk��\��\�\�ڧ���u K\�\�ɓ\�\�u|BzJ\�=%�\0��z\0BO	=\0����\�SBzJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0����[͙3\�\nY	=�1ttt�tvvZ)��U�V��B�\�_PSs\�ν����wݺu\r�\�\�\�j\�\�]���={��T��\�5�VF�\���o�\�O�P�\�sOv�\�g�\�\�w�Ζ��\�;\�\�\Ze��\�x\05R*�V��W�\�\�\�\�ԛ*+��,\r\02�g��#����3BoO�=��ΏZ2\0D༞\�׵��v[�BoO��y�\�\�\�Hޔ\�Y���C�Co\�^�\�\��-O�x�%�aimm�BeW\n��k=/i^\�_\�\�])�F[b\0N\�\�L���N\�e\�B/je����!6lا�\�7�r=\�O�\�O\�mM�\�f�p8�\�)L���i\�O\�m:t\�і\0�\�U\rO�\�3r\�\�\�\�(�fW�\�\�ԉ���ǘWK�w,�ɦ,���\��\�o�\�턊i�K�\�\���\���>�}�4_�ی���rK�Cr\�g�c\n���ɸ�2υB\�\�\�wK�C\��\�I�n�\�w�X\�L\�\�ݖ \0����\�q`Hss�7ۼ\�<Ǽ\�w�$8�.\�\�1-\��eI�v�q\�\���M�\n@�\�e�X쓌\�b��_{�~\�\�\�я}G�\�w�dx�8\�-uF;�t�[|�z<\��\Z\�\�M\�;\�\�e\0�m0���^���\n@\r\�\�v=y�~�\�\�\�.\0\�.��\�K�p|�C\��z� \05�\�`u\���g\�\���\�t@\�0\�\�\�\�:$\�\�5�c|\��Ζ<@\���o�J�k\Z\��\�:%�\��\�-~�7bM!�z�}\��Ω~\�\0�1bĈN��;���׀����\�1�K\0h�.\�b���Q�\n�i�/ \��\�\�\n?kiiik\�1H�?2Ơ�����/ \�\�\���iſ-\�\Z4��N���%\04ΊU#��K�\�	\����:@1b\�\�⼵\���o��K�\��\0\�`\�\�L\�\�\�\��\�F��q\'����O4n�=�*\�0���K�\�\�T�\�\Z\�СC�N�\�U(��\�\�bt�\'�t҇-u��\�Ky��^EG�.}��,m\0\�h\�\�S0\�>|�?\�0�~��߮F=E���\�\�)�\�\�{�.vS\�fc	�O>�_R�\�LuU���\�Tݩ\�{�%�\�!��8�?�\�gs�}�\�B�,\0�\�\���\��g0��.O\�eۻ\�?��D\�E\�E�\r\�7\�\�\�\�\�|�%\n�\�\�\�\�̹�=�\��4\�\�z��4�\�ƦMK���ā-q�KKK\�\�\�\�W\�<����~_��X�\0JǴ4�Ǧ\���^\�\�z�\�ԉ\��l\�p(\�ql��Wv}U��\r\��8=NH�8(�B\�G{6\�xY܏.�\�Y��\�]�މP_\�\���\�:\�S�Zo���ͰqqiK��\�\�\�:$�ǌ\�\����\�\�z�\�4_��\�\� \0�\��\�O�h\n��T��\��4�qc\�=W���\0�~\��\n��4��Ri^̣��\�\�\��\�,\�#�\��{�2_\�b��)6\�\�	�\0GT��g�\�o\�d~O���%PY��|��.\�\�̙�͚5K\rP\���\�駟�\�w\�}\r�gϞ�͟?�7\�4m@\�E\�uttd���Yww�\Z\�\�\�\�j�\�~������7\�dq@ME�\'�T5�/u~\��‚�M�Vʪ\Z�;�\�5+\"+d%�\0�WQ[_[�-_tK�t��\�\�1\�\�\\	= W�׵yu�\�\�	\�S�\�-\�\�5+t%�܄\�ʥ�\�x}�j\�+t%���\�s��\�Ћ׬Е\�rz\�\��q���Y�+�=��0\�B/�\�\�/�\�5+t%�܄޲S�\r�x\�\n]	= 7��q��\�\'\�i3M�׬Е\�rzQ+��\�>�Ӭ̕\��z;vd\���\�\�4-^�BWB\�E\�\�W^\\p]���\�5WeQBܡ�:�5\�\�fO?0�\��\�xO�Wק�0\�B\�\�;]�z@nB\�`��u}V�J\��&�\�i\����z��	=�� ��z�\�SJ\�BO)�=%�\0��z\0BO	=\0�W\�JCX.c!�\0�WW��\���7�\�g>�͙3G\�	=@\�\�\�\�\�(?�\�\�>&�� ��	2u\�Qo>_�vm6r\�\�\��\�y�׾��lŊ\�ƍ\�\�>�O�\��\��1\���_�~�\�\�\��^�\�G>�}\�C*?�<yr�\�\�\�x��~0���?,�\0�ޑ	�y�\��x\�o�\�\�\�Z��`��\�\�g�-?��\�?_~��������\�/?��\�\�c���@��\�o�<���+;��\�ˏ\�\�-[ʏ��\�\�\n=\0�wd�\��m\�|�\�\�|=:��\��\�w���ڲe\�ʏ��o��\�\�x\��z����/��<m	\�g�uV�\�I�\�?\�u� �H�w\��\�+_\�\'��\�\�߿6lX���./���\��\�>\�\�;\�,��1?�я��E\����?�A\��#z�Y�\�c�-?\�;��o�\�q\���\��6����\�t\�_\�\�gE�\��o~򓟔�]u\�UoN�\�@��\�;\�Y\"l\��������8`e�\�\�\�L*7KV~F�\�Ӿ��/�\�\� �8u\"z�\�q@L<�\�\�zJ\�=%�\0��z\0BO	=@\�)%�\0���\���RBzJ	=@\�)� ��\�zJ\�=%�\0��z\0BO	=@\�	=%�F\�w#U���{=���V\�j@kժU��\�\��\�\�ܹs�hoo\�]�n���\Z���={��T��\�5�VF�\���o�\�O\�\�T*�C�n�0\r:�覦&��\0ȿ\�Ç��\��!�9�b�\�k$\0Ƚx��:=�@C�\��)�z�\0�\�\�\��z��\0�W*�NH��\�H\0\����z;�\0�W(NJ��\�H\0�{)�NI�\�H\0�{�R\�\�b����\0 �R\���:�.#@#tz�S\�m1\0\�^�P��o��\0�B\�\�z�\0�\�\�\�<�X,v\Z	\0r���\�Tk�\0����\�)�V\Z	\0\Z!��M����\0�B\�z/	\0r�T*ݜ\�E#@\�.\��T\�\Z	\0\Z!�\�,�K�\0�W(�T*��4\04B�7#\�\�F�F���1\04B\�\�I5\�H\0\��7?�\�H\0\����X,>`$\0h�\�{<f1\0\�^���-	\0r�X,>\�\�\��{#@\�\�%\�\�RdF�܋�M\n�\�	\0r�X,.onn�f$\0Ƚ��l\�H\�H\0\��ު\�\�]m$\0h�NoM�T�\�H\0\��^g\��&\Z	\0\Z�\�ېj��\0 �J�\�\�TmF�F\����\�m$\0h�\�\�J�}#@�6\�S��;!ձ��F�f�@��ť)\�~�\'ծ\�\�\�\�\�:\�h0����|\�\0�W��w)\0r!\�S�^�T\�\�\�\�ݞ.�\�I\���~Bo�.�\�)\n\�\�O\�\�dd\0ȥr�V޶�C�mT\0ȥb�xFž��\Z\0�\��\��ַ���F�܈͗)\�.IՑj}�\�dI�1\�\�\�\�\�ij`ЉK�� kOA��\�NL\������K\\�\�(P��]\n�R\�e�v�\�B�\0u\�SN�j\�ж\�^�G�\�n��\�\�\�G\�V�^�m߾=񳳳3�\�_��\�v\�mY[[\��N\\\��:]\0\�F�\�\�\�\�SX]tQ9\�v\�ޝ�ŋg\�Ǐ\�;�z\�\�O2\�\0\�E\�Un\�L\�͘1\�\�no<�@\�\�ںw\�\'�\0��ؤ���rS\�/��	�\�߲s\�=�-�M�\0\�D�R�//�\�I�y����\�@\�\�Q���4�T����o�M��}\0�&\�ë܏��R\�\�ܿ�U-\0�\"N<�<Js\�Ν\�@7n\\\�fΥ�\0.�\�U^i%NK��%K��\�\�-���4\0Pq\�@\��+�sj¡�<�=�\�ii\00��\\<�<7\�tSVMӧO\�e\�,\r\0:�\��O\\Z��bSj\�&\�͖\0*�͛��֬YS\�Ћ��*oKdi\00Нޛ�\�w�\�j�\�W��-\r\0�z� �\0\�\���f�\0�\�\�9z��	=\�\�\�R�ue��\�r\�y\�\"\0\�\�ތ�i��	@C�{\�U\�e�\Z\�\���\�\�e�\��\��\�u?=\0\Z�\�\�֝\�O;\�4wN�vZ[[��\�m��\�ytG���s\�9�r�\���F��+\nߩ\�\��w�:�\��*/~O�>�@-�\�G���:c\�\�\����ڤ]\�$�\r@\�_\�Q��/>\�\�&L�𖰋\�x\0\�[�}�r_\�&ϸrˢE�\�\�\�\�Hu��}v�q��\�\�+�\�٤	@]��L*�\�<\�z\�A+\0Խ8�/ui��r\��T\\i%N<onn��Q`P�K�\�Vgt\�+oKTq9�\�q�踖�K�\0\0\0\0\0\0\0\0\0\0\0\0\0�\��\�F6��a�U\0\0\0\0IEND�B`�',1),('2',1,'/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('20002',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','20001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('20003',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','20001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('20004',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png','20001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0F_#�\0\0 IDATx^\�\���e�\'p\�_\\5�1�5fcܻ\�cט�WmbV7��u��9sf�@k墝�W#�8(z��{�S\�\r\ZV ���\�\�L�]�!(\�\"R@�����ҖN\�\�\�w:�{晙2@\�}g\��|�o\�\�}\�{\�iN\�\�\���\�a�\0\0PC�}y\�mC#E����:��\�\����\�=\"_����׍��\��n\�\\\0�X�v�;��ʆeq�9�����z���\�\ZX;�kpp��|\�lt \0�f�\�\��\���\Z�4\��=\'\�߻��k�\�\�u\�\�ft�\�k֍>\�Z>uV�\�q�J�\�֎\�_34�\�\�1�\�\�~\�΍\����,�t>��u\0��\Z|Q^bk֍\�N��F*��\��=1�[3�\�Qh��\�O���]^�ж\�c֍|/�\�\�_�v\�\Z>&\n0�\�Δߜ��\�/M�ە��M~5\00�RA}2\��Z�[���6ݓi�UFy�\�m�\�\�車;0�[;|���^\�G�~ޖJ\���\�#3\�?\�\�j?\0J3���\�\��5k�\�Qbũ\�m\�9\�״Jj\�8�\�\�\�\���\�:k���\��\�I��$f|��\���k�x\�#\�\��\�|u�}\���{\0P�T@{S.�\"�rJ��\�k����z\�\�\�\rm��=#kڿl�\�\�c�S�FbFW��x\\\�m�sp�\�%:�v����v\�\�(�\�C\�\�\���\���v\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����\�c�F�S׎��/;\��F7\�c\0P���\�kG~�~nɗj�׍�\�c\0P�\�C\�\�\�,\�S\�v�\�\�16�ѣ\��>��4���\�V~\�ǯ������\�\�n<3\�O��\�\�R�\�o/K\�qik\�k���\0P�\�\�l82О���\�o&n�fak�F���v\�\�Qt\�\�tc1;L����\�\�\�|u�}Q|�u\�\'䣱ݴ��l�܁ݨ\�;\�\�\0�I���\�\�Wdp�\�WL7�i,O�ǌ1\n2nG!��(\�(ȁu\�gun\0\�\\\��bw失�\�\��|<\�\�\�nzG\�L��8�l��\��1\�\�\�\�\�\�\��Z�n�\�\�\�u#\�F�Nlc_\�\0P�\�\��\'���i`\�\�9QXŵ��\�tc�\�\r�K_k|\�\�c�\�m���dZ\�\�\�Cû\����ǘ��c����9`�j��o\�\0��4�{2�\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�&��8bÆ\r߸�\�?�\�3\�?�\�O�\�G����bժUũ��:~�\�\�K\�6�Y�\��\�`\�����_.�\�GR�\'�|rq�7\�xcq\�w�<�H\�g܏�Xe��p|``\��K�,9<\�&\0\�+1��\�O~rg�\�\�>��b˖-����X?\����+W\�_�b\�\���`^�\�ݷ����4S+n��\�Ϟ�x�)��R�\�ɬ�y%\�\�>��\���\��P\�ڵ+\�\�$��\�N8aG�\�<2N\0(]\���\�;\�bll,\�\�%�744T���?j\�@�R/�4c�w��-�{\�g��\��e��\0P�8h%��w�vi\�$��bŊ񞞞��5\0���ݚq�\��=he�n�馢��\�)�9(]|/4)\�i��6\�l6\�\�_\0̙\�?G\�,\�\�~\����\�[�Tz{�\�\0s&N-gZ�B��e˖�7M\00\'\�\\�q\�*�}�\�{\�l\��5����G\�93��iӦ\�===\��\�\0s\"��\'��\�m�\�6�J\��5���+\"���P��~8��7��&\0�q=�\nE\��k�9��j��\��\�3\��4q\�����y�\�]��@iN?��}U�y\�5\�<\�\�M\0Js\�gn�\�{zk֬\�\�{z\0�&\�\�\�\n��\�tF\0J�jժ�Ͻy\�u\�ݛJϹ7(\�����\�<�̼�\�T�㮲\0@\�\�v+W�\�_\�����ꪭ1\�s==\0*�bŊ�O9\�9�r�Ν;w���>\�\�\�\0T*\�Mq1ٱ������ݱ}\�CI�w}�\�\0P�\�\�x\�	\'\�\Z\Z:\�\���я~�Tx٭	��\�l6�\�\�\��3\�?T�:c�\�\�\�\�~��\0P����\��\�+\�o�馼Þ�8he\�oxכ\�0o\��&}}}O�v\�ic�\�zk\�g3\�Ë�%\�Q�Z`A�\�Y|�.eo*��g�}���\�y\\\06��WK��Gǹ4\�\�bq��(�x�\�\0R�2,Ε\'���#L�[1�3\�Υ\�\�b\0\�R�^WW\�K�q\0���\�{E>\0��w\�1Ǽ6�\�I�7~\�Ǿ.�ډ\�\�\�\�c>\0��Jo�\�xS>\0�\�l6�/]���|\0j\'��\�\�\���|\0j�\�h\�;\�\��k>\0��fzO5�\��\�\�\0P;q�\�4\�{_>\0��JoO\�\�\�\�\0P;��v�����@\�4\Z�\'���\Z�8\0\�\�\�%���q\0��Tx;SN\�\��v�\�\�\�\�\�U�8\0\�N�\���\�h|,�\�I��h�흖�@\�\�{8\�S�8\0\�N*�S\�\�\��vR\�mk4\Zg\�\�\0P;��\�o6����@\�Y޽���_\�\��v\�L\�\�4\�;\'�\�I�wgʹ�8\0\�N�\���\�h|#�\�I��\�\�\�\�o\�\�\0P;===H�(�\�i4\Z�S\�]��@\�»9ߥ�8\0\�N�\��mww��q\0��4\��U*�+�q\0��Tz7�һ2�\�\�\�\�.\�|\0j\'޿�\�\�H>\0��\�l6�\�\��vR魏]��8\0\�N*���\\��@\�\�\�\�k�8\0\�N*�\�S\�ݘ�@\�\�)\�\�Td�8\0\�N*���J\�|\0j\'.+�\�\��v�\�慩�n\�\��v\Z�\�7R��)�\�I���Tzw\�\�\0P;��\�\�\�\�;�\�I3�/�һ\'�\�I3�J�w>\0�\�\�\���4\�ۖ�@\�Y\�)\�\�\0P;\�\�ݟn6�\�\�\0P;��NK3�G�q\0��Txo4\Z�\�\�\0P;\�\�ݫ\�loG>\0��fy\'�\�\�\�|\0j\'^\��8\0\�N3I��d>\0�\�\�\�{l*�\��8\0\�Nww�1���\�\�\0P;�F\�}���v�5�\�#;\����dɒ\�S�=�J�x�ܜ?\0�Tz\�OSr��lٲ�\��g��\��\�\0��u�ٞY\0���Tp{�\�K�;_\0�Tp_\�K������\0�\�h4�\�(���\�\0P��=�<\0j/\���\�\�\��v&����\0��(ߺu\�=7\�pC1<<\\�_�^\�%>S�6m\ZK?\�\�?{\0��\�K���\�۷�w\�.�\�\�+r\����lmܸq<�\�`��(U\��\�R�\�J\�Pf۶mQz�8T+v?�\�\�\\\'>c��3���*~忠D\�\"J�\�lK<Pl�շ�\�>\�J܎�|=����\�ͦ�v>v_q\�\�g7_���c�,__d�(=�r�)�{6_1��ڹw󏧬/2]�P�ٔ\�F�yJٵ\���E��\�*7�һe�\���k\'�\�\�L�TN\�IYQz@\�fSzq�f^v\�Ĳ|}�\��\�ͦ�n�\�\�)e\�N,\�\��.J�\�lJ\��~W\�r\�g�^�Ų|}�\��\�ͦ�\"w���)�c�z\"3E\���U\�\�\�S\����^�Ų)\�L�T\�J/θ�\�\�\�M)�vb���\�l��\�\�Xzi��\�#\�\�v���\�\�ĺf}r�(=�rӕ\�3\�\�f�Y�,J�\�t�7�\�\�L�\�\�\��(=�rӕ^^d\�6��D\"J�\�t�\'2Qz@唞��TN\�IYQz@唞��TN\�IYQz@唞��TN\�IYQz@唞��TN\�MN�\'��|�\���\�\�^{m�\�w�{\����y@\�M\�a)�٬7Ӹ(=`Pz�s\���e˖\�裏.^���\'�p´3�����Oߞn�=J��қ�\�:J��_�dI\��\�_^�\�G?����\�29J��қ�\�f(��,n�\�ݭt�7\�m��TN\�M\�a3��\�{�Qz@\�\�\�6Ci���\�o�\�\�\�\�.�lƢ{�\�_޺�cǎV9\�\�Y\�Qz@\�\�\�6Q`���;8ꨣ���\�\�I\'�4c\�]x\�ū_�\�\�/|a�\�\�~w\��s�P9�\'eE\��SzRV�P9�\'eE\��SzRV�P9�\'eE\��SzRV�P9�\'eE\��SzRV�P9�\'eE\��SzRV�P9�\'eE\��SzRV�P9�\'eE\��SzRV�P9�\'eE\��v�S��\�ؘ\�*�iӦ�\�۷O�%%r(s\�]wݝJog��(U�靵q\�\��m۶�/�\�Ν;����*��\�\�/\noÆ\r�R\�\r\�?�\�\�/��_x\�~Z�\�X�x\�\�UW]5e\�\\\'��\�+.�\�)\�j��l\r\�;\0J\�l6\�L�6/KOO\�xJ\�\�\���|\02�\�>�\ng������eeIϿ/Jo\"��Y\��u\0\�yK��x\���x�R\�\�\�(�\�X\�`�\0<g�\�\�i4\Z�\�\�\�\�ʔ^\�cY\�s�Y\0\�\��\�ˏH���!_V����Y\0\�_*��S\�ݛ�W!ftӔ]g\�I\�xd�8\0xFK�.=*\��T$\�ɗUa�\�K��dz���\00k�PnKe�|�*\���2/�\�噯\0\�J�=u�B\���ǿ>_V�Tr���)\�D�s�\�x���\00k�LM\�rq>^�Tn\�S������=�1\�\�\��\0`\�R�|1ewWW\�K�eUZ�d\�\��X�\�x���\�ʗ�A�\\��ߥy*\�S�������\��\�\�\�\0`F�<~��=�\�\Z�ƃi�wy>\0\�Z�|�\�ā!����/�\�\�5\�k���/�)\�\�\�4c�)_(\��G�q\0�$�\�\�O��\����b!\�T(Q]�&�����@\�\�я{\�p�c�\�\�xO�2\0���[�\�\��\�\�\�\�\�P����\�$\�S��|�E*�\��\�+\�\�C�P\\A!�Ö|�.\�\�{\�\�XdR�\'\��b��\�|Y]\�{��\�5_�\"�\�ྔ����ؘ\'W~��>�\�`\��\�ˏȗ\�M�\�x���e\0\�\�R	\�j6�_\�\�Uz�\�\�ەn� _@��» ��\��x\�\�{N9?������*�\�X�\��\�|Y\�\�{����2\0j(�\��y�\�ؚ�/��\�L�\�\�\�\0\�LWW\�J�������|\�b�\n���7\�\�\����2\0j&���^�\��d*�W\�\���\��J\�7�8\05\�Y[����\�\�ߦ�>\�\�\�\0�H�\�{ki\�wz��\�\�{�S\�\�|��K��?G2����%_VGq%��~�|\Z`�J%��R\�\n\��\�v�ټ\'\�\�|�Ebɒ%��\�\�\�\�\���|Y��\�l#f�\�s\�k�e\0,\"��\�ל�\���\�R\�mO\�\�\�|�E(\�\�R1\�\�\�\�zM�l�K\�kEz�\�W4\0�F*�;R9l\�\��4�}4\�f�����{챯K\��T\�\����*��O�\�M���\�\�\0X\�RA�����x[�l!��t\�B�8\0����:\�c���/ʗ-$\�=��\�˓�-��c\0�E\�E\�E�\�\���H\�\�\�\�\�\�\�\0`�ؽ�9;��7�\�©\�\Z�\�P\�\�\�\�`Zq@K\��ĉ��DR�t��|\��$Z��WR>�/�\�WRy\�H�\�\��z�I*\�\�k|4���82�\�]e\�\����E|=���^\�|\0L+\�I�8�<��\�\�\�q�����\�\�\00�T\Z�LSt��t\�ң�\�U-N&�^\��8�t�\0�u\�\'�!�\�/�\�\�|<�3�����9�g���Y��\�|�Q\\6fy]]]�=_\0��lٲ��B�=+�?\�\�U�\�l^�1�\�d\�B��O�\��|yU\�l�M)\��]\�|\0</=�O\�ۻ(_V��:~�^\�\��q\0JP\�\�[�n�\�n(�����\�\�\�媫�*N<�\�\�+������\�ԦM�\�\�ϳ�\�@\��\�/�b��\�\�\�ݻ��{�\�f\�ΝS\�\��L\�gk\�ƍ\��\�@�b����_V\"�2۶m�\�sRm�Z��\�O\�:��ݝ�\��T�(�%2Qz@\�f[zO�\�b믾]l\��V\�v�\�\�\��Tn6�����[�>���\����e��\"\�E\���M\�ݳ��)�\�ν�<e}�\��\�ͦ��0�\�Sʮ�X��/2]�P�ٔ\�-\���];�,__d�(=�rJOʊ\�*7�ҋ�5�k\'�\�\�L�Tn6�w�u\�N)�vbY��\�tQz@\�fSz�\���\�k>;��b,�\�\�L�Tn6���\�M)�\�\��)J�ܬJoϞ\����7��b,�MY_d�(=�r\�Tzqƕ?^�nJ\�˜�Ef�Tn\�\�K3�n)~��ӧ]�X\'\�5듃E\������iv7S\��\�`Qz@\�+�\�\�\�fJ<6ߞHD\������\"{�ɷ\'Qz@\�+=���\�*����(=�rJOʊ\�*����(=�rJOʊ\�*����(=�rJOʊ\�*����(=�r���\�\�}:/~�7�\�M\�����f����q�>J�\�b,���e˖\�\�7��\�S֓��\�*�XK�}?f|q���*�?��\�/}i񲗽�X�tiq\��_|qk�\�;��^����\�\�N\�\�L��eGyd�|�u�\�_�z\�1k׮m\�_�jU�\�W�r\�k�c�P�\�Zz7\�xc\��QGպ�|��\���馛Z�\�����\�\��\���\�zo|\�[�\�\�Iۛ\��\��`�׽�u��\�|gk\�;\��\��׿��\�>��)���Qz@\�c\�s�\�G\�_}kY\�\��\�1\�\��ַ���~�\�-o���gz�g>�\���\��U�zդ�\�Y`ݣ�\�-\�ҋۧ�rJ�򗿼��\�+[�ۥ�{�\�)�;�\�[\�bF?\�%չ��=��\�.k-�Y]��\��&ݿ袋�<��Qz@\�k\�E9\�ћ�~��[�*{{{[˾�\�o>�\��]\�zWk\�vi\�\��\�\�%�\\2e{{�\�w\����1������\�O�=�#HR�P�\�Zz�\�/��u����ضm[\�\�rqJ\�\�\�\�qQV�ގ;�����u\�g��o\�`��Ĭ2\�]�n]\��W��է�k׮)���Qz@\�S\�I�Qz@唞��TN\�IYQz@唞��TN\�IYQz@唞��TN\�IYQz@唞��TN\�IYQz@唞��TN\�IYQz@唞��TN\�IYQz@唞��TN\�IYQz@\�\��\�]\�[\�P&}\�ƔP�M�6�m߾}\�/)�C��\�\�\�Tz;�\�@�\�L﬍7�o۶m܌Oub���aÆ}���\�@\�\�Q�/<v?\�3�\�lN��&>[��\��ynɒ%�����\�\0�\�\�\��\Z���p��ǿ�\�h�\�\�\0P;���:\���\0��Jﭩ��\�\�\0P;}}}oO�7��@\�4�ͿM��/�\�I��\�R\�=��@\�tww�JoO>\0��\noY\�\�|\0j�\�l\�h4v\�\�\0P;��NJ3=W\0��\�L\�\�Tz;�q\0��\�\�\�5��\�\��vR\�}:�\�\��8\0\�Noo\�g�ƃ�8\0\�NOO\�S\�\��v\�,\�˩�\�\�\��vR\�\r�һ;�\�I���Tzw\�\�\0P;\�f�?\�\�\0P;i����[�q\0��Tx�4\Z�\�\�\�\0P;\�\�\�?h6��\�\��v\�L\�\�)�\�\��vR\�]���|\0j\'\�pʿ\�\�\0P;QxQ|�8\0\�N*�\��\�\��q\0��8�%f\�\��v\�\�\n�|\0j�\�h�����{�8\0\�N��,NE��@\�\�ɦ������@\�4\Z�����\�\�\�\0P;===wǅd�q\0��Tx���ޗ�q\0��4\�{�\�l���@�ރi��\�|\0j\'\��N�T>\0�\�l6K\�\��v\�,oG*���q\0��Tz;SN\�\�`A[�t\�Q�F\�M�c��v��v���7q�b��B��\��\�ˏ\�\0J\���\�\�2C\0\�F�\�ݘ];\�fs�Y\0��lٲ�\�eב���\0Z*�\��\�K����,Yrx�.\0,h\�\��R靟�\0���\���\�۝/�\�\�\�\�k�K\���\0��Txۢ����^�/�mbv7:QvO�쟘\�M܏�\�X/,\0\�{\'�x\�&�n_{w\�,\�\�\��m��_2���4�\�8�X^h\�&�c;�����\�\�\�IO*�+V\�w^�_���\�;�Gy��3\�\�x,���Ǧ<\�͟\0*\�h4NJ�\��[]+�Bk�\�3��b�x\\\�v\�4e���9�t��tI���?�\�Og]v�x\\<>�\�Q~\��JM\�\�|z��jժb˖-y�=\'��\�^\�ϮN\0*�t�\r/\n\��\�˻\�y�\�u_\�n�tqte\�.\�C5\�\�\�v;wu��\0��\�\�u~-!�7�b�����\�@iz|�UBq�\�s=he�b�\�Q���k�9\�\�q����A\�y:Jo_��\0\��\�RB|�|�gym�<�_`w�N\0\�\\\�\�8�J�\��\�\��4=�*s\�f[��s[�\�\0\��\�9p9�V�Ĺ3\�\�\�QzO\�\r\0��\��kO�\�\�e�\�\�(�����!\�Q:y\'�����\�\0���\0�F��\��X�8z�Ţ\���\0X,�<#\�I\'��t\�9#\0�\�q\�M\0�\�]�e]ea�\�\�vmP���]*��\�r==\0j�\�+����>]z��@\�/_~DO\�w�V�ZU\�w\�}yg=/���+Wv\��\�\�_\0̹�K�\�l6�\�\�\�w�f|��\�\�\�\�_\0��\�h��Ji�sWg�\r\�\���\�w\�Ҍ\�\��\�\�\r\0��B\��E\�\����l\�/֋���4[3<����{:�\�\�N|�=Τ�\�\�l��:~\���\�_<\�\�vi0/\�A&GuN��=�\�\�8h�yo\�{|�=gn�eb�Q\�\�`A�8Wg`\\�!v��\�?\�~��:�&\0\0\0\0\0\0\0\0\0\0\0\0\00_�@%hvd\�\0\0\0\0IEND�B`�',1),('20005',1,'E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png','20001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�g\"\0\0+�IDATx^\�\��\\e��qRD\n��QB!Ʀ!���*�k���HwgΜ�NYi���Zċ�xA.W\�O�(.I�H�SA\�\�򫵀X�P,�@[��,���\�n\�\������ߙݝ�=3s\�<\�W�\�\�<ϙ3��\��\�̜\�q\0\0\0\0G͹�ɠ\\�\�\0��r�\��l\�p�\0�+7`�d��\0a\�\��\��\0\"�܀=�A~�~\0@���G2\�\�\0�0�\�UX�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\05���-�\�]wݵ�\�k�=t\�UW�]vY�J��Y�f\��\�w]}�\��o\�W\\q��?\0 �\�x\��s���w\��̞=;�\�;��+W���j\�\�\�(����]�5$͙3灖���v�\0��\�w��>�\���\�k׮\�\r��\�\�eVttt�͜9�F�\0@D\��;ＳW\�\�\�?��\�GD\��\���\0@\�\�;�o\\w\�u��~��`Ϟ=vL��\�Gg�\\r\�\��\�\�\�\0D�\�\04\0\�͛���ڱ|Tt7\�|s�\�f\�aF\0\0#\��zHg\0a@�\�w\�ܹ�$���\0h �X?\�\�`t�3g\�<�J�:\�s\0\04�\�o��C\�J�Z�*\�d28,\0�\�\���t\�W����}.\0�:���D���<�\�z�\�	����\0\0\�H��\�3�!�\�����}\�>\'\0@�\�Z@�\�C#\�x\��d6�}N\0�:\�\�\�t͟FX�lYO*�\�\�	\0P\'�\Z�.�\�/��r���n��\0\0u�+~V���\�~[\�\�\�	\0P\'z=�\�\�s\0ԉ^�Q3��\�z\� 3\0h �\"X�>X�f\�>\0�\�KB6\�\�AO<�\�[|;\0\ZH�	ܨ���\�.\�\0�ҋ\�\�7�\Z �\� \��Ӌ\�\�{\�\�˗o�`\� \0h�9s\�<����l6��UD t]�����z]O\�\�[��\0�\'\0\01s\�\�/���_Yl׮]{\�\���,\0#A�J/.S\�k�^|�\�\�%\0V\�\�\04���\�Kv\�|�͡��e�]�E`��\0 �|\��\�fߙ;w\r\�!��`�\�\�>&\0 B�����3g\�<��\r�8��\nf\0\0#�\�m&�9��\�k��!=@��\�\�C`\0�)}��\�\�׋\�\�5����zE0� �^@|]\rT�ӵ�t)=X�\���I\��֏.���\�� �So\�\�b)\0p��@gg\�{l;\0�\Z\�\�v\0�4�\�l;\0���\�?\08JC@\�T\�\0p���\�y�\�\0\0��\�\�\�\�:��\0����\0\�\0=Q,�H�m\�\0�8\�y\�\'m;\0�\Z\�d�\�\0p�\��X+\0���&�/\�v\0�R�Ծd29ٶ\0 !\�#\�f\�\0�\0\�\�\�\0p@�b2Y\�\0p��.�Kl;\0��\�Զ\0 ��\�Rߴ\�\0\0\�,\�]�9�\0\�\0�tK}϶\0 ����\�\�\�v\0�d�\�\\\�\0p�@�\�y\�\�v\0�$�H\�`\�\0�Y��t:}�m\08@fo���S\�\0p���kR�\�v\0�<\�[�N�\�\�v\0�d��\���\�v\0�$^��˶\0 !�\�=�\0\�\0\��\�H̷\�\0\0H� !p�m\08@`�\��\0\�\0	��I���\0 �\�#�\0\�\0	��\�=n\�\0�����B\�\0p�\��OI<i\�\0\�\0\� �\�\0\0\� =$d\�\0\���\�a\�\0p@2�|\���gl;\0�I<g\�\0�����\�m;\0��\��.�J=o\�\0�����j\�\0p��o�^�\�\0\0\�%%^�\�\0\0\�E\�%^�\�\0\0�\�\�y�筷\�\0\0\�,\��\�l;\0��\��TB\�\r\�\0p@:��\��M�\0\�\0�	��\�޴\�\0\0\�L\�:�	t\�v\0�$��x˶\0 !p���6\�\0p@2��*�Ju\�v\0�$��}�\�\0p�\��)�ݶ\0 ��K�v\�v\0�dp�\�.\�\0p�@Vj�m\08�{m;\0�\0mR=�\0\��t:}�\�y�l;\0�_���~\�\0p�\��_�8`\�\0��,!\0\0hii+���aj��/\0�	H\�^f\�Pmmm���\04�\nf\�\0��\r5`\0\0�<o�\r�\�\Z\07Ȁ�\r�L&\�\�\�\0\0M\�\��\0�K�g\�\0�A\0\�5l;\0��\�_I\0@\rA0v����~�\�`�\�\���*J_�e˖�\�\�\�\�k\0�� �W�u\�֠��\'ؿ?UE\�k��\�ҥKI(t\�\�\0\"Ig\0:x\�A������4�2�x\�\�\�\0\�+}-��}� �t��5�\"\0\�F�!�{��`�_�;X�臹\�ߵ\�nG\0b��\��\�\�`��\�\�/���m\�g�w�\0�QIl\\�pI\0jӚGJ�w�\0�QI��\�J�Bi�\�\��\"\0\�F%!�zag\�\�_(\�ۻ^�\0�\� \�/B\0@lT�m ;�J�\���!\0 6*	�u\�Q2�J�\���!\0 6*	�\�\�/����$\0�M�\���!\0 6*	�\r\�\�S\�f��\01RQ\�\���˼�\�6\�+\�\��\"\0\�\�p!�g�s�-%P(\�\�\�E\0��AC@\�\�oY�d��ǯ.�m\�6�-���\"\0\�F�\�\��`Ŭ��\0�Q.*y�?X\�}\��\\+B\0@l�;���\��\\+B\0@l�jtE\0�\rB �\"\0\�!~\0b��\0�A�_�\0�\� \�/B\0@l\�!\0 6���\0�\r\�Eٲ\�\�z�\�g��\�??8�裃c�9&8\��\�˗�lg�\��W\��yꩧ�.��d�j�\0�\r�B1\��y���\�_x\�`\�ʕ�\�O=�Ԓ\�l��q*���I\0��Z�@wwwp饗\�\�\�\�;�Y�f;v\�\��i�n�v\�\�a�U|����3r�8묳\�\���O|\"8ꨣ�\�?>�\�k��.�(��\�ƍ\��\�\�j{\�w���-B\0@l\�24\0�m������ߟ�]�@�~�\�\�nw\�q�\�ٳs3���U|���C=�+��p(�\���6l8|[{ݺu�\�O:\�A�i��j�\0��»잞�\\\�\�\�V\�\�\�\0\�\�\�sA�}\Z\��U|��{�}u?{{�\�\�(B\0@l\�2\n�|�l�\�}7n\�X�`^��x��8v�\�n�{E\0��Z���\�׶\�\�Az\�G�&L����\�z\�\�r�\�\�\���}(w{�\�\���\�\�zl��G\��>iҤ�\�a�\�ſf\"�y�K�\�PM\0b��!�\���_K����U�E�\�#�\�}EtŊ���\�;8\�r\��\�̙Sv�\�\��\�߉\'\���{C\�.����\�\�}V�ϣ���h�\0a�\0��\"\0\�!~\0b��\0�A�_�\0�\� \�/B\0@l\�!\0 6���\0�@�E\0�\rB �\"\0\�!~\0b��\0�A�_�\0�\� \�/B\0@l\�!\0 6���\0�/\�B*T\�k\�K\0��e˖�nݺ�d0���\�^{\�u	�]�u�H����K�.=\�\�\�u\�\��Ν;Kڪ)�h\0,Z�蠄@�}� �t\�\�w�z#ʕJ�J\�FS�=�X0u\�\�\�g?�YI_���a�}}\0!\��m�%�ܭ��\��}�g---c\�6\0��Ex��0�� 8 ?\�noo?\�n\0h�Z��쳳8� /�L�~��\�\��\0\0\Z�! 3��6\0�K�\�l�\�D\0\�`�%�=h��\����\0�\�j\��Z�3�\�9v{\0@\�*|\��L\0\�\�a\0��Z��\�10_jo:��_�-\0�Aj�\r��\�\�+�\�6�|6\��y�L�=\0�jJ���~S��Mf\�h0H��\�\�\0��eFs�\�v�\"\n\0\rֈc\�q�J�\�v\0\0\�A!P�\�\��\�y7\�>\0@�4*�<v[~)��\�>\0@42�\�n\��ԩ�\0Pc�%A�J�\��u�\�\0\�PB���\�X\��w\�r�\0PCQ�N�ϒ\�\�+?��}\0�\Z�J(�\r̖\�\�\'??c�\0\05�P�|�\�\�Bs\0PQ%\�i�\�:\�\0YC`�\�\��\�\�#5\��\0B\�P\�d�s���\�y3l\0 $Q\r%p�~c(�ɜa�\0\0!�r(\����z�G�����\�\���\�\n�j�\0\0��P\�l�ty�dF�S\�\0�8��\�d2^~\�\�ɶ\0P�����<\�6y���M�v�\�\0T!N!�$^�\��\��8\n\0��ȯ8�S���l\0`�\�J��\����\�\�>\0�\�1�\�y\�\���N��i\�\0�P\\C@I<(a��G�Jq%\��u��m;\0�q�l6�\�T�����}\0�a\�=�\��_H�_�\��\00�f�N����\�`kk\�\�\0D�����e�\�\�I$\�}\0�2�)t\�Q\��I<c�\0\0e4S(	��\�a!��\�\00�-�߯O���\�>\0@�f%!p�\��)S��l�\0\0y\�\ZJ��\�R�m;\0 ��C �H�O��]�\�=n�\0\0G4w(	��\�o\�M&�W\�>\0p^������\��A�\�>i�\0�i.�����C�\�4i\��m\08˕P)V��\\\n]q\��}�7\�c�\0�I.������\�}\�d�b\�\0\�q-��\�7H\�\�\�m\08\�\�P�w/�\�f\�Q\0Ns5t\�Q\��ߖ\��Ӷ\0�\�j�������W��\�\0\'�J����H�N��b�\0�\�*�L\�)�\�>V\�B��\�yk�6\�v\0hj�@���\�/�}\0д�\�d2\�\�\�\�\'Ap�\���D�L&�\� �:\��@\�!J\�k�H�G��(\�����ڼd\���\�I�ӯ�J\�m�\0�i�K$_\�\�\�5\�\�>\0h\n��\�\����G4-B`x�\Z��\�\�E\�l\0\�\Z!0<]nZC@\���@��\�\�AzXH\�>\0�-B�r��~P�\�>\0�%B`d�+�R��+��\0b�9y\�^ғ\�l;\0\�!0r����n���}\0+�@u\�u;W�O��}\0I�￫��P�\�\���<]rZ�@���}\092hͱ��-\�\�\��Ӌ\�\�\�K/Jc�\0 r��\r0��^�R/Oi\� r��\r0��^�^^��z�z\�\0�Sn6�,`t\�\��W�+��m\0DJ�\�\0��ѓ �I^˃\�\�\��}\0)ųf\��<\�iy=\�f\�Q\0�V<`��G�\�>\0��\�l��ctt\�Q=,$u�\��\�(\�l;F/�L^,�m�\�m�&�\��\�\�o|�駃ŋ.��(}\�-[\�+?���qH\�#!�/�\�~\��hb\Z\02x[�n\rzzz����SU��v�\Z.]����B�}�\�@�\�e�\�m;�&�3\0�\�FUW]]]\Z�\�\��G�\�\�C�@�\�\�\�\0\�+}-��}�\�\��O\�O$��\�Єt��5��s(�	\\%!ЛH$ζ}\0�L�!�{��`�_�;X�臹\�ߵ\�nG\�?�\�O�\�(\��*	�]\�nV�in���Pڦ}v{׫B@Il�Zm\�4�JB`㚇K�P�\�<R��\�\�,!�+����_\�v\��IT/-�����P\�g�w��%�\���K��@�$V/\�,��}v{׫�B@y��]ZB~~\���9B �j�P\�Jlc\�Q�\�T�m ;�J�\���W3���8\���;\�l��$\�-�E\�\�_(\�ۻ^\����u�J�\�\�\�>\01UIto~!X�\�5%�m\�g�w��5�\���+����}\����JB@k\�s�����\�\�\�%Ap�A+�M��ط/X��y%!�m\�W��\�\�\�!�$�Ɋ�@.�\�.��$\0\n�}�5<�\\����=\�\�#a�\�#����\�߲\�\�\��_]2�\�\�mt[f�\�B��S�~ZO$�0��\�\�B`�w�����r%T*����8*�q\� ʅ@%\��+��ݟk\�R(	�\'dF����\�X\� \�ʅ�\�GZv��k! \�H�\�y\��@ĕjt\�`1mڴS$�K\�f�\0D!~�*�N_�g2\���(B �r5���OeFp �͞n�\0D!~�\��J�Ŋ�@\�\�!\�\�\�2Vf\�J=e�\0D!~�*�ɜ�\�Ȭ\�Z\� B���\�\'0CWM&���}\0\"������+�N�<���@�6de\�ng�xۣ�:*?~|�x�\�\�*�J�E$!�Nj�m�\r�B1\�A�x��k\�\�~�0aB\�vq,B` ]qTB`�\��@�\�2����K/�48\�c���>:�5kV�cǎ�\�\�\�:#\�߷m\�L�6-w�okkk�iӦ`����\�N��\�N�\�\��\�{\��\rv\�7n\\\�9\�\�\�v[\�>?��\�s�����%\�H�(\���g���9\��h�Z���ڦ����ߟ�]Z��ʕ+s�O�81w[\�9\�nk��U�r�\�K_\n\�|�\�\�利vZn�\�O?=w{\�ƍ�7\���.\nN>�\�\�\�\�w^�\�\�s\�\�\�>\�S�/��\�oi\�\�\��C��,\��Aj�N\\\�zzzr��k[���:묳�+V�_q\�w\�g\�n/Y�$��3\�(y��\���� w�0{8\�\�.\�FS��\�<\�[(���8\nDD-C@\�h[qw\�q%\�_~�\��\�n��}�ٳg\�����,\�\��\�����\�ןw\�qǀ\��\�3�\�&C\�G�H��\0\Z��!P8,S|8Hq��\���N:)wh\'�N\��~�\�_>Tt��\�\�-\�G??П�\�w_\�����믿~x[�}h\�9\�s�m4\�P*!04	�Su}!	�[m�:�e\�\�3f\�Ƚ3\�\�\0\�\�|0w;�L]]]�\0)|��\��u�\�\���Gydn[��\��\ru-�u趷\�rK\��/�\�\��߳gO\�\�6\�\"�\'�\�늣m�@�Կ���\�n\���\�\�O�}\0\���\�I�Mj��:\���B �\"*�+�Jl�Zb�\0\�!~#\�yޙ����}\0j�������?����@\r\�!P�	���1�H$>`�\0\�!~Փ��+�筷\�\0j���\�\�,@B`�\�\�l�\Z \�/B`t�\�\������e�\0����ѓ��\�jmm�h�\0����pH,\�s�\\\� $�@�E�FW\��}�\�@H�����+$!p@\�\�\� �@�E�KB\�>	�*\�x\�`������w\�\�$��\���J�+pQՕ����@8<\�{R\�@[[\�\�m��,[��w\�֭%�U]��\�k�K첯3*�H$\�+���{2�\��@�d&p�ҥKuuubFP}\�@`ѢE%:\�\�\�\�\�\�\�\���8\��t\�\�w�z#��ڶ������Ee\�\�\�?*�\�]R�pn\0�\�:;;ߣ!`\�\�<\�]�g��\���/��\�:::�%����.�KI\�>\0\�\�\'\�)�L^�_��\��@N6��0!\�|<ϻ5�l\�\0�M�2\�d,\�vė�$\�����\0\��cd� �@�C�UR=R��\0PB�:H\�ߤI�\�/3��R\�H\0�j���\�\�\�	2p�\�vć\�\�d\�\�.�z\"�x�\��A\�ե��\�d2\�\���Mn���\00$y\�x�~�ܶ#�\�\���;(!��\���\� r.!?�\�}K�*u�\���\��nҶ#�$\0~� ��+m\0�H2���(l;�I��u\�&A��}\00b2�|���12�?-���S�N��\����\�\�\��b\��ȟ�z	\���#�\0��\�0��e�mG4\��x[\�M�(�\��Q���M�Ƕ����\�\�Z�KB\�~\0�L&#o�mGc\��\���-��\��@h|ߟ*\�ێƑ�\�=�[B\�\�\0���\�2\�\�\�h�t:}]>\0\�\�>\0��\�g�mG�\��\�T�Y�Y\�\05�L&g\�Wm;\�K���8�\'\�\�>\0���\Z4\�m;\�#�H�W�k���.\�m���\�\�\��wm;jo�\�\����K\�-�ֳ\����\�{Rݶ�%\��\�\�g1��liik��.�\�\�\�@��mG\�\�k~��~�e�\0\�J����#l;jC^\�T�\�|\�\0u\'�Q�\�Vێ�\�+\��\�l\04�\��\�ˠ�Ŷ#\\�\�ݦ ����\0\ZF��6\�v�G\�qy�\�ݶ\0\ZJ��d�\�d\�1z���\�K\�\��,\�\0\r\���Oe�zöct\�\�\�O\�p�\���iӦ�b� d��E\�5ێ\�e�\�\�\�5ݮ�k\"�x�\��Ȑw��\�l`�mGud\�?Wj�����cl?\0D�V��xŶc\�\�\��	�^y=�}\0I\�d�N]���cdd��v��+�?�}\0Y2p\�-��mG\���k\0̱}\0i2x�F\�Eێ\�\�L\��zH\�>\0�<\��~+�\�jێa��\�\�\�������\02��N�\�m;�_��\�l�\��:�\��ؐ�\��U�\�\�_�zuKm\�\�l?\0Ċf���mG)]�AfN{�^\�%!l?\0Ď�#zl۶c�D\"�ey�J�\��@l���@\�\�>m\��/2�ϔשOO��}\0k�\�V\�/��䵹A �N_m�\0 �d�[�\�Z�e\�\�o����\0��\�yO\� ��mw���Oꀼ6��}\0\�44\04l��ZZZ\�\�\���\�\�\�\�\�	�\0��v�Xh\�]�\�f?,�\�[�l�<y�m?\04�V�\�#�\�w��\�_g:��\0Д�\��5Q\�\�d2�9y\r��?��\0p�^K��m�+��?�\r �\�\�>\0hz+}G��%�\�9\0R\�\�>\0p�����\�\�N�\�5\0\�o�i�\0�����\��f&\�Ru= \�\0N�X#\�|\�ތt\�O�{��+����N��\0\�	�]�PT\����s�T��)SN��\0\�$�^�\�ݶ��\�տ|\�\�!����\�X\�\0Β\0X\'u�mo�\�}R��}\0\�\�\�1�\0�&�\�+ͺN��m��s\0���\0TD�H\�j\�\�.�L^!������\0�\'\�\�7\��8ӿG@\�۶\0PDf�\�ݲ�\�C@�7}\��\0y׼)�N\�d\�ch�\�s��\�\�d2\�\�N\0@��M<�Ӷ\�I\"�x�֒\�>}��\�l?\0`�ιKf\�\����6m\�)2��#�qҤI\��\0�!\�\�U�Ӷǁ<\�K�H��\�%!l?\0`2�n��\�u�*uPꏶ\0P!Dߖ��m��d29K�s_:��g�\0\0# �i�\��l{T\�\�\Z\0q.\0�$Tߕ�cۣ\��\�\�\�\�+\�׷}\0�*Ƞ�]꛶=j\�9�Yj2����\0��K,\�1v\�---cS�+��x\�\0��\�:öGA6��p��\�K]�\'O��\�\0����e&p�mo�L&s�>7���\�{m?\0 2\�\�J\��Fjkk��<�RKl\0 Dz\�uy\�\�\��F\�Y��}�\���\�\0�Lܞt:=Ŷ7�<��2��I0]k�\0\05 \�>y�=ٶכ<�;5\0\��\\b�\0\05\"�\�~�	|Ŷד<�E��\�\0�h�\0\05������m��֏�k�\�i�y�\�\0\�X>>k\�kM\��\�[\�ߖ\Zg�\0u �A�?c\�kI\��Ds�<��\�\�~\0@�\�@\�+u�m���S�~Z?��Z!7\�\�~\0@���\�\�	�*y�~@\�\��\r�\�\0\Z:��w�\0Pc�3qK~�\���A���T��`n�}\0�:�w\�\�\��_\05�Ⱦo\�\0H\�`\�j\0hj�D���\���hI�<,�=(3�m\0�dP~\���!d��1�ϕ�\�D\"q�\�\04\� ��\�f�&Mz�\�\�\r	�w\�究\0\�`f6\�c�����\�\�\�\Z�\02Xg���j��\�@�\0�{gg\�{l?\0 B���@g\�\�J�&\�磶\0As\�\�{0\�w�٩����\��\0�k�رc�i;*%\��� 3��l\0 �t\�\��}�爃@���z�tyJ\0��\nP�\�\�a\�\�\�����^�\00:�\r����\"\����\�y;\�\�\�?j�\0\�5\�@?d��\�d�\�&��-zQ\�\0��!�\"e�\�\�?J\�e \�\�e!��\0\0\�Vv`\�e�y�@j��\�\0\0Q7\�\0(\�\�\�c�\�=�P	��\�\0�h�6\0rN8ᄫ������ԧ8\0b\��^\�W�\Z6\�u}lw\�q\�\�I`U	\0��\��\�Rzv��,\�\�\�\0Q\�l}g�{�\�Aq\0\�WE�\��\0���\�r|q\�_0\��\0\r6\�\0=\�@�+��k�P0\�\�\0\0\�ҁ�\\\�7��\n��J\0Pc#�\��H�`��\0ىG�ĺ�H\�! ;\�\�#��Laj}\0�\�;rf\0\�d*�\���T�>\0�N��\�\0\��&2\�\0=X\0p�\0\04�r5g�C\�]<��������\0D��u@\�w��@�\�\�\�\0��G{\0@�U;�W{?\0@Čt@\��\0���t`�t;\0@\�7�\�\0�����\�\0M\���6\0�\��\�r\�\0\08fv*�ҳ�	\0\0pQ>\0\0.\"\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0�a�\0\08�\0\0�\0\�0B\0\0F\0�\�\0p!\0\0#\0��￫��P�\�\��\0���s\�oK���\04��f\�\0�\�\r5`\0\0(7`\0\0�(7`\0\0)�\r0\0\0\�\��\0��\n�\�\0hB�LƓA�T�\�n�C�\�@o���/\�\�\�}\014}��\����\�\�\nK�_����\0D\\{{��\�d���\�\�\�W[}�ݟ}\0@���NL�\�{\�>s\�\�`޼y�3\�<��\�Awww���\�\�v\�\�\�\�}�v\�~\�c\0\"\��\0}\���9sr|ooon\��n�\�\����#��>ݿ}L\0@\�\��\�d�?����\�O\��)\n�C\0DL�\�\���Y���k\�\�q�*�\�_�CC\0��m�g\0:`o޼َ壢�+�\�|X\0�\�\�)>\��\��\Z\�ǵ\�\0PG�=�⯁\�1�Z\��\��8�\0\0\Z(\�\"XnP\�o�T�!p�t�\�[CK\�s\0\�I�\�L`�Zg=\�\���A��\0\0u�_(7\�	^��\�\��P\�ZC\0\�\0Ň��L\�z\�\�\�\04P�\�Ϻ\n*0���\�s\0\�X��\�\�@�k�ԓ>^Q\�\�\r\0Pc��\�\0\�\�\�bp���W���\0j�h�ct]?�}n\0�\Zc&\0\0K�\0\0�+ŷ�\0�])\�\0\0w5�\�3f\��I�v\0����P�V�\�w�á \0�]\�_\�×�\�z\0\��z^Y��B�\\Y\0\"@���*:g�V\�\�\�\�(�p�a\0��\�\�։�\�>,�A֌@�S\0�8�x�9\0\0\Z\��2H�ް\Z\�c�\�~X��\��\��\�\�\�\�\0D�\�\�3-�֐~��\�0\�\�t{�-�\��\0\0��\�C5��\�\n�\'�陾:�\�\�?�E\���\�\�v\�/>��vs\0bB?�\�kh����\�\���!0\0\�P�<�%��3�+,\�~	\�\0@�ȯ5�����\�\�\����\�\��%�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\��?�cjg���\0\0\0\0IEND�B`�',1),('2502',1,'/home/czf/桌面/stconline/server/target/classes/processes/Entrust.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2503',1,'/home/czf/桌面/stconline/server/target/classes/processes/EntrustProcess.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('2504',1,'/home/czf/桌面/stconline/server/target/classes/processes/Entrust.Entrust.png','2501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�g\"\0\0*�IDATx\�\�\��\\e�7�\�*��Km�ReQ�JQEaY,��e\�.�ee�L�tO&��Q \�x\�2K��P�B��*���P(���(�	1�bH !&$!$!�@r����u�\�}.\�}~���z����\�93\���\��!C��<�\����Oy~\�\�ny�<�hʺ��?���/��ϻ2��kϋ\�D���\�\��\�Ϟ^\\���mʿ7d����yC\0h,�\���\�/�ۉ\�y\�Z�/��Z�|�~fj?�\�\��\�t\��՟;ss�OK��K\���vx\�y+��\�\�\�mɯO���\0\r\�<�v\�g����-\��n?z\�m�_\�%4\�ImFj?�\�M/�ۇ.�\�\�E�\�𼱵\�\�M\��T~���6���j4\�(\���MO\�\�\�\��̆جs{j�I\�릭^�n��\�~2oKl\Z�6�\�5\���X\��s�?��>徵��jAr\����\�\�ڈ 6-��Qq�xl\��\�\�׾�:�?Ě}jǤ�\��\�:��\�EG~Ã�gNݔ?��6\��c;>�:�\�\�dt\��.z6n�;\�\�*\rЀ������]��<:�?��?{\�oW�������_�\��kϻz�k\���?�l�&6��\�O\�����\�\�\�\�H�gg�\�K�[U\Z���N��\��\�5�Y�=�\��sf-ϟ�\��\��\�\�6k\���k���\r�u�\�\�\��\�x\�Ol��{�a�}&�F�\Z+\0ڪ�~�\Z;o\�\�UO\���\�vdj���ѵ�\���ԎJ_̩>�\�\�>�{�;��0/\�/O�\��\��\�>�V\�\�\�_��g\�1*\�X!��կ?�|�ϽwM�\�w/�\�\�߮~\"O-�|����\�0}��I�[��\�.�\�\�82��\�k�}t\�\��\�\�\�Tk�_ D\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\��a�\���o�\���&M\����=\�\�\�\�G��wvv\�_�\�W�	&l��\�_\Z;v\�\�T�,[��\�\�[o}�+_�J~\�\�\�?���Gy$_�|y�q\�\�<l޼9_�re�\�c�\�\�v[~\�9\�\�cƌ\�:~���\�\���\�|k�GL�6m��矟�5�|\�ܹ=��ޚ?~�F\r�\�g���Q\�\�*\n\�Dk�\�^{\�\�q\�\�\�s\�\�\�ĳ\�>��;6���rWW\�a�\��֭[7v	�u\�]����\�y_�\�F�z\�wޫ64� \�\�+�\�\�z뭼�\�x\�1\"xe\�С��6@�}\0�	(\�\��#\0j��\�|\�ȑ�U��\�N\�\�\�W��v�i\�s\�\�Z.�ǩ:@�\�@qP4bgqGG\��\0\Z@����K/�t�#\�Q}�Agǉ`5\n�y\�g�4x\�Nb�A4y�\�\�ƙ���3xW����dYv��\00Hb.��\nb0\\}�\�o�1b��\00Hb2��h0<��\�o�Xb)\0��\r4&��W�ޚB�\�R\0$1\rtm6Ё\�\�TԖ� �Nx0	�At\�g\�H`�\0D_�\�\�m��ʕ+7\�\'\00�.�\�\��::\���\�_\�\� �At\�%�,��&L��\�y\0�h\�ر_�k\�\�1m�3�?��\�A�gώMA\�l^x\�W]uՀ��\�ѣW�E�\�\��\�/n�?�����\�\�1\np=�1f̘	qa����\�o���R�lve1�s\�9\�,��\��s\'�\��+�,[�\�\0\r&vҦ�\�n��?�`\���\��\Z\�\�\�\'\�h\� =z�\�\�|\�;��\r�l\�y\�;��\�\0\�A\�\�ٹ�K_�\�֧�z\�w\�>�\�d\0\�Db\�\�ȑ#ߺ袋ތ0ؗMD�?���\�\�P=\n\�N`�fk\�i-��6?jԨ��&Mzcƌo�X�bK\\�6hL����� \�L\�\��\�<\0�\0ZD\�\�;S��\�\�q}༮u\�6�\�f\�T\�(F0\�\'N<X%\0\n\Z�G�>T%\0\n\Z\�\�\���\0\���v�8R{�J\04�,{�J\0P�\\\�\�\�\�v�J\07�W	�\Z1b\�[\�\�\�V	�b�@\\,�#*P\�(�J\'�@�\�\�\�Ç��J\03�\�\�\��U%\0\nhĈ�J�\�0�\0(flLm�J\03\�(\'*P\�X�Q	�b���\�\�T	�*�˯��%�\0(\�H\�\�\�\�S	�b�֦6N%\0�9X�\�7T��#�եR\�\�*P̑�\�\�&�@1C`E�e�@1C`yj��@�Q�\�J�r�J\0s$�\�r�|�J\03^L\�z�\0(�,\�V*�U��#�\�\�\��T��!���\0\��gR��J\0P�e�Sܮ\0\���)\�P	�J0\'�;U��!�Dj�V	�b����ݣ\0\��\�Y�ݧ\0\��?���\0T.�g���\0A�\0\��ɱIH%\0��\�\�a�\0(�R��\�r��G�\0(fܝB\�q�\0(f�*���T���,�ň#�R	�b��\�R\�S	�JpkjO�@ť%\��*P\��A\\l^%\0\n�R�ܘe\�B�\0(�4\n�>�U��\�\��\�)��\0T�T�ʲl�J\0s$py\Z	,S	�b�.I#�*P\��(��J�\0(f�O!�J%\0\n�T*]0bĈ5*P\��j�\\~E%\0\n(�\�K\�U�\0(�4\n�Rj��@1Gg��N%\0����W	�*\')\�P	�b����Q%\0\n�R�|>˲M*P\��l\Z	t�@�\�\�SRlV	�b��\'�\0@A\�N\�\��=�%*Кk��\�)J�\�i*P\�\��bhaY�M\�Utttd*\����u���\�L$.\�1\�\��*P� x�.\\]�HҚ���Q�8(\�h@%\0\n�T*}[\0�<\�Y�p\�ٳg\�S�N\�\'O��\�G�2eJ�\�CmM\�FU@ӈ\0�9sf�r\�ʼ��[;��jժ|��\�[S L�4���\r�420\�5\�b�λo[l�4�\�t\�B\0�m\�_]�/|\�\���)�\�\�\�\�O�/��uk_\�\�\�?!\�\�on\�\�xL\�/��%��S\0\�\�\���\���\0\�\�!�̃��\��\�t�B\0h\��7y\�.C \��@hB\0h\����v�_\0-fݰ\��\�t�B\0h\�X�\�\�|\�\�)(\��\���\0\�\�!m\�\�?\�)\�>��\0Z=6m\�<|\�Λ�\�}�_\0-\ZqF�s��\�\�>�x\�Y\�B\0h�Hk�\�L\��|\��]@�\�s\�FB\0h�\�\�ڿQ�\0Z8�f\�w�! �&��\r�ZB\0h\�Є\0 4!\0M\0B@�Є\0 4!\0M\0B@@�B\�\�g�͇�?��\����ޛϝ;7?�\�#�\�g_x\�������_���1\��?�\�{����5ѹ��\��|\�\�w\�}�\0\��yժU\�:\�\�d\�v�\�\�{�x^�Gϵ\n-\��~O\�!ϻ뮻�\��\�q\�=?\�\�c�\�r�\0����Z��Z3g\�\�O8\�\�\�\�\�̙\���Y�fm�oÆ\r=��/\�\�\�\�7߼\���\�\�\�	�\�����Z�dɒ�I|�e\�ҥ\�}��7\�O>�\��\�I�\�\�~�\�u?��\�\���/��Ϙ1C\0B\�@B :ܸ\�k�\����q\�=���\�o\�|���F�\�_\�曣�:j�ǎ>�\�\��\������\����=�M�:u[�\�m�C�0\Z3fL\�}k׮\�uTS{O#@`{\���\'��SG�Ӵ\�\�\�\�W^y\�v�\�)\�;\�\�\�\��}\�c\��YV�X\�s[?�\�݈E\0B�C\��@O�\�[\�\�\�߾ˀ\��\�IB\0{\�b;����\�6M�4i\�\�g�y\�\���}WWW\�H��ö�C>�\�{:\�w�\��q\��\�ccǎ\��:\�=��>�O\�˖-۶\�z\���\�q_l\Z\�-\�\�cs\��\��>!\0��\r�\�8k-ֶ\��m�c8v��v�O��_{�v�\�iGHD�ԇK�\�I\'��\�kFh�\Z5�\�5c\�n\��\�E\�Ϝr\�)=��9{;\������N;��\0 4!\0M\0B@�Є\0 4!\0M\0B@���\0! \0��\0B\0@\0! \0��\0B\0`0\�\��:n!\0\�̙3��\\�R\�\�Gm\�ҥ�St�\��´i\�.�>}�֗_~����믿ާ0eʔ7S�\�/h\Z�Ӻ8����\��\�F�ѧ���9rd~��\��\�kv\0�~!\���!^�\\.��T*7:��(HdYv_�n��0\���\�#T�\�C u�\�և@]ےڔG�<@���Yg�u\�.B��ʹ��C�:\Zؼ�\0H�mIm�\��h�\�]��\�8|��O�<@k���^\�M;���;��1\n�T*?Wu�����ê��\�\�.��\�(\��\�#����\0-\�\�^�\���4�(\��V�eǩ>@��n\���\�^u�(@C 9(�\�˩=a	\0/j\'�\�t\�Y\n\0�\�{�\�J�\�i�@�B ����bD�\�{-\r���@5\�ϱ<}y�%P�=z��\�r���-���@�T*\'\��\�v��P�\�\�\���d\0\n\�\�sgjoĴ�@�B���Ŕ�@C`ذa�ǌ��\�n	,B�T�T\�Ȳ\�lK	�`!R\0\\GuttkI,B�\\��\�Z3�0&N�xp��+Ө\�1K�`!:;;\����Ֆ@�B tttd\�G�Yj\0��e\��\�\�\�5jԑ�@�B�\Zs\�g^6Č�\0\��ꌣ��\�}��P��~\�\���}\�(X�,\�Ώ\�#G����P�)\�Ja����\0�\�\�_�\�_,I��@gg绫3�\�ji,B�\\>�zE�/X�\0�P�T.I�˛mmm\�X�\0�\�\�23�^ioo�%P��G�,[��\���,@�B �xlJ��,]���@(�͖��}\�(XT�\��u�~�\�ﱔ\n\�\�m^j/Y\�\0����w�\�o]�e�Y\�\0�j|8f-�JX\�\0�\�\�86v��G,q���@H#��\�\��\�SO}��P����f(jČ�Y�mJ��O-y���@H!�q�T*�a\�B�`!P��/KaSK\�/\0\���g��ƌ��(��q�\\.�N��G�\0B�����>X�q�J	�(\�\�_�\�*�\�g�5\0B��J�ҏR6�q�e\��Ԗ� \n�6\�h�\\�W5\0!P@\'Ɖd)��\Z�(�R��\��\�NR\r@�&��qV.���\�<��(f���v�j\0B��\�\�\��5N$K5\�T\r@�>W�qŮ\�\�q4&�S\r@LL7!a�\Z�(�\���b�j\0B���\�ű\�X5\0!P\�z\���\�!���b\�\�8�L%\0!P@1�DL+\�K� �Y��b���pN5�f\�VD����^��NL9ASP�\�!й�Ȳ\�b�ڧ �7.F�Q\r��`\�nB`\�СCQ�}���\�S�\�ԣ��V{�\n�@}�_w\\�^5�f�\��\r�7\n\��J\�\�G+�4\�h���>	��R-\�\�\�\���j\0�ˌ�^\n\�G҈`�G�F\�ή�U�o\�\�8:K5�F\r�\�0\n\��=:6�v�j\0��\�\��R\�8�,\�gT\n&\��C.\\�d�\�\��ԩS�ɓ\'k�ѦL��?�\�C[S��IC��)6uvv�\�H�̙3�+W\�\�\�\�\��U�V\�ӧOߚaR��_R[\�\n$F\0�o� ����o�6\�h�T�\�Dl\�y�m�\�C\����e\�G�\'���\���[\�K#�R�\�\�\��a�! z\��W�\��q>\����:\�\�\�^TG��q�@O[���|\���\��\�v-\�\�t��!��K�\��_�%��S\0\�\�\���\��[4b\�\�r�ܝ\���@�C\���{�!�\��[3���\�Ŏ\�\�\��[��!0o�\�]�@<�\�o\�Y�M��%\�\���ǀ�\�\�\��\�8\n�8\ZhW!�\��[?b\�\�r��J\n���k�`!�`\�\r��xL\�\��!\�\�ڎ�\�B�J\��9P�X�\�\�|\�\�)(\��\���!��3�>�\��{� !m\�\�?\�)\�>�~�B�\Z�� \�h\�Q(Jlڔ/x�Ɲ7��\�1�B�\Zϙq\nqF�s��\�\�>�x\�Y\�\�����ò,ې\�\�.�EЊ!�\��/�������Z�\�\�s�\n�a\�ȑ�\�R�\�?	Z(���oT jF��q4��o�	��Y�\�ݨ@L.Ե�S\0<�F��=�P�Q\�!��PkB�X!���`Y�es�GA��&�ըQ��LAН�\����@��T*��\���,B��R\\�F�;;;\�\���(�,\�KA�Ҍ� �@\r:��4\"X�\��a �@utt\��Q�\��\�@�bn:;f-�J�R\rB��R\�3�6\�pՀ�g�}6:th��\�O\��\�{o>w\�\��\�#�\�\�\�͘1#?ꨣ��|}\�\'�Y�y�\�w�\�\n��-R	h�H?��Z�*_�fM\�\�\�\�\�\�ٳ�\�Q\�?/n\��ŋp|\�w��\�/� \ZD\�8�B\��\�\�T\rh�\�A�\�\�fΜ��p\�	=��\�}˖-\�y��>�\�\�?��\��\��\�\�3������\�=�5\�\\�\�,Z�s\�1۽\�ƍ�\'�|�\�\�\�\�k�r\�)��a\�z�鮻\�\��,o�\��\�\\��r���\�?�n\�U\r(@Dg�E�]�zܸqۅ�\�7ߜ\�y\��?�\�?n\�\�\�c�\\rɶ��\�+vz,��������\�o߮�3fL\�s֮]�Ө��׬�Bj�G@\�m}h	��Q�T\�\�C\��Հ�c�=v�m����M6q��\�\�sb4��{\�=\�������\�~\�MIK�.�\�\�\�\�5k��\�\�\�\�%K�@?Ȳlr\Z\r�f\�Qh���>�\�c\�c\�:�\�&�{g�O�ϭX�b�\�5jT�k\�}�=�f<?�%\�v\�m�;\��|Æ\r�	���qty\n�9J-�\r>:\�Y�f\�9hҤI۾>�\�3�\�S\�_���m\�)}�\�=k��\�\'�\�T��m��#�\�\�4�cp\�\�5\�H��O>�g\'���}B��xo\�/��\�{�M\�O�:u[�5��ñ�v_t��\�\�\������\�\�GG\�q\�\�r�L�\�\�B\'v�F�}�G\n�z\��̵��GB��J�\�b\�\�\�U�|$�	���F\�ňଳ\�:J5@�bn\Zz\"��ӗ�!P01\�h\n�WS{P5@�bn:�z��E�B@s�\��gR5@�J#��\�C\�\�\���\Z �@����Y�-T	B��b�B\��\�~�\Z �@�J���W$��j��B`B1\�\�\�v�j�\���qA�K�\Z �@�Č�+\�\����(��W(��\�?T\rB��RܑB �����U��(�\��\�R=��|Հ~�\�븅@#ʲlZL5=|��O����3gnY�r�λ�\�ҥK�\�����\�\�\�ߖ:��Sl\�\�\�8VE�M�6\�\�ӧo}�\�u\�}\0S�Ly3�I���;\0\�\���*�\�G��\�i]�\�^\�\�f�Fm�c��?_�u��\�\�\�����ץ��s�m&N�xp��J���\���Ժ\�r~X5�\�=�P!\�\�P�^T\�\����\�0!КJ�\�qhjW�Ы\�\�\�w�֓e\���\�\0��\Z�.�~�\�\�I�\�V�h�\�7���i�~N5�݊�cR�!Z@u\'��\�6��!�(\�\�\�SO}W\Z,I\�\0\�U`�����:�-*\�ܣ��6@j�\�\�\�ߩ\"�����B�yutt�X\���D�� �IZs�pG�ͧR�|>-�7S��F5���:���@�ɲ\��\�9\0׫�\�bJ�X�T��\n�I\�s\0��\Z�)�J��y\�U�iB��1rKAЮ\Z@_t*���pP\��I˪{\�ȑU�OT*�\�FǢ�+&�K�0�k\���*�e|>u,�T�1U��X�ڲ�(��\0}*u.\�\�8s�h<qGZ6o�6/��P�\�utt��@��J4��L>Gm�\�ɪ��r�<2.:�\r\0g\�Y\�)~�\Z@��Rg�^%\ZC�R��\Z\0T��θ\0�J��~Z=�S5�Q*����Ġ���6\�\�{�\�H \�yU%G{{�\�\�2x66\�Ŵ\�*���9.��*1��\rvx\��W��2���\"��K\�7R[�>;:�Ť\0~n\�С��0(J�ҷSG�Z%�\�\'\�T�\�T\r`�Gbs�JX�+1hj��\��\�\�\�^V��uU�L5��P.�/M�\�r�\�_Y�}�z!�/�\�H#�+R{I%�5\0\�y�b\�n\�\0\ZJ꘮J�\�R�\�{1�g\�����@S�OP�\�\�\�S\'�W�\�[]]]�E��ھ2jԨ#UhH���>�U�\�tvv�/\������SE���\�V��F�T�\�B��\�6��>��=HE�F��R<��R��\�\0�zޥ\Z@S(�J?��T\�G\0c���^�\Z@3u^����\�՝\�\0\�Th��5��Ub�GR��M@�)H5���e\�\�R\'6O%�\�A�n�VwD9�f\r�_\�	M*��\�\�T�E�����дRGvgjsTb\�ĉ_q���j#NS�\�C\�ש=�{S?��\��͍)!Th��\'�m�\���kL�\�����r�|oZ�}D%v�_Lu\�\'֩\�j\���=���\�e\0�Je�j\0�\�\�Mq�\�]��n�N1R5���eٴ\�\�\�P��\��\�6�\�|R5�V^۝A�3t\�\�Cb\Z�\�ַ���\"@����!��d�\���S-V���<lذ\�U(B\�v\�\�!�\�k�1\n�р��\��\�8L�\�5(�J�J5\�l\�P\�x,u~�)\�\�G�\�@1�����!�dQ���:�\��\�.��\0RL�\�p���8\�_P\��\�\�\�Q�\�{ \�����\0E���C���k\���~\�?\�L�mmm\�[�@\�ť%��S4\���k\0ĵ\0N?���X�\0�8;��V�\�\�_\�r��\��=�PK\�����\�~ت�_\\�7��\��\�ۃ,q�:�s|�U\�\�O���\�9\0wZ\�\0����\�k�߫T*}5u�[\�\����v���8��u��;\�\��\�XK`�#�%����:�_\�&��;�f\�\�y�yi�R��~��R�=�~�M\'Z�\0{�\�,u��7�\�\�\�\��\�ج�ګg�u\�Q�*�ޏV���%\���G�\Zud\��_Imɩ���.K`\�F/�6�I?��Rۘ�lNL	ai\�{G�*�Tn\�\����.�\�Y�\0�ߙ�N\�[\���K�җ\�\�J�r�%p`!�&�o4\�獝\�\�s\0�e\�x��6�q\��Y�,�Y��>oْ蛑����\����u�J��-5��	�\�\���\r:��\�L�\�\�H\�hK�oװ�s=�?[gg绫G/�6l\�\�@߇��48�\�>WGGǱ�\�R{����m�@����\�*�����\���6���%Џ\�\�i�;k�\���8�\\.�\�\�\����\�J�rz�|�	��ߒ�\�bK``:\�Mi\�{X�\0~�>ϙ�\n���@w\Z	|v�?Ô\��F\0��D\0�ޜ\��O����~R\�??vN�\�\�,\r��	�OB\0�Cz\�\�\�W�v�%08!�f\�?>�\�\��ߟ\����\�/�=�PK`�B\�\�N\Z��9r\�Gc?Dj�ӷY\0\�\�\�ux�=��\��i\���nai\0�8\nhO!\�_j�kT/s�%0x���\n�r��9f\�\����z!��,�\r�\�( \�ob\�sz\�ϫ>@Ȳlao��xpPz�\'cZ�����:@�(�J�\��þ��^�\�SO}WzͿ�\�\\�n߫\�\0\r&u\�\�\�`C_��ӯ^�xI��J4���X-\�\�\���x\�\�\��R\0�i\�ĉ�2@c�VD\��Z1i\n�7\�\�oU�9B���\�O\�t�=���[=�Uh����\�qIk�WF\0��\�	\�\\�5�\'�����#��h�\�S��P\��/\�\� �	\�\�\�r�@\�@\n@\���\�\�NL��:�\�,{���\�\�	\���\�\���`\\�%u��\�b0}qD\0�\05�n\Z�\�?\�Ieq9ȸ,�r�^\0\���ڈ �A��Lm�R�v\0\��ܖc�=�\�84��(%@1�ǻ\�����������韌\0\0�<\0\�z�?�\�\��n��C=��	\0\Z#\0�2\�og�e7A��\�\���!\0\Z7\0�T\�\��\�[\�@�ݴ�\���`W|}\�\��}>���\r�=��{\0�\�E\04O\0\�.��!\0v�\0�$\0v�\056\r������}���{tW\�\��U�(�`pG{�i��G�[\0��O�6��MA\0M}yt�\�\0\Z4z;j��\�\�\� ��va/k\�}y\��$%h�A\�$\0\0�lDP7\rٻYD\�\�|\0�&\�6|\0\�b#�}	\0\�\"#�}\�\�\0@��f\�P\�;�\n9\"�\�C\0\0�\�\�/\0���\�º\0p&0@�\�\���1(@1G#F�\�\0@AUC\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0�\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0\Z�\�_��\�z�h\�\�\�SdYv�J�n�\�M�:t\�!�P�\�@�\\�\\�\0Z?z\�7�\�(\0����\0�ˌ\0\n*���]�@�F=��\0Z\\t��Ɵ\�\�\�a�\�;\�x+�5�ͮT*7vuu�j\0M���\��ԱOO�\�8[��p\�-Y�\�O�WE�&\\�O��}��\����\�E�md\0\�$��\��q\�\��\�s\�\�o�\���G\�_z\�|\�ƍy�ە+W\�O<�D����$7n\\o\�I�Q*�NS]�G�tttl�\����\�o�t�o��V��\�̙��?~\�0\�\�|���\�?)�{\�g�:�\�w\�}yWW�\�\0\ZYlJ��~\�\�s\�=���_|1?���\�4\� b\'p�>��\�\�ߗ\��\� �\�Y\�\0\�(��M@}5\�mD�æ�GU`\�y\0��b@�}��b3��\00H\�D����6oޜ��o}\�[���\�[\n\0� �ԟ	����s\�nwfqjGX\Z\0,լ\�| ��\��\�b�!K`�U\'�\�\��\�\�\�\�n\�nZ	K`\�C`\�E\�c*����\�6	��4\0X\�|�\�X�|���@�7P?\r��0�#�mqm2��\�W���� ��`\0FB\0`0\�\'\0P쑀��\0\n\�\0(��~�`�1���|\�\�\0�)\��\��\�(��ӿ~с\r\�_{\�,�\0�(�\'�{t=�\�fԕ\�\�8\�Wh$q�߸\�o_cx̘1�1ЈJ�\�i���\"�jD#��\0����Su�\�\n�\� 6\r\�>�\�Y�\0v\����U�	��v\�М9s��0\�	&l\��\�\�\n\0�\��\�\��\�o\"�3�{챞��j�\�\�ml󏠈3�\�O�\�`@�����G\r`{\�N`�&\����\'\�\�,ޛgǉ`�J峪\�\�b��\�\\C1:XU?\ru\��kc2��\�T\0\0\0\0\0\0\0\0\0\0\0\0�\���\�\��l\�\0\�\0\0\0\0IEND�B`�',1),('2505',1,'/home/czf/桌面/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','2501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0F_#�\0\0�IDATx\�\�\�\r����\'�\�/f5���^\�m6ƽۦ\��n\Z�ɍ���\�\rmW\�93�\��V��\�\ZI	E��Uz�jE��Z��n-\"UD^�:\�wQ�+��:�Tpx���sg\�a�Q)0\�\�s>�\�sxΙ3\��?\�����~\�\0\�HRJ�nH\���8\�\�uim~�\�\�w�\�Ϧ9mO���\��gw�\�\�\�s��oË�g�\��\'q\0j慔�\�0�lO(}\"\�\�B\�WR\�oO\�{��\�\���\�)�[��??�\�#@\��isz���۞̡�\�x>\�\�	�;r=\�\���on\�	�\�^~��\�\�Gs\�\�u\�[\�\���\��_�\�>�\�󯦴,?\����􋞟�\�\��9���\�zШP7?�\�\�&\�k|m�\�s^{6�\�^�?6s��\�\�\�?t�5�-ؑnڙR[�\�\���۞M�\���\�O\�\�Z\�?s|N\�\�����\�O\��o�cz\�/)=����o�u\0]��/ߚ^�\�3K{:�\�[�\�\��xbOu\�\�\�����\�5ݕ��4sEg츻*?��il\�^��m/��V�\�{�un\�\�ٯ@MB\��t\��\�#\�r]�@GZ\�/�\�S��\�_�͜\�RZ\��\�%?_�wItoq0K~�\�?vlɏŁ-w.\�\�\�\�\�\��tz0O�\�\�֤\�ƴ\�\���\�Ӛ<\�\�\\�\Zy\0jz\�\�|E��8!�\�e��.\�s=�\�\�㠕\\7\�Z�zF��}�.ȵ�\' �\��\�K{\�wo�Sz\�{r�\�\"o7\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��O���\�H)�`���F��2�uG�w��!�)F�Z�\�\�mO�\�\�\�z�}⢷ӍϦt�\�֤߾˴O,ݟ�Ϗ_+�\�Ǵ\�\�ҝ3_J�\�{oy<\�\�y_���6��\"�+{\�\0��~x{�Ō\�\�\�����V��3O;f�i7�1=A���o�Ǵ\�\�6��x�`G�)�6<�_���Om\0jz�\�1:�U)M�\�?��iY\�����\�7?�\�G\�S\��\�\"@{;\�\�\��x-�߹<\�2\�\0\�2�\"��\���\�5\�ϯ��\�\��\�s}*6]4\��{��s2}:��\�1\�\�߭Y\�\����\��\�Y����=�ˌ<\0��s\"\�z���\\�֋)]\�d=��7\�\�����78\�ϧ\�=�s~�\���\�͞\0P���\�Ϧ9���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\���\�ͻ\�nxkڴi]\��\�wSkkkjjjJ�G�N\����\�\�ɓ�L�:uÄ	�c\�\0r6n\�\�r\�w�y\�%��q\�ƥ_�\�W\��\�O�6mJ�w\�NaϞ=���#=�\�i\�̙i\�رi���]�&MZZ�TN4�\0\�{gw\�E��^|�\�)wviٲe\�\��~-_�<\�0�w\�y)w�S�(\0u\�\��\�g?\�8qbz\�\�\�\�X�re�0aB�ַ��Zkk\��F���cǎ	�\'ON\�]w]z�\�7ӑ�A\��.�袿\�\�	@\�txxW_}uڷo_:\�f̘\�\�Æ\r;\�hP3�/6iFGv4�\��\�\�ӨQ�\�\Zq\0j&Z�}xGj�\�m\�;vlW�R�h\�t�Y3�Ҍ#4C\�\�\�Ҳ\��=\0]���%�+��rOSS\�����+�ĉ\�\�\��z饗R\���:��A3��?ĕV�\��+imm\�_.�ϳ\0q-͸�X-\\{����\�,\0E\\<:��Y�=�ؾz\�,\0E\�-!.][�n\�ʡ\�i)\00(\�@�wKlq\�5��\0���Щ%���9\�sj\�\�u	=\0\�w��\�\�\�\�\�\�c�\0�fʔ)��:zs޼y�\�`\�\\q\�kku�\�\�ɓ7;O�A3ao�;�&Wd�ː�\"\0�|��ڛ\�\�\�iӵ7\\?���\�k5�.�\��\�\�\0��kmm=���\�\�Z�|��ޟ����\�幟\051~��\�q#٣}\��]�v\�onn\�\�\�\�\0\�\�رc7]{\�G󠖮�;:\�\��j�\r@M\�A%�\�\�z\�\r7�\�\�4iҫq^^lN5\�\0\�E�]p�?�\�O\�Ν;�\�&͋.�(\\Yg?\0u|�G�^}\�v=���}\�J\�ËM�:<\0\�Vl2jԨ}S�L\�\�w(�<�z\�-���\�(M�\0P��;\�]\�=ѭ�3�kڴi��,Y�o�\�\��\�~x�wK��G?��\�[\�\�bq���8\�\�L\0��b�s-ȵ6᮸-PUu\�>�\\\�qi1WZ��A�F��a#@��\�qF���\�Ç�`$\0h�\�\�:묳>f$\0h�\�=z�\�F�F��\�r��F�«T*�G�q��\0�:�}#G����\0��\�\��\�Q�F���\0�:��!\�g�\0�z��\����\0�B\�\�\\_1\04B\�\�nnn>\�H\0Pxq�������\0�:��\�CF�F���i$\0(�J��F�T���\0�:���\�勍\0�z�\�n\�F�F���.5\04B\�u\�l$\0h�\�\�\\.��\Z	\0\Z!�6V*���\0�����\�\�\�\�	\0\Z�\�[�;�\�F�F�5�n0\0^\���\\.�o6\04B\�\\*�n3\0^SS\�K�~m$\0(�r��<�\�]F�F\���\��w��\0��*�ʳ�R\��F�\�\�]ޓ9�\�7\04B\�=�C\�#@\�555=�\�a#@#�\�\�\�\�-2\0^^�RYb$\0h�Л�8�\0��\��\\\�F�\�\�#@#�ެz\�	\0\n/.A�\"3\04B\��&�ދF�\�\n\�테\0�W�T~�C\�ߍ\0�W.�o\���g#@#�ލ9�\�	\0\n/\������F�F\���\�\�[g$\0h�N\�z�\0�\�\�\�|E\��6	\0\n/wy�su	\0\n�T*]V�T�\Z	\0\n/\�ws����\0��r\�M(�\�ۍ\0�W*�����7�\0�����r��\�H\0Px9�F\�z\�H\0Px�,�\�.#@\�577��Co��\0��J�\��zo	\0\n�\\.!�^g<omm=�R��\�\�\�r��`\�ˡ�=�\�\���??�j����wǻ�]wE�g�\0�\rvLtz^�\\^n�\0h�nO�@��\�~B\�\�(�r�<��.o����rнQzی\0��;��U]\�D#@��\�\�7#�\0�W*�.z\0CTJ\�իW�kooO.L�\�\�W\�Ղ\�ҥK�r\��\�\�\\^[[[\�\�\�H���J�ڲeKZ�xqW�i�‚�O\���\��u��j*6iZ)���\�\�\�/��XY!+���z믛\�\�\'��/���\�yL�2WB(T\�\�ؾ!�8orz��\�P1-^�BWB(L\�[~�A�\�[\�ϱBWB(N\��\�O�x\�\n]	=�0��\��z��z�\�SJ\�C-�\�h́B/^�BWB(L\�z�C/^�BWB(L\�m۰,���7m\�i��z@aB/j\�S�>(�b���z@�B\�\�Ӫ\�f�i3O�׬Е\�\nzqŕ��~�}z񚫲(�\�\�\�ܦU�\�M\Z0�z+\�\�\��)��\�{�\�Nק�P�\�{?\�ݻu}V�J\�C&��\��\�-+x%�!zJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0��~j���\�NH^xaZ�jU�җ��������޹s\�\'�x\��\�柙={�Pz�\�\Z��!͜9��}\�ƍ���_<`�\�w\�\�=��W^9\�gn��va\'�\0�W�\�\�7oޜ\�x㍃\�\�GM_�\�W\�w\�ޝ�y\�o��fM��\�\����3�K�,zBz�z�\�rK�5kV��\�\�Y�\�\�ɓ�\�-�\�s�{絶��4~��\�\�۷o\�0UBzu\�\�\��+Wv?\�Gұ\��\��N=�\�\��\�m۶u�L\�(� �\�:�z7O����T\��\�d*�\0�ޠW\�f\�q\�ƥ;v����d�\�\'N\�>J3�>���_�bE��\�\�\�_\�q\�i\�\�\�OzBz�������\�͛��9#׭[�\�k�g�yfw��|ߟ\�=͡\�.B@\�)� ��\�zJ\�=%�\0��z�гBVBzJ	=@\�)%�\0���\���zBzJ\�=%�\0��z\0BO	=\0����>���BVBhmmm�;::��\�Q��\�ׯ͡\�\�/��E��h�\�\�]���ZC��w\�\�ѐ��V��`�������j.���\��+6?5B\�w\�}\�\�s\�Ms\�\��\�����%�\�7�I�2\�\�\�	<�\Z�T*kr-�\�\�ojj\�ʕ\�\��TK��x\�ȁ�o�\�\��X\�y\��\�|+s\�y�%�\��7s����\�\�\�\�\��y���t\08��7=wV;�ӿ�q\�m\�z�]\�\�<�\'ZR\0�\�\�\�\�s�\�\�\�rQ�\�%\�\�\��B���\�\�g�p8A3/�\��:��U\�zQ\�\"�-5\0و#N\�\�o�\�z��8xe��{+\�\�DK�\�\��=�ɟ\�h~�xo6\�K�\�\�F\��\�?f̘�\�Q\�-�\n��܉�ϘǘWK��Y�\�s�\�Ug�筱\�.\�\�\�U\�\�\���%�\�\Z.?ʵ{\�ȑ���\�o3f\�c\�k\�+-9\0\�\\�r�ĕO.*�\\*�.�y�y�8�.\�\\�\r��.�\��ۛe	𾴶�~\"inn��P���\����$\0\�\�{>wL\�\r\����$x���J\�\����S�Њ�O,�I\�w�D\�W\�я�E8���\�\��N�,\0��\�rg�v�\�s�\�R�\�PcE��I|�z��\0�\r��R\�kW\�\�C����Bܮ��\�/�[=\�%�\�\�g\�^y9N)p\�RO��Frl���7����;�P�\�\�{[[[�/�w�\�\�5��%\�x�.��\�J�rm�|\��]�\�\�\�\�\�\�h q#\�o6\���\�\��\0h�G��\�z��\��\rz߈\�c\��\�\��+�˫��\�\�[�\�\�Q�%\0\�ȑ#�[^᧖����:9�\�\�477�W�E\0\\^\��6��w\�\0<�AC\�zO�/�qV�\�q\�_�TN\�߽˝\�\Z\�\�ѣO��\�r\�7���w�\�ε\�\0\r&��\'đ�---���o\�I=.G\�\�\�\0�|\�w/�	ەJe]�,u�5lذcr\�\�(�J�/��\�\�l9�\�\�Ç�`�4�x�)\����:\�\����\�\� �\�1\�\�#G���\����\�m\�S4\0\�?^\�᰼h\�+w��\�n�6K�w�u\�Y\���\'׏\��7Wg\��>l	\�7$���\��tA�ώ���%�@A1/\�����\�\�#�+�w\���\�` vz~C�k\�Mrw777_a��b�fl\�\�{Ͻ8\�?O��\�\�?\�\�u�iӒ\�}�Z\���8����\��|cܒ\'\�u\���W\� K�C阖\��x=�����\�\\\��;\�_\�<[z\0Jx�\�\�U�]o\�\�f\�8=ND�\�-A\0ޗR����M�}/\��\�⚝uڙ\�S\�(\0�\�\�\�\�/\�\�\�\��|�\�w\\L:6\�\�ť-E\0ޗ\�\�\�\�sx̉�n�\�˯M���\���`�W-A\0ٹ\�{R��\\��߂z�׸1lϕd��%�\�ߪ>����\�R�,�y��\08\"������eK�^\��^\�\\.26\�\�y:\�R\���\�z6y��N\�\�z/X2\05�R:f�\�\�\�\�\�\�\�\����\�Q��s\�s\�=7\���\r�,X��.]ڕk��6�\�\"�\�\�\�RGGG\�\�\�TG�v\�\�\�p\�y˖-i�\�\�]9\0���j*:<��#�r\�\�\�/��ؤi���bs��8��bEd��� ��ꭿnJ���UZ�\��\�\�1\�\�\\	=�P��c���\�\�\���w@Ŵx\�\n]	=�0��n��^o�_>\�\n]	=�8��\�#?0�\�5+t%�ދ�8`\�\�kV\�J\�BO)��Ћ�5\n�x\�\n]	=�0��\�\��x\�\n]	=�0��mò�\�\�S޴��\�kV\�J\��	��5O���ЋiV\�J\�\�\n��\�N��q�\�<-^�BWB(D\�\�W^~���\�\�k�ʢ�0�C/wp�V-J/<4i��\�xO�Wק�0\�Bｺ;]�z@aB\��tw\�\��Y�+��\��[���\��\��L\�)%�\0���\���RBzJ	=@\�)� ��\�zJ\�=%�\0�^o-Y�$�t\�IiժU\�\�O;\�#�\��g\�jBz�QL������\�\�c�{\�ڵ��\�w\�}w�g��\�+�M\�B���q\�\�\�`z\�G�\�N�۶u��\�~\�=mmm\�\�SOM˖-;\�\�>����\�ӧ�Ǎt׬I��ԧ�\�ݻw�g�y�\�\�\�\�g�y\�i��\�\�A<k֬\�y�\�G>��z\�)� �\\\�\�r\�-\�\�{\�M���p@\�\�kW\\qEw�\����\��\�?�я��\�\�P?~|�{�o\�~�\�\�3{�\�\�\���r\�J� �\\\�\�&\�x�馛\�y-���6nܸ\�}s\�_}w��\�4�~��~é�k�\���\�ޮ���\�qݺuB@\�\�\�\�\r�\�M�s\�\�\�ބY��͛7Ե�3�\�n��\�{�ό�Ǿ��3g�c�=6\�ܹ\�>=\0�wd�w�b\�&\�x>bĈB蓟�dw�v\�g�y��\��\�w�bŊ\�\�bSgߠ\�3\�H\�\�|\�3i˖-\�kz\0B\�+Be\�\�_\�}\�C쟋`;\�S\�\�X����\�A)Q�\�Q};��>3�\�\�\�oW)�\0��z\0BO	=\0����\�SBzJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0����\�SBzBO	=�Q\�}ଐ�\�\ZB[[\����+euTk���ks\�u��jjѢE?Z�xq\�k��f嬎Z\�-X�`o�i�‚\�+����\�ߊ\�O꽫R��C�N�0\r6옦�&��\0(��#G��\��!�3\�\�\�r�\�H\0Px9��)wzB���Sr\�\�7\0^KK\�i9��	\0\n�R���Co��\0�B\�\�z{�\0�W*��\�\�{\�H\0Px9�\�ε\�H\0Px�JeT�\\\�i$\0(�x\�\�No��\0�:�q9�\�0\0^�T�v�׍\0�z�\�\�\�j$\0(�\�\�\�)\�r�\�H\0PxMMM?ʵ\�H\0Px�˛�Co��\0�B\�zk�\0�z7\�\�{\�H\0Px�J嗹^6\0^\��\�̵\�H\0\��ww�\\^f$\0(�R���J��\0�:�9��0\04B\�\�\����\0�Boa��F�F��|F�F��r����\0�B\�8�\�H\0Pxq�B��`$\0(�r��Bss�o�\0�� �K�	\0\n/.6]*�n3\0^�\\^\�\�\�<\�H\0Pxqٸ���\0�:���ӻ\�H\0\��ަJ�r��\0�:��\�\�M1\04B��5ץF�«T*\�sM4\04B��F�qF�F���i$\0(�#F����\�s�Xz;s5\0\n�\\./\������\�\�\�\�\�\�\�\0CZKK\�i\�zݕ��#@!\�`{~���T*�uy\04D��\��pr��\�\'��\��\0(�R���~B\�V#@!\�\�Xx��\rv�Q��\�\��yU��~bD\0(z��9B\�_�\�6\Z\0Fl�\���\\m��\�\�\�{ K�m�ڛ��g8��!\'.=��lq�=\�ubz\�s�\�\n.q\�2�@\�wv9�\�a�%\��v�\0u\�\�\��|\�\�v�\r�q\�ƥ�o�9=��\�iÆ\ri�\�\�)\�cGGGz�\�\�wܑ&N�\�߉\�\�T�@݈�2[ZZ�W\�����\�@۷o_z��{\�4iҤ�\�ו?�Q�.�zsf�4gΜC\n��z\�\�\�\�ڷ\�|\0\�Nl\�́\�U�)�\�_NG\�_��t�\�\��\�\�	@M\�A+\���\"�bݑ�W|��\��-\0�8J�z�\�\���\���l\�|\�\�0h\�<�\��x�\�h�}|\���b���\0���ϫ�\�ܳgO:\�.��\�\�͜\�-\0��ؗW}��8-a0,[�\�+�\�:\�\�\0ਊS�^9�SU�	\�q�NK���\�\�\�\��s뭷��4s\�\�.Sfi\0p�CoKo�ĥ\�SlJ�\�Ĺ\�\�\0\�\�a�\���M�6\rj\�\�y{շ%�4\08ڝ\�;�\�{�\������[\Z\0Z\�Ղ\�@�\0G�}z\04R�\�\�M\0\Z&���@c\�\�U��\"\�%�\\\�,\0���f\�Os\�M\0\ZB\�Ӯ�.�\�\�M�4\�]\0|q?�>]\�@�t{m�u\��s\�9ǝ\���\�\�\�\�\�\��\�Z\�<�#}^\���\�7k\�\�k�t�R\�\�՛9#��T\�^u\�\�\�\�g\��e�}�:�bSg\�\�;��[b^�M�\�\�M5\�\0\�]��\��\�s\��i	�\'O> \�\�s\0�|_�\�\�W�\�3�\��\�Ov_���\"\���\�\"\�J+\�\'�W\�óI���T\�y����V\0�{q_\�Ҟ��r\����\�J�x\�\�\��e����,\�Vgt[�oKTu9�\�q�踖�K�\0\0\0\0\0\0\0\0\0\0\0\0\0�\����\"c<O e\0\0\0\0IEND�B`�',1),('3',1,'/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0F_#�\0\0�IDATx\�\�\�\r����\'�\�/f5���^\�m6ƽۦ\��n\Z�ɍ���\�\rmW\�93�\��V��\�\ZI	E��Uz�jE��Z��n-\"UD^�:\�wQ�+��:�Tpx���sg\�a�Q)0\�\�s>�\�sxΙ3\��?\�����~\�\0\�HRJ�nH\���8\�\�uim~�\�\�w�\�Ϧ9mO���\��gw�\�\�\�s��oË�g�\��\'q\0j慔�\�0�lO(}\"\�\�B\�WR\�oO\�{��\�\���\�)�[��??�\�#@\��isz���۞̡�\�x>\�\�	�;r=\�\���on\�	�\�^~��\�\�Gs\�\�u\�[\�\���\��_�\�>�\�󯦴,?\����􋞟�\�\��9���\�zШP7?�\�\�&\�k|m�\�s^{6�\�^�?6s��\�\�\�?t�5�-ؑnڙR[�\�\���۞M�\���\�O\�\�Z\�?s|N\�\�����\�O\��o�cz\�/)=����o�u\0]��/ߚ^�\�3K{:�\�[�\�\��xbOu\�\�\�����\�5ݕ��4sEg츻*?��il\�^��m/��V�\�{�un\�\�ٯ@MB\��t\��\�#\�r]�@GZ\�/�\�S��\�_�͜\�RZ\��\�%?_�wItoq0K~�\�?vlɏŁ-w.\�\�\�\�\�\��tz0O�\�\�֤\�ƴ\�\���\�Ӛ<\�\�\\�\Zy\0jz\�\�|E��8!�\�e��.\�s=�\�\�㠕\\7\�Z�zF��}�.ȵ�\' �\��\�K{\�wo�Sz\�{r�\�\"o7\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��O���\�H)�`���F��2�uG�w��!�)F�Z�\�\�mO�\�\�\�z�}⢷ӍϦt�\�֤߾˴O,ݟ�Ϗ_+�\�Ǵ\�\�ҝ3_J�\�{oy<\�\�y_���6��\"�+{\�\0��~x{�Ō\�\�\�����V��3O;f�i7�1=A���o�Ǵ\�\�6��x�`G�)�6<�_���Om\0jz�\�1:�U)M�\�?��iY\�����\�7?�\�G\�S\��\�\"@{;\�\�\��x-�߹<\�2\�\0\�2�\"��\���\�5\�ϯ��\�\��\�s}*6]4\��{��s2}:��\�1\�\�߭Y\�\����\��\�Y����=�ˌ<\0��s\"\�z���\\�֋)]\�d=��7\�\�����78\�ϧ\�=�s~�\���\�͞\0P���\�Ϧ9���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\���\�ͻ\�nxkڴi]\��\�wSkkkjjjJ�G�N\����\�\�ɓ�L�:uÄ	�c\�\0r6n\�\�r\�w�y\�%��q\�ƥ_�\�W\��\�O�6mJ�w\�NaϞ=���#=�\�i\�̙i\�رi���]�&MZZ�TN4�\0\�{gw\�E��^|�\�)wviٲe\�\��~-_�<\�0�w\�y)w�S�(\0u\�\��\�g?\�8qbz\�\�\�\�X�re�0aB�ַ��Zkk\��F���cǎ	�\'ON\�]w]z�\�7ӑ�A\��.�袿\�\�	@\�txxW_}uڷo_:\�f̘\�\�Æ\r;\�hP3�/6iFGv4�\��\�\�ӨQ�\�\Zq\0j&Z�}xGj�\�m\�;vlW�R�h\�t�Y3�Ҍ#4C\�\�\�Ҳ\��=\0]���%�+��rOSS\�����+�ĉ\�\�\��z饗R\���:��A3��?ĕV�\��+imm\�_.�ϳ\0q-͸�X-\\{����\�,\0E\\<:��Y�=�ؾz\�,\0E\�-!.][�n\�ʡ\�i)\00(\�@�wKlq\�5��\0���Щ%���9\�sj\�\�u	=\0\�w��\�\�\�\�\�\�c�\0�fʔ)��:zs޼y�\�`\�\\q\�kku�\�\�ɓ7;O�A3ao�;�&Wd�ː�\"\0�|��ڛ\�\�\�iӵ7\\?���\�k5�.�\��\�\�\0��kmm=���\�\�Z�|��ޟ����\�幟\051~��\�q#٣}\��]�v\�onn\�\�\�\�\0\�\�رc7]{\�G󠖮�;:\�\��j�\r@M\�A%�\�\�z\�\r7�\�\�4iҫq^^lN5\�\0\�E�]p�?�\�O\�Ν;�\�&͋.�(\\Yg?\0u|�G�^}\�v=���}\�J\�ËM�:<\0\�Vl2jԨ}S�L\�\�w(�<�z\�-���\�(M�\0P��;\�]\�=ѭ�3�kڴi��,Y�o�\�\��\�~x�wK��G?��\�[\�\�bq���8\�\�L\0��b�s-ȵ6᮸-PUu\�>�\\\�qi1WZ��A�F��a#@��\�qF���\�Ç�`$\0h�\�\�:묳>f$\0h�\�=z�\�F�F��\�r��F�«T*�G�q��\0�:�}#G����\0��\�\��\�Q�F���\0�:��!\�g�\0�z��\����\0�B\�\�\\_1\04B\�\�nnn>\�H\0Pxq�������\0�:��\�CF�F���i$\0(�J��F�T���\0�:���\�勍\0�z�\�n\�F�F���.5\04B\�u\�l$\0h�\�\�\\.��\Z	\0\Z!�6V*���\0�����\�\�\�\�	\0\Z�\�[�;�\�F�F�5�n0\0^\���\\.�o6\04B\�\\*�n3\0^SS\�K�~m$\0(�r��<�\�]F�F\���\��w��\0��*�ʳ�R\��F�\�\�]ޓ9�\�7\04B\�=�C\�#@\�555=�\�a#@#�\�\�\�\�-2\0^^�RYb$\0h�Л�8�\0��\��\\\�F�\�\�#@#�ެz\�	\0\n/.A�\"3\04B\��&�ދF�\�\n\�테\0�W�T~�C\�ߍ\0�W.�o\���g#@#�ލ9�\�	\0\n/\������F�F\���\�\�[g$\0h�N\�z�\0�\�\�\�|E\��6	\0\n/wy�su	\0\n�T*]V�T�\Z	\0\n/\�ws����\0��r\�M(�\�ۍ\0�W*�����7�\0�����r��\�H\0Px9�F\�z\�H\0Px�,�\�.#@\�577��Co��\0��J�\��zo	\0\n�\\.!�^g<omm=�R��\�\�\�r��`\�ˡ�=�\�\���??�j����wǻ�]wE�g�\0�\rvLtz^�\\^n�\0h�nO�@��\�~B\�\�(�r�<��.o����rнQzی\0��;��U]\�D#@��\�\�7#�\0�W*�.z\0CTJ\�իW�kooO.L�\�\�W\�Ղ\�ҥK�r\��\�\�\\^[[[\�\�\�H���J�ڲeKZ�xqW�i�‚�O\���\��u��j*6iZ)���\�\�\�/��XY!+���z믛\�\�\'��/���\�yL�2WB(T\�\�ؾ!�8orz��\�P1-^�BWB(L\�[~�A�\�[\�ϱBWB(N\��\�O�x\�\n]	=�0��\��z��z�\�SJ\�C-�\�h́B/^�BWB(L\�z�C/^�BWB(L\�m۰,���7m\�i��z@aB/j\�S�>(�b���z@�B\�\�Ӫ\�f�i3O�׬Е\�\nzqŕ��~�}z񚫲(�\�\�\�ܦU�\�M\Z0�z+\�\�\��)��\�{�\�Nק�P�\�{?\�ݻu}V�J\�C&��\��\�-+x%�!zJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0��~j���\�NH^xaZ�jU�җ��������޹s\�\'�x\��\�柙={�Pz�\�\Z��!͜9��}\�ƍ���_<`�\�w\�\�=��W^9\�gn��va\'�\0�W�\�\�7oޜ\�x㍃\�\�GM_�\�W\�w\�ޝ�y\�o��fM��\�\����3�K�,zBz�z�\�rK�5kV��\�\�Y�\�\�ɓ�\�-�\�s�{絶��4~��\�\�۷o\�0UBzu\�\�\��+Wv?\�Gұ\��\��N=�\�\��\�m۶u�L\�(� �\�:�z7O����T\��\�d*�\0�ޠW\�f\�q\�ƥ;v����d�\�\'N\�>J3�>���_�bE��\�\�\�_\�q\�i\�\�\�OzBz�������\�͛��9#׭[�\�k�g�yfw��|ߟ\�=͡\�.B@\�)� ��\�zJ\�=%�\0��z�гBVBzJ	=@\�)%�\0���\���zBzJ\�=%�\0��z\0BO	=\0����>���BVBhmmm�;::��\�Q��\�ׯ͡\�\�/��E��h�\�\�]���ZC��w\�\�ѐ��V��`�������j.���\��+6?5B\�w\�}\�\�s\�Ms\�\��\�����%�\�7�I�2\�\�\�	<�\Z�T*kr-�\�\�ojj\�ʕ\�\��TK��x\�ȁ�o�\�\��X\�y\��\�|+s\�y�%�\��7s����\�\�\�\�\��y���t\08��7=wV;�ӿ�q\�m\�z�]\�\�<�\'ZR\0�\�\�\�\�s�\�\�\�rQ�\�%\�\�\��B���\�\�g�p8A3/�\��:��U\�zQ\�\"�-5\0و#N\�\�o�\�z��8xe��{+\�\�DK�\�\��=�ɟ\�h~�xo6\�K�\�\�F\��\�?f̘�\�Q\�-�\n��܉�ϘǘWK��Y�\�s�\�Ug�筱\�.\�\�\�U\�\�\���%�\�\Z.?ʵ{\�ȑ���\�o3f\�c\�k\�+-9\0\�\\�r�ĕO.*�\\*�.�y�y�8�.\�\\�\r��.�\��ۛe	𾴶�~\"inn��P���\����$\0\�\�{>wL\�\r\����$x���J\�\����S�Њ�O,�I\�w�D\�W\�я�E8���\�\��N�,\0��\�rg�v�\�s�\�R�\�PcE��I|�z��\0�\r��R\�kW\�\�C����Bܮ��\�/�[=\�%�\�\�g\�^y9N)p\�RO��Frl���7����;�P�\�\�{[[[�/�w�\�\�5��%\�x�.��\�J�rm�|\��]�\�\�\�\�\�\�h q#\�o6\���\�\��\0h�G��\�z��\��\rz߈\�c\��\�\��+�˫��\�\�[�\�\�Q�%\0\�ȑ#�[^᧖����:9�\�\�477�W�E\0\\^\��6��w\�\0<�AC\�zO�/�qV�\�q\�_�TN\�߽˝\�\Z\�\�ѣO��\�r\�7���w�\�ε\�\0\r&��\'đ�---���o\�I=.G\�\�\�\0�|\�w/�	ەJe]�,u�5lذcr\�\�(�J�/��\�\�l9�\�\�Ç�`�4�x�)\����:\�\����\�\� �\�1\�\�#G���\����\�m\�S4\0\�?^\�᰼h\�+w��\�n�6K�w�u\�Y\���\'׏\��7Wg\��>l	\�7$���\��tA�ώ���%�@A1/\�����\�\�#�+�w\���\�` vz~C�k\�Mrw777_a��b�fl\�\�{Ͻ8\�?O��\�\�?\�\�u�iӒ\�}�Z\���8����\��|cܒ\'\�u\���W\� K�C阖\��x=�����\�\\\��;\�_\�<[z\0Jx�\�\�U�]o\�\�f\�8=ND�\�-A\0ޗR����M�}/\��\�⚝uڙ\�S\�(\0�\�\�\�\�/\�\�\�\��|�\�w\\L:6\�\�ť-E\0ޗ\�\�\�\�sx̉�n�\�˯M���\���`�W-A\0ٹ\�{R��\\��߂z�׸1lϕd��%�\�ߪ>����\�R�,�y��\08\"������eK�^\��^\�\\.26\�\�y:\�R\���\�z6y��N\�\�z/X2\05�R:f�\�\�\�\�\�\�\�\����\�Q��s\�s\�=7\���\r�,X��.]ڕk��6�\�\"�\�\�\�RGGG\�\�\�TG�v\�\�\�p\�y˖-i�\�\�]9\0���j*:<��#�r\�\�\�/��ؤi���bs��8��bEd��� ��ꭿnJ���UZ�\��\�\�1\�\�\\	=�P��c���\�\�\���w@Ŵx\�\n]	=�0��n��^o�_>\�\n]	=�8��\�#?0�\�5+t%�ދ�8`\�\�kV\�J\�BO)��Ћ�5\n�x\�\n]	=�0��\�\��x\�\n]	=�0��mò�\�\�S޴��\�kV\�J\��	��5O���ЋiV\�J\�\�\n��\�N��q�\�<-^�BWB(D\�\�W^~���\�\�k�ʢ�0�C/wp�V-J/<4i��\�xO�Wק�0\�Bｺ;]�z@aB\��tw\�\��Y�+��\��[���\��\��L\�)%�\0���\���RBzJ	=@\�)� ��\�zJ\�=%�\0�^o-Y�$�t\�IiժU\�\�O;\�#�\��g\�jBz�QL������\�\�c�{\�ڵ��\�w\�}w�g��\�+�M\�B���q\�\�\�`z\�G�\�N�۶u��\�~\�=mmm\�\�SOM˖-;\�\�>����\�ӧ�Ǎt׬I��ԧ�\�ݻw�g�y�\�\�\�\�g�y\�i��\�\�A<k֬\�y�\�G>��z\�)� �\\\�\�r\�-\�\�{\�M���p@\�\�kW\\qEw�\����\��\�?�я��\�\�P?~|�{�o\�~�\�\�3{�\�\�\���r\�J� �\\\�\�&\�x�馛\�y-���6nܸ\�}s\�_}w��\�4�~��~é�k�\���\�ޮ���\�qݺuB@\�\�\�\�\r�\�M�s\�\�\�ބY��͛7Ե�3�\�n��\�{�ό�Ǿ��3g�c�=6\�ܹ\�>=\0�wd�w�b\�&\�x>bĈB蓟�dw�v\�g�y��\��\�w�bŊ\�\�bSgߠ\�3\�H\�\�|\�3i˖-\�kz\0B\�+Be\�\�_\�}\�C쟋`;\�S\�\�X����\�A)Q�\�Q};��>3�\�\�\�oW)�\0��z\0BO	=\0����\�SBzJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0����\�SBzBO	=�Q\�}ଐ�\�\ZB[[\����+euTk���ks\�u��jjѢE?Z�xq\�k��f嬎Z\�-X�`o�i�‚\�+����\�ߊ\�O꽫R��C�N�0\r6옦�&��\0(��#G��\��!�3\�\�\�r�\�H\0Px9��)wzB���Sr\�\�7\0^KK\�i9��	\0\n�R���Co��\0�B\�\�z{�\0�W*��\�\�{\�H\0Px9�\�ε\�H\0Px�JeT�\\\�i$\0(�x\�\�No��\0�:�q9�\�0\0^�T�v�׍\0�z�\�\�\�j$\0(�\�\�\�)\�r�\�H\0PxMMM?ʵ\�H\0Px�˛�Co��\0�B\�zk�\0�z7\�\�{\�H\0Px�J嗹^6\0^\��\�̵\�H\0\��ww�\\^f$\0(�R���J��\0�:�9��0\04B\�\�\����\0�Boa��F�F��|F�F��r����\0�B\�8�\�H\0Pxq�B��`$\0(�r��Bss�o�\0�� �K�	\0\n/.6]*�n3\0^�\\^\�\�\�<\�H\0Pxqٸ���\0�:���ӻ\�H\0\��ަJ�r��\0�:��\�\�M1\04B��5ץF�«T*\�sM4\04B��F�qF�F���i$\0(�#F����\�s�Xz;s5\0\n�\\./\������\�\�\�\�\�\�\�\0CZKK\�i\�zݕ��#@!\�`{~���T*�uy\04D��\��pr��\�\'��\��\0(�R���~B\�V#@!\�\�Xx��\rv�Q��\�\��yU��~bD\0(z��9B\�_�\�6\Z\0Fl�\���\\m��\�\�\�{ K�m�ڛ��g8��!\'.=��lq�=\�ubz\�s�\�\n.q\�2�@\�wv9�\�a�%\��v�\0u\�\�\��|\�\�v�\r�q\�ƥ�o�9=��\�iÆ\ri�\�\�)\�cGGGz�\�\�wܑ&N�\�߉\�\�T�@݈�2[ZZ�W\�����\�@۷o_z��{\�4iҤ�\�ו?�Q�.�zsf�4gΜC\n��z\�\�\�\�ڷ\�|\0\�Nl\�́\�U�)�\�_NG\�_��t�\�\��\�\�	@M\�A+\���\"�bݑ�W|��\��-\0�8J�z�\�\���\���l\�|\�\�0h\�<�\��x�\�h�}|\���b���\0���ϫ�\�ܳgO:\�.��\�\�͜\�-\0��ؗW}��8-a0,[�\�+�\�:\�\�\0ਊS�^9�SU�	\�q�NK���\�\�\�\��s뭷��4s\�\�.Sfi\0p�CoKo�ĥ\�SlJ�\�Ĺ\�\�\0\�\�a�\���M�6\rj\�\�y{շ%�4\08ڝ\�;�\�{�\������[\Z\0Z\�Ղ\�@�\0G�}z\04R�\�\�M\0\Z&���@c\�\�U��\"\�%�\\\�,\0���f\�Os\�M\0\ZB\�Ӯ�.�\�\�M�4\�]\0|q?�>]\�@�t{m�u\��s\�9ǝ\���\�\�\�\�\�\��\�Z\�<�#}^\���\�7k\�\�k�t�R\�\�՛9#��T\�^u\�\�\�\�g\��e�}�:�bSg\�\�;��[b^�M�\�\�M5\�\0\�]��\��\�s\��i	�\'O> \�\�s\0�|_�\�\�W�\�3�\��\�Ov_���\"\���\�\"\�J+\�\'�W\�óI���T\�y����V\0�{q_\�Ҟ��r\����\�J�x\�\�\��e����,\�Vgt[�oKTu9�\�q�踖�K�\0\0\0\0\0\0\0\0\0\0\0\0\0�\����\"c<O e\0\0\0\0IEND�B`�',1),('5002',1,'processes/Entrust.bpmn20.xml','5001','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('5003',1,'processes/Entrust.Entrust.png','5001','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�g\"\0\0*�IDATx\�\�\��\\e�7�\�*��Km�ReQ�JQEaY,��e\�.�ee�L�tO&��Q \�x\�2K��P�B��*���P(���(�	1�bH !&$!$!�@r����u�\�}.\�}~���z����\�93\���\��!C��<�\����Oy~\�\�ny�<�hʺ��?���/��ϻ2��kϋ\�D���\�\��\�Ϟ^\\���mʿ7d����yC\0h,�\���\�/�ۉ\�y\�Z�/��Z�|�~fj?�\�\��\�t\��՟;ss�OK��K\���vx\�y+��\�\�\�mɯO���\0\r\�<�v\�g����-\��n?z\�m�_\�%4\�ImFj?�\�M/�ۇ.�\�\�E�\�𼱵\�\�M\��T~���6���j4\�(\���MO\�\�\�\��̆جs{j�I\�릭^�n��\�~2oKl\Z�6�\�5\���X\��s�?��>徵��jAr\����\�\�ڈ 6-��Qq�xl\��\�\�׾�:�?Ě}jǤ�\��\�:��\�EG~Ã�gNݔ?��6\��c;>�:�\�\�dt\��.z6n�;\�\�*\rЀ������]��<:�?��?{\�oW�������_�\��kϻz�k\���?�l�&6��\�O\�����\�\�\�\�H�gg�\�K�[U\Z���N��\��\�5�Y�=�\��sf-ϟ�\��\��\�\�6k\���k���\r�u�\�\�\��\�x\�Ol��{�a�}&�F�\Z+\0ڪ�~�\Z;o\�\�UO\���\�vdj���ѵ�\���ԎJ_̩>�\�\�>�{�;��0/\�/O�\��\��\�>�V\�\�\�_��g\�1*\�X!��կ?�|�ϽwM�\�w/�\�\�߮~\"O-�|����\�0}��I�[��\�.�\�\�82��\�k�}t\�\��\�\�\�Tk�_ D\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\��a�\���o�\���&M\����=\�\�\�\�G��wvv\�_�\�W�	&l��\�_\Z;v\�\�T�,[��\�\�[o}�+_�J~\�\�\�?���Gy$_�|y�q\�\�<l޼9_�re�\�c�\�\�v[~\�9\�\�cƌ\�:~���\�\���\�|k�GL�6m��矟�5�|\�ܹ=��ޚ?~�F\r�\�g���Q\�\�*\n\�Dk�\�^{\�\�q\�\�\�s\�\�\�ĳ\�>��;6���rWW\�a�\��֭[7v	�u\�]����\�y_�\�F�z\�wޫ64� \�\�+�\�\�z뭼�\�x\�1\"xe\�С��6@�}\0�	(\�\��#\0j��\�|\�ȑ�U��\�N\�\�\�W��v�i\�s\�\�Z.�ǩ:@�\�@qP4bgqGG\��\0\Z@����K/�t�#\�Q}�Agǉ`5\n�y\�g�4x\�Nb�A4y�\�\�ƙ���3xW����dYv��\00Hb.��\nb0\\}�\�o�1b��\00Hb2��h0<��\�o�Xb)\0��\r4&��W�ޚB�\�R\0$1\rtm6Ё\�\�TԖ� �Nx0	�At\�g\�H`�\0D_�\�\�m��ʕ+7\�\'\00�.�\�\��::\���\�_\�\� �At\�%�,��&L��\�y\0�h\�ر_�k\�\�1m�3�?��\�A�gώMA\�l^x\�W]uՀ��\�ѣW�E�\�\��\�/n�?�����\�\�1\np=�1f̘	qa����\�o���R�lve1�s\�9\�,��\��s\'�\��+�,[�\�\0\r&vҦ�\�n��?�`\���\��\Z\�\�\�\'\�h\� =z�\�\�|\�;��\r�l\�y\�;��\�\0\�A\�\�ٹ�K_�\�֧�z\�w\�>�\�d\0\�Db\�\�ȑ#ߺ袋ތ0ؗMD�?���\�\�P=\n\�N`�fk\�i-��6?jԨ��&Mzcƌo�X�bK\\�6hL����� \�L\�\��\�<\0�\0ZD\�\�;S��\�\�q}༮u\�6�\�f\�T\�(F0\�\'N<X%\0\n\Z�G�>T%\0\n\Z\�\�\���\0\���v�8R{�J\04�,{�J\0P�\\\�\�\�\�v�J\07�W	�\Z1b\�[\�\�\�V	�b�@\\,�#*P\�(�J\'�@�\�\�\�Ç��J\03�\�\�\��U%\0\nhĈ�J�\�0�\0(flLm�J\03\�(\'*P\�X�Q	�b���\�\�T	�*�˯��%�\0(\�H\�\�\�\�S	�b�֦6N%\0�9X�\�7T��#�եR\�\�*P̑�\�\�&�@1C`E�e�@1C`yj��@�Q�\�J�r�J\0s$�\�r�|�J\03^L\�z�\0(�,\�V*�U��#�\�\�\��T��!���\0\��gR��J\0P�e�Sܮ\0\���)\�P	�J0\'�;U��!�Dj�V	�b����ݣ\0\��\�Y�ݧ\0\��?���\0T.�g���\0A�\0\��ɱIH%\0��\�\�a�\0(�R��\�r��G�\0(fܝB\�q�\0(f�*���T���,�ň#�R	�b��\�R\�S	�JpkjO�@ť%\��*P\��A\\l^%\0\n�R�ܘe\�B�\0(�4\n�>�U��\�\��\�)��\0T�T�ʲl�J\0s$py\Z	,S	�b�.I#�*P\��(��J�\0(f�O!�J%\0\n�T*]0bĈ5*P\��j�\\~E%\0\n(�\�K\�U�\0(�4\n�Rj��@1Gg��N%\0����W	�*\')\�P	�b����Q%\0\n�R�|>˲M*P\��l\Z	t�@�\�\�SRlV	�b��\'�\0@A\�N\�\��=�%*Кk��\�)J�\�i*P\�\��bhaY�M\�Utttd*\����u���\�L$.\�1\�\��*P� x�.\\]�HҚ���Q�8(\�h@%\0\n�T*}[\0�<\�Y�p\�ٳg\�S�N\�\'O��\�G�2eJ�\�CmM\�FU@ӈ\0�9sf�r\�ʼ��[;��jժ|��\�[S L�4���\r�420\�5\�b�λo[l�4�\�t\�B\0�m\�_]�/|\�\���)�\�\�\�\�O�/��uk_\�\�\�?!\�\�on\�\�xL\�/��%��S\0\�\�\���\���\0\�\�!�̃��\��\�t�B\0h\��7y\�.C \��@hB\0h\����v�_\0-fݰ\��\�t�B\0h\�X�\�\�|\�\�)(\��\���\0\�\�!m\�\�?\�)\�>��\0Z=6m\�<|\�Λ�\�}�_\0-\ZqF�s��\�\�>�x\�Y\�B\0h�Hk�\�L\��|\��]@�\�s\�FB\0h�\�\�ڿQ�\0Z8�f\�w�! �&��\r�ZB\0h\�Є\0 4!\0M\0B@�Є\0 4!\0M\0B@@�B\�\�g�͇�?��\����ޛϝ;7?�\�#�\�g_x\�������_���1\��?�\�{����5ѹ��\��|\�\�w\�}�\0\��yժU\�:\�\�d\�v�\�\�{�x^�Gϵ\n-\��~O\�!ϻ뮻�\��\�q\�=?\�\�c�\�r�\0����Z��Z3g\�\�O8\�\�\�\�\�̙\���Y�fm�oÆ\r=��/\�\�\�\�7߼\���\�\�\�	�\�����Z�dɒ�I|�e\�ҥ\�}��7\�O>�\��\�I�\�\�~�\�u?��\�\���/��Ϙ1C\0B\�@B :ܸ\�k�\����q\�=���\�o\�|���F�\�_\�曣�:j�ǎ>�\�\��\������\����=�M�:u[�\�m�C�0\Z3fL\�}k׮\�uTS{O#@`{\���\'��SG�Ӵ\�\�\�\�W^y\�v�\�)\�;\�\�\�\��}\�c\��YV�X\�s[?�\�݈E\0B�C\��@O�\�[\�\�\�߾ˀ\��\�IB\0{\�b;����\�6M�4i\�\�g�y\�\���}WWW\�H��ö�C>�\�{:\�w�\��q\��\�ccǎ\��:\�=��>�O\�˖-۶\�z\���\�q_l\Z\�-\�\�cs\��\��>!\0��\r�\�8k-ֶ\��m�c8v��v�O��_{�v�\�iGHD�ԇK�\�I\'��\�kFh�\Z5�\�5c\�n\��\�E\�Ϝr\�)=��9{;\������N;��\0 4!\0M\0B@�Є\0 4!\0M\0B@���\0! \0��\0B\0@\0! \0��\0B\0`0\�\��:n!\0\�̙3��\\�R\�\�Gm\�ҥ�St�\��´i\�.�>}�֗_~����믿ާ0eʔ7S�\�/h\Z�Ӻ8����\��\�F�ѧ���9rd~��\��\�kv\0�~!\���!^�\\.��T*7:��(HdYv_�n��0\���\�#T�\�C u�\�և@]ےڔG�<@���Yg�u\�.B��ʹ��C�:\Zؼ�\0H�mIm�\��h�\�]��\�8|��O�<@k���^\�M;���;��1\n�T*?Wu�����ê��\�\�.��\�(\��\�#����\0-\�\�^�\���4�(\��V�eǩ>@��n\���\�^u�(@C 9(�\�˩=a	\0/j\'�\�t\�Y\n\0�\�{�\�J�\�i�@�B ����bD�\�{-\r���@5\�ϱ<}y�%P�=z��\�r���-���@�T*\'\��\�v��P�\�\�\���d\0\n\�\�sgjoĴ�@�B���Ŕ�@C`ذa�ǌ��\�n	,B�T�T\�Ȳ\�lK	�`!R\0\\GuttkI,B�\\��\�Z3�0&N�xp��+Ө\�1K�`!:;;\����Ֆ@�B tttd\�G�Yj\0��e\��\�\�\�5jԑ�@�B�\Zs\�g^6Č�\0\��ꌣ��\�}��P��~\�\���}\�(X�,\�Ώ\�#G����P�)\�Ja����\0�\�\�_�\�_,I��@gg绫3�\�ji,B�\\>�zE�/X�\0�P�T.I�˛mmm\�X�\0�\�\�23�^ioo�%P��G�,[��\���,@�B �xlJ��,]���@(�͖��}\�(XT�\��u�~�\�ﱔ\n\�\�m^j/Y\�\0����w�\�o]�e�Y\�\0�j|8f-�JX\�\0�\�\�86v��G,q���@H#��\�\��\�SO}��P����f(jČ�Y�mJ��O-y���@H!�q�T*�a\�B�`!P��/KaSK\�/\0\���g��ƌ��(��q�\\.�N��G�\0B�����>X�q�J	�(\�\�_�\�*�\�g�5\0B��J�ҏR6�q�e\��Ԗ� \n�6\�h�\\�W5\0!P@\'Ɖd)��\Z�(�R��\��\�NR\r@�&��qV.���\�<��(f���v�j\0B��\�\�\��5N$K5\�T\r@�>W�qŮ\�\�q4&�S\r@LL7!a�\Z�(�\���b�j\0B���\�ű\�X5\0!P\�z\���\�!���b\�\�8�L%\0!P@1�DL+\�K� �Y��b���pN5�f\�VD����^��NL9ASP�\�!й�Ȳ\�b�ڧ �7.F�Q\r��`\�nB`\�СCQ�}���\�S�\�ԣ��V{�\n�@}�_w\\�^5�f�\��\r�7\n\��J\�\�G+�4\�h���>	��R-\�\�\�\���j\0�ˌ�^\n\�G҈`�G�F\�ή�U�o\�\�8:K5�F\r�\�0\n\��=:6�v�j\0��\�\��R\�8�,\�gT\n&\��C.\\�d�\�\��ԩS�ɓ\'k�ѦL��?�\�C[S��IC��)6uvv�\�H�̙3�+W\�\�\�\�\��U�V\�ӧOߚaR��_R[\�\n$F\0�o� ����o�6\�h�T�\�Dl\�y�m�\�C\����e\�G�\'���\���[\�K#�R�\�\�\��a�! z\��W�\��q>\����:\�\�\�^TG��q�@O[���|\���\��\�v-\�\�t��!��K�\��_�%��S\0\�\�\���\��[4b\�\�r�ܝ\���@�C\���{�!�\��[3���\�Ŏ\�\�\��[��!0o�\�]�@<�\�o\�Y�M��%\�\���ǀ�\�\�\��\�8\n�8\ZhW!�\��[?b\�\�r��J\n���k�`!�`\�\r��xL\�\��!\�\�ڎ�\�B�J\��9P�X�\�\�|\�\�)(\��\���!��3�>�\��{� !m\�\�?\�)\�>�~�B�\Z�� \�h\�Q(Jlڔ/x�Ɲ7��\�1�B�\Zϙq\nqF�s��\�\�>�x\�Y\�\�����ò,ې\�\�.�EЊ!�\��/�������Z�\�\�s�\n�a\�ȑ�\�R�\�?	Z(���oT jF��q4��o�	��Y�\�ݨ@L.Ե�S\0<�F��=�P�Q\�!��PkB�X!���`Y�es�GA��&�ըQ��LAН�\����@��T*��\���,B��R\\�F�;;;\�\���(�,\�KA�Ҍ� �@\r:��4\"X�\��a �@utt\��Q�\��\�@�bn:;f-�J�R\rB��R\�3�6\�pՀ�g�}6:th��\�O\��\�{o>w\�\��\�#�\�\�\�͘1#?ꨣ��|}\�\'�Y�y�\�w�\�\n��-R	h�H?��Z�*_�fM\�\�\�\�\�\�ٳ�\�Q\�?/n\��ŋp|\�w��\�/� \ZD\�8�B\��\�\�T\rh�\�A�\�\�fΜ��p\�	=��\�}˖-\�y��>�\�\�?��\��\��\�\�3������\�=�5\�\\�\�,Z�s\�1۽\�ƍ�\'�|�\�\�\�\�k�r\�)��a\�z�鮻\�\��,o�\��\�\\��r���\�?�n\�U\r(@Dg�E�]�zܸqۅ�\�7ߜ\�y\��?�\�?n\�\�\�c�\\rɶ��\�+vz,��������\�o߮�3fL\�s֮]�Ө��׬�Bj�G@\�m}h	��Q�T\�\�C\��Հ�c�=v�m����M6q��\�\�sb4��{\�=\�������\�~\�MIK�.�\�\�\�\�5k��\�\�\�\�%K�@?Ȳlr\Z\r�f\�Qh���>�\�c\�c\�:�\�&�{g�O�ϭX�b�\�5jT�k\�}�=�f<?�%\�v\�m�;\��|Æ\r�	���qty\n�9J-�\r>:\�Y�f\�9hҤI۾>�\�3�\�S\�_���m\�)}�\�=k��\�\'�\�T��m��#�\�\�4�cp\�\�5\�H��O>�g\'���}B��xo\�/��\�{�M\�O�:u[�5��ñ�v_t��\�\�\������\�\�GG\�q\�\�r�L�\�\�B\'v�F�}�G\n�z\��̵��GB��J�\�b\�\�\�U�|$�	���F\�ňଳ\�:J5@�bn\Zz\"��ӗ�!P01\�h\n�WS{P5@�bn:�z��E�B@s�\��gR5@�J#��\�C\�\�\���\Z �@����Y�-T	B��b�B\��\�~�\Z �@�J���W$��j��B`B1\�\�\�v�j�\���qA�K�\Z �@�Č�+\�\����(��W(��\�?T\rB��RܑB �����U��(�\��\�R=��|Հ~�\�븅@#ʲlZL5=|��O����3gnY�r�λ�\�ҥK�\�����\�\�\�ߖ:��Sl\�\�\�8VE�M�6\�\�ӧo}�\�u\�}\0S�Ly3�I���;\0\�\���*�\�G��\�i]�\�^\�\�f�Fm�c��?_�u��\�\�\�����ץ��s�m&N�xp��J���\���Ժ\�r~X5�\�=�P!\�\�P�^T\�\����\�0!КJ�\�qhjW�Ы\�\�\�w�֓e\���\�\0��\Z�.�~�\�\�I�\�V�h�\�7���i�~N5�݊�cR�!Z@u\'��\�6��!�(\�\�\�SO}W\Z,I\�\0\�U`�����:�-*\�ܣ��6@j�\�\�\�ߩ\"�����B�yutt�X\���D�� �IZs�pG�ͧR�|>-�7S��F5���:���@�ɲ\��\�9\0׫�\�bJ�X�T��\n�I\�s\0��\Z�)�J��y\�U�iB��1rKAЮ\Z@_t*���pP\��I˪{\�ȑU�OT*�\�FǢ�+&�K�0�k\���*�e|>u,�T�1U��X�ڲ�(��\0}*u.\�\�8s�h<qGZ6o�6/��P�\�utt��@��J4��L>Gm�\�ɪ��r�<2.:�\r\0g\�Y\�)~�\Z@��Rg�^%\ZC�R��\Z\0T��θ\0�J��~Z=�S5�Q*����Ġ���6\�\�{�\�H \�yU%G{{�\�\�2x66\�Ŵ\�*���9.��*1��\rvx\��W��2���\"��K\�7R[�>;:�Ť\0~n\�С��0(J�ҷSG�Z%�\�\'\�T�\�T\r`�Gbs�JX�+1hj��\��\�\�\�^V��uU�L5��P.�/M�\�r�\�_Y�}�z!�/�\�H#�+R{I%�5\0\�y�b\�n\�\0\ZJ꘮J�\�R�\�{1�g\�����@S�OP�\�\�\�S\'�W�\�[]]]�E��ھ2jԨ#UhH���>�U�\�tvv�/\������SE���\�V��F�T�\�B��\�6��>��=HE�F��R<��R��\�\0�zޥ\Z@S(�J?��T\�G\0c���^�\Z@3u^����\�՝\�\0\�Th��5��Ub�GR��M@�)H5���e\�\�R\'6O%�\�A�n�VwD9�f\r�_\�	M*��\�\�T�E�����дRGvgjsTb\�ĉ_q���j#NS�\�C\�ש=�{S?��\��͍)!Th��\'�m�\���kL�\�����r�|oZ�}D%v�_Lu\�\'֩\�j\���=���\�e\0�Je�j\0�\�\�Mq�\�]��n�N1R5���eٴ\�\�\�P��\��\�6�\�|R5�V^۝A�3t\�\�Cb\Z�\�ַ���\"@����!��d�\���S-V���<lذ\�U(B\�v\�\�!�\�k�1\n�р��\��\�8L�\�5(�J�J5\�l\�P\�x,u~�)\�\�G�\�@1�����!�dQ���:�\��\�.��\0RL�\�p���8\�_P\��\�\�\�Q�\�{ \�����\0E���C���k\���~\�?\�L�mmm\�[�@\�ť%��S4\���k\0ĵ\0N?���X�\0�8;��V�\�\�_\�r��\��=�PK\�����\�~ت�_\\�7��\��\�ۃ,q�:�s|�U\�\�O���\�9\0wZ\�\0����\�k�߫T*}5u�[\�\����v���8��u��;\�\��\�XK`�#�%����:�_\�&��;�f\�\�y�yi�R��~��R�=�~�M\'Z�\0{�\�,u��7�\�\�\�\��\�ج�ګg�u\�Q�*�ޏV���%\���G�\Zud\��_Imɩ���.K`\�F/�6�I?��Rۘ�lNL	ai\�{G�*�Tn\�\����.�\�Y�\0�ߙ�N\�[\���K�җ\�\�J�r�%p`!�&�o4\�獝\�\�s\0�e\�x��6�q\��Y�,�Y��>oْ蛑����\����u�J��-5��	�\�\���\r:��\�L�\�\�H\�hK�oװ�s=�?[gg绫G/�6l\�\�@߇��48�\�>WGGǱ�\�R{����m�@����\�*�����\���6���%Џ\�\�i�;k�\���8�\\.�\�\�\����\�J�rz�|�	��ߒ�\�bK``:\�Mi\�{X�\0~�>ϙ�\n���@w\Z	|v�?Ô\��F\0��D\0�ޜ\��O����~R\�??vN�\�\�,\r��	�OB\0�Cz\�\�\�W�v�%08!�f\�?>�\�\��ߟ\����\�/�=�PK`�B\�\�N\Z��9r\�Gc?Dj�ӷY\0\�\�\�ux�=��\��i\���nai\0�8\nhO!\�_j�kT/s�%0x���\n�r��9f\�\����z!��,�\r�\�( \�ob\�sz\�ϫ>@Ȳlao��xpPz�\'cZ�����:@�(�J�\��þ��^�\�SO}WzͿ�\�\\�n߫\�\0\r&u\�\�\�`C_��ӯ^�xI��J4���X-\�\�\���x\�\�\��R\0�i\�ĉ�2@c�VD\��Z1i\n�7\�\�oU�9B���\�O\�t�=���[=�Uh����\�qIk�WF\0��\�	\�\\�5�\'�����#��h�\�S��P\��/\�\� �	\�\�\�r�@\�@\n@\���\�\�NL��:�\�,{���\�\�	\���\�\���`\\�%u��\�b0}qD\0�\05�n\Z�\�?\�Ieq9ȸ,�r�^\0\���ڈ �A��Lm�R�v\0\��ܖc�=�\�84��(%@1�ǻ\�����������韌\0\0�<\0\�z�?�\�\��n��C=��	\0\Z#\0�2\�og�e7A��\�\���!\0\Z7\0�T\�\��\�[\�@�ݴ�\���`W|}\�\��}>���\r�=��{\0�\�E\04O\0\�.��!\0v�\0�$\0v�\056\r������}���{tW\�\��U�(�`pG{�i��G�[\0��O�6��MA\0M}yt�\�\0\Z4z;j��\�\�\� ��va/k\�}y\��$%h�A\�$\0\0�lDP7\rٻYD\�\�|\0�&\�6|\0\�b#�}	\0\�\"#�}\�\�\0@��f\�P\�;�\n9\"�\�C\0\0�\�\�/\0���\�º\0p&0@�\�\���1(@1G#F�\�\0@AUC\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0�\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0\Z�\�_��\�z�h\�\�\�SdYv�J�n�\�M�:t\�!�P�\�@�\\�\\�\0Z?z\�7�\�(\0����\0�ˌ\0\n*���]�@�F=��\0Z\\t��Ɵ\�\�\�a�\�;\�x+�5�ͮT*7vuu�j\0M���\��ԱOO�\�8[��p\�-Y�\�O�WE�&\\�O��}��\����\�E�md\0\�$��\��q\�\��\�s\�\�o�\���G\�_z\�|\�ƍy�ە+W\�O<�D����$7n\\o\�I�Q*�NS]�G�tttl�\����\�o�t�o��V��\�̙��?~\�0\�\�|���\�?)�{\�g�:�\�w\�}yWW�\�\0\ZYlJ��~\�\�s\�=���_|1?���\�4\� b\'p�>��\�\�ߗ\��\� �\�Y\�\0\�(��M@}5\�mD�æ�GU`\�y\0��b@�}��b3��\00H\�D����6oޜ��o}\�[���\�[\n\0� �ԟ	����s\�nwfqjGX\Z\0,լ\�| ��\��\�b�!K`�U\'�\�\��\�\�\�\�n\�nZ	K`\�C`\�E\�c*����\�6	��4\0X\�|�\�X�|���@�7P?\r��0�#�mqm2��\�W���� ��`\0FB\0`0\�\'\0P쑀��\0\n\�\0(��~�`�1���|\�\�\0�)\��\��\�(��ӿ~с\r\�_{\�,�\0�(�\'�{t=�\�fԕ\�\�8\�Wh$q�߸\�o_cx̘1�1ЈJ�\�i���\"�jD#��\0����Su�\�\n�\� 6\r\�>�\�Y�\0v\����U�	��v\�М9s��0\�	&l\��\�\�\n\0�\��\�\��\�o\"�3�{챞��j�\�\�ml󏠈3�\�O�\�`@�����G\r`{\�N`�&\����\'\�\�,ޛgǉ`�J峪\�\�b��\�\\C1:XU?\ru\��kc2��\�T\0\0\0\0\0\0\0\0\0\0\0\0�\���\�\��l\�\0\�\0\0\0\0IEND�B`�',1),('7502',1,'processes/Entrust.bpmn20.xml','7501','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('7503',1,'processes/Entrust.Entrust.png','7501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�g\"\0\0*�IDATx\�\�\��\\e�7�\�*��Km�ReQ�JQEaY,��e\�.�ee�L�tO&��Q \�x\�2K��P�B��*���P(���(�	1�bH !&$!$!�@r����u�\�}.\�}~���z����\�93\���\��!C��<�\����Oy~\�\�ny�<�hʺ��?���/��ϻ2��kϋ\�D���\�\��\�Ϟ^\\���mʿ7d����yC\0h,�\���\�/�ۉ\�y\�Z�/��Z�|�~fj?�\�\��\�t\��՟;ss�OK��K\���vx\�y+��\�\�\�mɯO���\0\r\�<�v\�g����-\��n?z\�m�_\�%4\�ImFj?�\�M/�ۇ.�\�\�E�\�𼱵\�\�M\��T~���6���j4\�(\���MO\�\�\�\��̆جs{j�I\�릭^�n��\�~2oKl\Z�6�\�5\���X\��s�?��>徵��jAr\����\�\�ڈ 6-��Qq�xl\��\�\�׾�:�?Ě}jǤ�\��\�:��\�EG~Ã�gNݔ?��6\��c;>�:�\�\�dt\��.z6n�;\�\�*\rЀ������]��<:�?��?{\�oW�������_�\��kϻz�k\���?�l�&6��\�O\�����\�\�\�\�H�gg�\�K�[U\Z���N��\��\�5�Y�=�\��sf-ϟ�\��\��\�\�6k\���k���\r�u�\�\�\��\�x\�Ol��{�a�}&�F�\Z+\0ڪ�~�\Z;o\�\�UO\���\�vdj���ѵ�\���ԎJ_̩>�\�\�>�{�;��0/\�/O�\��\��\�>�V\�\�\�_��g\�1*\�X!��կ?�|�ϽwM�\�w/�\�\�߮~\"O-�|����\�0}��I�[��\�.�\�\�82��\�k�}t\�\��\�\�\�Tk�_ D\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\��a�\���o�\���&M\����=\�\�\�\�G��wvv\�_�\�W�	&l��\�_\Z;v\�\�T�,[��\�\�[o}�+_�J~\�\�\�?���Gy$_�|y�q\�\�<l޼9_�re�\�c�\�\�v[~\�9\�\�cƌ\�:~���\�\���\�|k�GL�6m��矟�5�|\�ܹ=��ޚ?~�F\r�\�g���Q\�\�*\n\�Dk�\�^{\�\�q\�\�\�s\�\�\�ĳ\�>��;6���rWW\�a�\��֭[7v	�u\�]����\�y_�\�F�z\�wޫ64� \�\�+�\�\�z뭼�\�x\�1\"xe\�С��6@�}\0�	(\�\��#\0j��\�|\�ȑ�U��\�N\�\�\�W��v�i\�s\�\�Z.�ǩ:@�\�@qP4bgqGG\��\0\Z@����K/�t�#\�Q}�Agǉ`5\n�y\�g�4x\�Nb�A4y�\�\�ƙ���3xW����dYv��\00Hb.��\nb0\\}�\�o�1b��\00Hb2��h0<��\�o�Xb)\0��\r4&��W�ޚB�\�R\0$1\rtm6Ё\�\�TԖ� �Nx0	�At\�g\�H`�\0D_�\�\�m��ʕ+7\�\'\00�.�\�\��::\���\�_\�\� �At\�%�,��&L��\�y\0�h\�ر_�k\�\�1m�3�?��\�A�gώMA\�l^x\�W]uՀ��\�ѣW�E�\�\��\�/n�?�����\�\�1\np=�1f̘	qa����\�o���R�lve1�s\�9\�,��\��s\'�\��+�,[�\�\0\r&vҦ�\�n��?�`\���\��\Z\�\�\�\'\�h\� =z�\�\�|\�;��\r�l\�y\�;��\�\0\�A\�\�ٹ�K_�\�֧�z\�w\�>�\�d\0\�Db\�\�ȑ#ߺ袋ތ0ؗMD�?���\�\�P=\n\�N`�fk\�i-��6?jԨ��&Mzcƌo�X�bK\\�6hL����� \�L\�\��\�<\0�\0ZD\�\�;S��\�\�q}༮u\�6�\�f\�T\�(F0\�\'N<X%\0\n\Z�G�>T%\0\n\Z\�\�\���\0\���v�8R{�J\04�,{�J\0P�\\\�\�\�\�v�J\07�W	�\Z1b\�[\�\�\�V	�b�@\\,�#*P\�(�J\'�@�\�\�\�Ç��J\03�\�\�\��U%\0\nhĈ�J�\�0�\0(flLm�J\03\�(\'*P\�X�Q	�b���\�\�T	�*�˯��%�\0(\�H\�\�\�\�S	�b�֦6N%\0�9X�\�7T��#�եR\�\�*P̑�\�\�&�@1C`E�e�@1C`yj��@�Q�\�J�r�J\0s$�\�r�|�J\03^L\�z�\0(�,\�V*�U��#�\�\�\��T��!���\0\��gR��J\0P�e�Sܮ\0\���)\�P	�J0\'�;U��!�Dj�V	�b����ݣ\0\��\�Y�ݧ\0\��?���\0T.�g���\0A�\0\��ɱIH%\0��\�\�a�\0(�R��\�r��G�\0(fܝB\�q�\0(f�*���T���,�ň#�R	�b��\�R\�S	�JpkjO�@ť%\��*P\��A\\l^%\0\n�R�ܘe\�B�\0(�4\n�>�U��\�\��\�)��\0T�T�ʲl�J\0s$py\Z	,S	�b�.I#�*P\��(��J�\0(f�O!�J%\0\n�T*]0bĈ5*P\��j�\\~E%\0\n(�\�K\�U�\0(�4\n�Rj��@1Gg��N%\0����W	�*\')\�P	�b����Q%\0\n�R�|>˲M*P\��l\Z	t�@�\�\�SRlV	�b��\'�\0@A\�N\�\��=�%*Кk��\�)J�\�i*P\�\��bhaY�M\�Utttd*\����u���\�L$.\�1\�\��*P� x�.\\]�HҚ���Q�8(\�h@%\0\n�T*}[\0�<\�Y�p\�ٳg\�S�N\�\'O��\�G�2eJ�\�CmM\�FU@ӈ\0�9sf�r\�ʼ��[;��jժ|��\�[S L�4���\r�420\�5\�b�λo[l�4�\�t\�B\0�m\�_]�/|\�\���)�\�\�\�\�O�/��uk_\�\�\�?!\�\�on\�\�xL\�/��%��S\0\�\�\���\���\0\�\�!�̃��\��\�t�B\0h\��7y\�.C \��@hB\0h\����v�_\0-fݰ\��\�t�B\0h\�X�\�\�|\�\�)(\��\���\0\�\�!m\�\�?\�)\�>��\0Z=6m\�<|\�Λ�\�}�_\0-\ZqF�s��\�\�>�x\�Y\�B\0h�Hk�\�L\��|\��]@�\�s\�FB\0h�\�\�ڿQ�\0Z8�f\�w�! �&��\r�ZB\0h\�Є\0 4!\0M\0B@�Є\0 4!\0M\0B@@�B\�\�g�͇�?��\����ޛϝ;7?�\�#�\�g_x\�������_���1\��?�\�{����5ѹ��\��|\�\�w\�}�\0\��yժU\�:\�\�d\�v�\�\�{�x^�Gϵ\n-\��~O\�!ϻ뮻�\��\�q\�=?\�\�c�\�r�\0����Z��Z3g\�\�O8\�\�\�\�\�̙\���Y�fm�oÆ\r=��/\�\�\�\�7߼\���\�\�\�	�\�����Z�dɒ�I|�e\�ҥ\�}��7\�O>�\��\�I�\�\�~�\�u?��\�\���/��Ϙ1C\0B\�@B :ܸ\�k�\����q\�=���\�o\�|���F�\�_\�曣�:j�ǎ>�\�\��\������\����=�M�:u[�\�m�C�0\Z3fL\�}k׮\�uTS{O#@`{\���\'��SG�Ӵ\�\�\�\�W^y\�v�\�)\�;\�\�\�\��}\�c\��YV�X\�s[?�\�݈E\0B�C\��@O�\�[\�\�\�߾ˀ\��\�IB\0{\�b;����\�6M�4i\�\�g�y\�\���}WWW\�H��ö�C>�\�{:\�w�\��q\��\�ccǎ\��:\�=��>�O\�˖-۶\�z\���\�q_l\Z\�-\�\�cs\��\��>!\0��\r�\�8k-ֶ\��m�c8v��v�O��_{�v�\�iGHD�ԇK�\�I\'��\�kFh�\Z5�\�5c\�n\��\�E\�Ϝr\�)=��9{;\������N;��\0 4!\0M\0B@�Є\0 4!\0M\0B@���\0! \0��\0B\0@\0! \0��\0B\0`0\�\��:n!\0\�̙3��\\�R\�\�Gm\�ҥ�St�\��´i\�.�>}�֗_~����믿ާ0eʔ7S�\�/h\Z�Ӻ8����\��\�F�ѧ���9rd~��\��\�kv\0�~!\���!^�\\.��T*7:��(HdYv_�n��0\���\�#T�\�C u�\�և@]ےڔG�<@���Yg�u\�.B��ʹ��C�:\Zؼ�\0H�mIm�\��h�\�]��\�8|��O�<@k���^\�M;���;��1\n�T*?Wu�����ê��\�\�.��\�(\��\�#����\0-\�\�^�\���4�(\��V�eǩ>@��n\���\�^u�(@C 9(�\�˩=a	\0/j\'�\�t\�Y\n\0�\�{�\�J�\�i�@�B ����bD�\�{-\r���@5\�ϱ<}y�%P�=z��\�r���-���@�T*\'\��\�v��P�\�\�\���d\0\n\�\�sgjoĴ�@�B���Ŕ�@C`ذa�ǌ��\�n	,B�T�T\�Ȳ\�lK	�`!R\0\\GuttkI,B�\\��\�Z3�0&N�xp��+Ө\�1K�`!:;;\����Ֆ@�B tttd\�G�Yj\0��e\��\�\�\�5jԑ�@�B�\Zs\�g^6Č�\0\��ꌣ��\�}��P��~\�\���}\�(X�,\�Ώ\�#G����P�)\�Ja����\0�\�\�_�\�_,I��@gg绫3�\�ji,B�\\>�zE�/X�\0�P�T.I�˛mmm\�X�\0�\�\�23�^ioo�%P��G�,[��\���,@�B �xlJ��,]���@(�͖��}\�(XT�\��u�~�\�ﱔ\n\�\�m^j/Y\�\0����w�\�o]�e�Y\�\0�j|8f-�JX\�\0�\�\�86v��G,q���@H#��\�\��\�SO}��P����f(jČ�Y�mJ��O-y���@H!�q�T*�a\�B�`!P��/KaSK\�/\0\���g��ƌ��(��q�\\.�N��G�\0B�����>X�q�J	�(\�\�_�\�*�\�g�5\0B��J�ҏR6�q�e\��Ԗ� \n�6\�h�\\�W5\0!P@\'Ɖd)��\Z�(�R��\��\�NR\r@�&��qV.���\�<��(f���v�j\0B��\�\�\��5N$K5\�T\r@�>W�qŮ\�\�q4&�S\r@LL7!a�\Z�(�\���b�j\0B���\�ű\�X5\0!P\�z\���\�!���b\�\�8�L%\0!P@1�DL+\�K� �Y��b���pN5�f\�VD����^��NL9ASP�\�!й�Ȳ\�b�ڧ �7.F�Q\r��`\�nB`\�СCQ�}���\�S�\�ԣ��V{�\n�@}�_w\\�^5�f�\��\r�7\n\��J\�\�G+�4\�h���>	��R-\�\�\�\���j\0�ˌ�^\n\�G҈`�G�F\�ή�U�o\�\�8:K5�F\r�\�0\n\��=:6�v�j\0��\�\��R\�8�,\�gT\n&\��C.\\�d�\�\��ԩS�ɓ\'k�ѦL��?�\�C[S��IC��)6uvv�\�H�̙3�+W\�\�\�\�\��U�V\�ӧOߚaR��_R[\�\n$F\0�o� ����o�6\�h�T�\�Dl\�y�m�\�C\����e\�G�\'���\���[\�K#�R�\�\�\��a�! z\��W�\��q>\����:\�\�\�^TG��q�@O[���|\���\��\�v-\�\�t��!��K�\��_�%��S\0\�\�\���\��[4b\�\�r�ܝ\���@�C\���{�!�\��[3���\�Ŏ\�\�\��[��!0o�\�]�@<�\�o\�Y�M��%\�\���ǀ�\�\�\��\�8\n�8\ZhW!�\��[?b\�\�r��J\n���k�`!�`\�\r��xL\�\��!\�\�ڎ�\�B�J\��9P�X�\�\�|\�\�)(\��\���!��3�>�\��{� !m\�\�?\�)\�>�~�B�\Z�� \�h\�Q(Jlڔ/x�Ɲ7��\�1�B�\Zϙq\nqF�s��\�\�>�x\�Y\�\�����ò,ې\�\�.�EЊ!�\��/�������Z�\�\�s�\n�a\�ȑ�\�R�\�?	Z(���oT jF��q4��o�	��Y�\�ݨ@L.Ե�S\0<�F��=�P�Q\�!��PkB�X!���`Y�es�GA��&�ըQ��LAН�\����@��T*��\���,B��R\\�F�;;;\�\���(�,\�KA�Ҍ� �@\r:��4\"X�\��a �@utt\��Q�\��\�@�bn:;f-�J�R\rB��R\�3�6\�pՀ�g�}6:th��\�O\��\�{o>w\�\��\�#�\�\�\�͘1#?ꨣ��|}\�\'�Y�y�\�w�\�\n��-R	h�H?��Z�*_�fM\�\�\�\�\�\�ٳ�\�Q\�?/n\��ŋp|\�w��\�/� \ZD\�8�B\��\�\�T\rh�\�A�\�\�fΜ��p\�	=��\�}˖-\�y��>�\�\�?��\��\��\�\�3������\�=�5\�\\�\�,Z�s\�1۽\�ƍ�\'�|�\�\�\�\�k�r\�)��a\�z�鮻\�\��,o�\��\�\\��r���\�?�n\�U\r(@Dg�E�]�zܸqۅ�\�7ߜ\�y\��?�\�?n\�\�\�c�\\rɶ��\�+vz,��������\�o߮�3fL\�s֮]�Ө��׬�Bj�G@\�m}h	��Q�T\�\�C\��Հ�c�=v�m����M6q��\�\�sb4��{\�=\�������\�~\�MIK�.�\�\�\�\�5k��\�\�\�\�%K�@?Ȳlr\Z\r�f\�Qh���>�\�c\�c\�:�\�&�{g�O�ϭX�b�\�5jT�k\�}�=�f<?�%\�v\�m�;\��|Æ\r�	���qty\n�9J-�\r>:\�Y�f\�9hҤI۾>�\�3�\�S\�_���m\�)}�\�=k��\�\'�\�T��m��#�\�\�4�cp\�\�5\�H��O>�g\'���}B��xo\�/��\�{�M\�O�:u[�5��ñ�v_t��\�\�\������\�\�GG\�q\�\�r�L�\�\�B\'v�F�}�G\n�z\��̵��GB��J�\�b\�\�\�U�|$�	���F\�ňଳ\�:J5@�bn\Zz\"��ӗ�!P01\�h\n�WS{P5@�bn:�z��E�B@s�\��gR5@�J#��\�C\�\�\���\Z �@����Y�-T	B��b�B\��\�~�\Z �@�J���W$��j��B`B1\�\�\�v�j�\���qA�K�\Z �@�Č�+\�\����(��W(��\�?T\rB��RܑB �����U��(�\��\�R=��|Հ~�\�븅@#ʲlZL5=|��O����3gnY�r�λ�\�ҥK�\�����\�\�\�ߖ:��Sl\�\�\�8VE�M�6\�\�ӧo}�\�u\�}\0S�Ly3�I���;\0\�\���*�\�G��\�i]�\�^\�\�f�Fm�c��?_�u��\�\�\�����ץ��s�m&N�xp��J���\���Ժ\�r~X5�\�=�P!\�\�P�^T\�\����\�0!КJ�\�qhjW�Ы\�\�\�w�֓e\���\�\0��\Z�.�~�\�\�I�\�V�h�\�7���i�~N5�݊�cR�!Z@u\'��\�6��!�(\�\�\�SO}W\Z,I\�\0\�U`�����:�-*\�ܣ��6@j�\�\�\�ߩ\"�����B�yutt�X\���D�� �IZs�pG�ͧR�|>-�7S��F5���:���@�ɲ\��\�9\0׫�\�bJ�X�T��\n�I\�s\0��\Z�)�J��y\�U�iB��1rKAЮ\Z@_t*���pP\��I˪{\�ȑU�OT*�\�FǢ�+&�K�0�k\���*�e|>u,�T�1U��X�ڲ�(��\0}*u.\�\�8s�h<qGZ6o�6/��P�\�utt��@��J4��L>Gm�\�ɪ��r�<2.:�\r\0g\�Y\�)~�\Z@��Rg�^%\ZC�R��\Z\0T��θ\0�J��~Z=�S5�Q*����Ġ���6\�\�{�\�H \�yU%G{{�\�\�2x66\�Ŵ\�*���9.��*1��\rvx\��W��2���\"��K\�7R[�>;:�Ť\0~n\�С��0(J�ҷSG�Z%�\�\'\�T�\�T\r`�Gbs�JX�+1hj��\��\�\�\�^V��uU�L5��P.�/M�\�r�\�_Y�}�z!�/�\�H#�+R{I%�5\0\�y�b\�n\�\0\ZJ꘮J�\�R�\�{1�g\�����@S�OP�\�\�\�S\'�W�\�[]]]�E��ھ2jԨ#UhH���>�U�\�tvv�/\������SE���\�V��F�T�\�B��\�6��>��=HE�F��R<��R��\�\0�zޥ\Z@S(�J?��T\�G\0c���^�\Z@3u^����\�՝\�\0\�Th��5��Ub�GR��M@�)H5���e\�\�R\'6O%�\�A�n�VwD9�f\r�_\�	M*��\�\�T�E�����дRGvgjsTb\�ĉ_q���j#NS�\�C\�ש=�{S?��\��͍)!Th��\'�m�\���kL�\�����r�|oZ�}D%v�_Lu\�\'֩\�j\���=���\�e\0�Je�j\0�\�\�Mq�\�]��n�N1R5���eٴ\�\�\�P��\��\�6�\�|R5�V^۝A�3t\�\�Cb\Z�\�ַ���\"@����!��d�\���S-V���<lذ\�U(B\�v\�\�!�\�k�1\n�р��\��\�8L�\�5(�J�J5\�l\�P\�x,u~�)\�\�G�\�@1�����!�dQ���:�\��\�.��\0RL�\�p���8\�_P\��\�\�\�Q�\�{ \�����\0E���C���k\���~\�?\�L�mmm\�[�@\�ť%��S4\���k\0ĵ\0N?���X�\0�8;��V�\�\�_\�r��\��=�PK\�����\�~ت�_\\�7��\��\�ۃ,q�:�s|�U\�\�O���\�9\0wZ\�\0����\�k�߫T*}5u�[\�\����v���8��u��;\�\��\�XK`�#�%����:�_\�&��;�f\�\�y�yi�R��~��R�=�~�M\'Z�\0{�\�,u��7�\�\�\�\��\�ج�ګg�u\�Q�*�ޏV���%\���G�\Zud\��_Imɩ���.K`\�F/�6�I?��Rۘ�lNL	ai\�{G�*�Tn\�\����.�\�Y�\0�ߙ�N\�[\���K�җ\�\�J�r�%p`!�&�o4\�獝\�\�s\0�e\�x��6�q\��Y�,�Y��>oْ蛑����\����u�J��-5��	�\�\���\r:��\�L�\�\�H\�hK�oװ�s=�?[gg绫G/�6l\�\�@߇��48�\�>WGGǱ�\�R{����m�@����\�*�����\���6���%Џ\�\�i�;k�\���8�\\.�\�\�\����\�J�rz�|�	��ߒ�\�bK``:\�Mi\�{X�\0~�>ϙ�\n���@w\Z	|v�?Ô\��F\0��D\0�ޜ\��O����~R\�??vN�\�\�,\r��	�OB\0�Cz\�\�\�W�v�%08!�f\�?>�\�\��ߟ\����\�/�=�PK`�B\�\�N\Z��9r\�Gc?Dj�ӷY\0\�\�\�ux�=��\��i\���nai\0�8\nhO!\�_j�kT/s�%0x���\n�r��9f\�\����z!��,�\r�\�( \�ob\�sz\�ϫ>@Ȳlao��xpPz�\'cZ�����:@�(�J�\��þ��^�\�SO}WzͿ�\�\\�n߫\�\0\r&u\�\�\�`C_��ӯ^�xI��J4���X-\�\�\���x\�\�\��R\0�i\�ĉ�2@c�VD\��Z1i\n�7\�\�oU�9B���\�O\�t�=���[=�Uh����\�qIk�WF\0��\�	\�\\�5�\'�����#��h�\�S��P\��/\�\� �	\�\�\�r�@\�@\n@\���\�\�NL��:�\�,{���\�\�	\���\�\���`\\�%u��\�b0}qD\0�\05�n\Z�\�?\�Ieq9ȸ,�r�^\0\���ڈ �A��Lm�R�v\0\��ܖc�=�\�84��(%@1�ǻ\�����������韌\0\0�<\0\�z�?�\�\��n��C=��	\0\Z#\0�2\�og�e7A��\�\���!\0\Z7\0�T\�\��\�[\�@�ݴ�\���`W|}\�\��}>���\r�=��{\0�\�E\04O\0\�.��!\0v�\0�$\0v�\056\r������}���{tW\�\��U�(�`pG{�i��G�[\0��O�6��MA\0M}yt�\�\0\Z4z;j��\�\�\� ��va/k\�}y\��$%h�A\�$\0\0�lDP7\rٻYD\�\�|\0�&\�6|\0\�b#�}	\0\�\"#�}\�\�\0@��f\�P\�;�\n9\"�\�C\0\0�\�\�/\0���\�º\0p&0@�\�\���1(@1G#F�\�\0@AUC\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0�\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0\Z�\�_��\�z�h\�\�\�SdYv�J�n�\�M�:t\�!�P�\�@�\\�\\�\0Z?z\�7�\�(\0����\0�ˌ\0\n*���]�@�F=��\0Z\\t��Ɵ\�\�\�a�\�;\�x+�5�ͮT*7vuu�j\0M���\��ԱOO�\�8[��p\�-Y�\�O�WE�&\\�O��}��\����\�E�md\0\�$��\��q\�\��\�s\�\�o�\���G\�_z\�|\�ƍy�ە+W\�O<�D����$7n\\o\�I�Q*�NS]�G�tttl�\����\�o�t�o��V��\�̙��?~\�0\�\�|���\�?)�{\�g�:�\�w\�}yWW�\�\0\ZYlJ��~\�\�s\�=���_|1?���\�4\� b\'p�>��\�\�ߗ\��\� �\�Y\�\0\�(��M@}5\�mD�æ�GU`\�y\0��b@�}��b3��\00H\�D����6oޜ��o}\�[���\�[\n\0� �ԟ	����s\�nwfqjGX\Z\0,լ\�| ��\��\�b�!K`�U\'�\�\��\�\�\�\�n\�nZ	K`\�C`\�E\�c*����\�6	��4\0X\�|�\�X�|���@�7P?\r��0�#�mqm2��\�W���� ��`\0FB\0`0\�\'\0P쑀��\0\n\�\0(��~�`�1���|\�\�\0�)\��\��\�(��ӿ~с\r\�_{\�,�\0�(�\'�{t=�\�fԕ\�\�8\�Wh$q�߸\�o_cx̘1�1ЈJ�\�i���\"�jD#��\0����Su�\�\n�\� 6\r\�>�\�Y�\0v\����U�	��v\�М9s��0\�	&l\��\�\�\n\0�\��\�\��\�o\"�3�{챞��j�\�\�ml󏠈3�\�O�\�`@�����G\r`{\�N`�&\����\'\�\�,ޛgǉ`�J峪\�\�b��\�\\C1:XU?\ru\��kc2��\�T\0\0\0\0\0\0\0\0\0\0\0\0�\���\�\��l\�\0\�\0\0\0\0IEND�B`�',1),('7506',1,'processes/Entrust.bpmn20.xml','7505','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1559029209409\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\n  <process id=\"Entrust\" isClosed=\"false\" isExecutable=\"true\" name=\"委托\" processType=\"None\">\n    <startEvent id=\"start\" name=\"开始\">\n      <extensionElements>\n        <activiti:formProperty id=\"EntrustID\" name=\"ID of entrust\" required=\"true\" type=\"String\"/>\n      </extensionElements>\n    </startEvent>\n    <userTask activiti:assignee=\"${ClientID}\" activiti:exclusive=\"true\" id=\"submitEntrust\" name=\"ToSubmit\">\n      <extensionElements>\n        <activiti:formProperty id=\"user\" name=\"client\" type=\"string\" value=\"client\"/>\n      </extensionElements>\n    </userTask>\n    <userTask activiti:candidateGroups=\"${WorkerIDs}\" activiti:exclusive=\"true\" id=\"reviewEntrust\" name=\"ToReview\">\n      <extensionElements>\n        <activiti:formProperty id=\"reviewEntrustResult\" name=\"Do you approve this request?\" required=\"true\" type=\"String\"/>\n        <activiti:formProperty id=\"user\" name=\"worker\" type=\"string\" value=\"worker\"/>\n        <activiti:formProperty id=\"reviewEntrustComment\" name=\"reason about pass or reject the consign\" required=\"true\" type=\"string\"/>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"end\" name=\"结束\"/>\n    <sequenceFlow id=\"fSubmitToReview\" sourceRef=\"submitEntrust\" targetRef=\"reviewEntrust\"/>\n    <sequenceFlow id=\"fStartToSubmit\" sourceRef=\"start\" targetRef=\"submitEntrust\"/>\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"approveGate\" name=\"是否通过\"/>\n    <sequenceFlow id=\"fReviewToApprove\" sourceRef=\"reviewEntrust\" targetRef=\"approveGate\"/>\n    <sequenceFlow id=\"fApproveToEnd\" name=\"通过\" sourceRef=\"approveGate\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewPass\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"fApproveToSubmit\" name=\"未通过\" sourceRef=\"approveGate\" targetRef=\"submitEntrust\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reviewEntrustResult == \'ReviewDisprove\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\n    <bpmndi:BPMNPlane bpmnElement=\"Entrust\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"45.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"submitEntrust\" id=\"Shape-submitEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reviewEntrust\" id=\"Shape-reviewEntrust\">\n        <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"205.0\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"55.0\" width=\"85.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"Shape-end\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"approveGate\" id=\"Shape-approveGate\" isMarkerVisible=\"false\">\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"230.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"fStartToSubmit\" id=\"BPMNEdge_fStartToSubmit\" sourceElement=\"start\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"246.0\" y=\"77.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fReviewToApprove\" id=\"BPMNEdge_fReviewToApprove\" sourceElement=\"reviewEntrust\" targetElement=\"approveGate\">\n        <omgdi:waypoint x=\"246.0\" y=\"355.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"450.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fSubmitToReview\" id=\"BPMNEdge_fSubmitToReview\" sourceElement=\"submitEntrust\" targetElement=\"reviewEntrust\">\n        <omgdi:waypoint x=\"247.5\" y=\"215.0\"/>\n        <omgdi:waypoint x=\"247.5\" y=\"300.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToSubmit\" id=\"BPMNEdge_fApproveToSubmit\" sourceElement=\"approveGate\" targetElement=\"submitEntrust\">\n        <omgdi:waypoint x=\"262.0\" y=\"466.0\"/>\n        <omgdi:waypoint x=\"375.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"290.0\" y=\"187.5\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"fApproveToEnd\" id=\"BPMNEdge_fApproveToEnd\" sourceElement=\"approveGate\" targetElement=\"end\">\n        <omgdi:waypoint x=\"246.0\" y=\"482.0\"/>\n        <omgdi:waypoint x=\"246.0\" y=\"615.0\"/>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('7507',1,'processes/Entrust.Entrust.png','7505','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0�\0\0\0�g\"\0\0*�IDATx\�\�\��\\e�7�\�*��Km�ReQ�JQEaY,��e\�.�ee�L�tO&��Q \�x\�2K��P�B��*���P(���(�	1�bH !&$!$!�@r����u�\�}.\�}~���z����\�93\���\��!C��<�\����Oy~\�\�ny�<�hʺ��?���/��ϻ2��kϋ\�D���\�\��\�Ϟ^\\���mʿ7d����yC\0h,�\���\�/�ۉ\�y\�Z�/��Z�|�~fj?�\�\��\�t\��՟;ss�OK��K\���vx\�y+��\�\�\�mɯO���\0\r\�<�v\�g����-\��n?z\�m�_\�%4\�ImFj?�\�M/�ۇ.�\�\�E�\�𼱵\�\�M\��T~���6���j4\�(\���MO\�\�\�\��̆جs{j�I\�릭^�n��\�~2oKl\Z�6�\�5\���X\��s�?��>徵��jAr\����\�\�ڈ 6-��Qq�xl\��\�\�׾�:�?Ě}jǤ�\��\�:��\�EG~Ã�gNݔ?��6\��c;>�:�\�\�dt\��.z6n�;\�\�*\rЀ������]��<:�?��?{\�oW�������_�\��kϻz�k\���?�l�&6��\�O\�����\�\�\�\�H�gg�\�K�[U\Z���N��\��\�5�Y�=�\��sf-ϟ�\��\��\�\�6k\���k���\r�u�\�\�\��\�x\�Ol��{�a�}&�F�\Z+\0ڪ�~�\Z;o\�\�UO\���\�vdj���ѵ�\���ԎJ_̩>�\�\�>�{�;��0/\�/O�\��\��\�>�V\�\�\�_��g\�1*\�X!��կ?�|�ϽwM�\�w/�\�\�߮~\"O-�|����\�0}��I�[��\�.�\�\�82��\�k�}t\�\��\�\�\�Tk�_ D\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\��a�\���o�\���&M\����=\�\�\�\�G��wvv\�_�\�W�	&l��\�_\Z;v\�\�T�,[��\�\�[o}�+_�J~\�\�\�?���Gy$_�|y�q\�\�<l޼9_�re�\�c�\�\�v[~\�9\�\�cƌ\�:~���\�\���\�|k�GL�6m��矟�5�|\�ܹ=��ޚ?~�F\r�\�g���Q\�\�*\n\�Dk�\�^{\�\�q\�\�\�s\�\�\�ĳ\�>��;6���rWW\�a�\��֭[7v	�u\�]����\�y_�\�F�z\�wޫ64� \�\�+�\�\�z뭼�\�x\�1\"xe\�С��6@�}\0�	(\�\��#\0j��\�|\�ȑ�U��\�N\�\�\�W��v�i\�s\�\�Z.�ǩ:@�\�@qP4bgqGG\��\0\Z@����K/�t�#\�Q}�Agǉ`5\n�y\�g�4x\�Nb�A4y�\�\�ƙ���3xW����dYv��\00Hb.��\nb0\\}�\�o�1b��\00Hb2��h0<��\�o�Xb)\0��\r4&��W�ޚB�\�R\0$1\rtm6Ё\�\�TԖ� �Nx0	�At\�g\�H`�\0D_�\�\�m��ʕ+7\�\'\00�.�\�\��::\���\�_\�\� �At\�%�,��&L��\�y\0�h\�ر_�k\�\�1m�3�?��\�A�gώMA\�l^x\�W]uՀ��\�ѣW�E�\�\��\�/n�?�����\�\�1\np=�1f̘	qa����\�o���R�lve1�s\�9\�,��\��s\'�\��+�,[�\�\0\r&vҦ�\�n��?�`\���\��\Z\�\�\�\'\�h\� =z�\�\�|\�;��\r�l\�y\�;��\�\0\�A\�\�ٹ�K_�\�֧�z\�w\�>�\�d\0\�Db\�\�ȑ#ߺ袋ތ0ؗMD�?���\�\�P=\n\�N`�fk\�i-��6?jԨ��&Mzcƌo�X�bK\\�6hL����� \�L\�\��\�<\0�\0ZD\�\�;S��\�\�q}༮u\�6�\�f\�T\�(F0\�\'N<X%\0\n\Z�G�>T%\0\n\Z\�\�\���\0\���v�8R{�J\04�,{�J\0P�\\\�\�\�\�v�J\07�W	�\Z1b\�[\�\�\�V	�b�@\\,�#*P\�(�J\'�@�\�\�\�Ç��J\03�\�\�\��U%\0\nhĈ�J�\�0�\0(flLm�J\03\�(\'*P\�X�Q	�b���\�\�T	�*�˯��%�\0(\�H\�\�\�\�S	�b�֦6N%\0�9X�\�7T��#�եR\�\�*P̑�\�\�&�@1C`E�e�@1C`yj��@�Q�\�J�r�J\0s$�\�r�|�J\03^L\�z�\0(�,\�V*�U��#�\�\�\��T��!���\0\��gR��J\0P�e�Sܮ\0\���)\�P	�J0\'�;U��!�Dj�V	�b����ݣ\0\��\�Y�ݧ\0\��?���\0T.�g���\0A�\0\��ɱIH%\0��\�\�a�\0(�R��\�r��G�\0(fܝB\�q�\0(f�*���T���,�ň#�R	�b��\�R\�S	�JpkjO�@ť%\��*P\��A\\l^%\0\n�R�ܘe\�B�\0(�4\n�>�U��\�\��\�)��\0T�T�ʲl�J\0s$py\Z	,S	�b�.I#�*P\��(��J�\0(f�O!�J%\0\n�T*]0bĈ5*P\��j�\\~E%\0\n(�\�K\�U�\0(�4\n�Rj��@1Gg��N%\0����W	�*\')\�P	�b����Q%\0\n�R�|>˲M*P\��l\Z	t�@�\�\�SRlV	�b��\'�\0@A\�N\�\��=�%*Кk��\�)J�\�i*P\�\��bhaY�M\�Utttd*\����u���\�L$.\�1\�\��*P� x�.\\]�HҚ���Q�8(\�h@%\0\n�T*}[\0�<\�Y�p\�ٳg\�S�N\�\'O��\�G�2eJ�\�CmM\�FU@ӈ\0�9sf�r\�ʼ��[;��jժ|��\�[S L�4���\r�420\�5\�b�λo[l�4�\�t\�B\0�m\�_]�/|\�\���)�\�\�\�\�O�/��uk_\�\�\�?!\�\�on\�\�xL\�/��%��S\0\�\�\���\���\0\�\�!�̃��\��\�t�B\0h\��7y\�.C \��@hB\0h\����v�_\0-fݰ\��\�t�B\0h\�X�\�\�|\�\�)(\��\���\0\�\�!m\�\�?\�)\�>��\0Z=6m\�<|\�Λ�\�}�_\0-\ZqF�s��\�\�>�x\�Y\�B\0h�Hk�\�L\��|\��]@�\�s\�FB\0h�\�\�ڿQ�\0Z8�f\�w�! �&��\r�ZB\0h\�Є\0 4!\0M\0B@�Є\0 4!\0M\0B@@�B\�\�g�͇�?��\����ޛϝ;7?�\�#�\�g_x\�������_���1\��?�\�{����5ѹ��\��|\�\�w\�}�\0\��yժU\�:\�\�d\�v�\�\�{�x^�Gϵ\n-\��~O\�!ϻ뮻�\��\�q\�=?\�\�c�\�r�\0����Z��Z3g\�\�O8\�\�\�\�\�̙\���Y�fm�oÆ\r=��/\�\�\�\�7߼\���\�\�\�	�\�����Z�dɒ�I|�e\�ҥ\�}��7\�O>�\��\�I�\�\�~�\�u?��\�\���/��Ϙ1C\0B\�@B :ܸ\�k�\����q\�=���\�o\�|���F�\�_\�曣�:j�ǎ>�\�\��\������\����=�M�:u[�\�m�C�0\Z3fL\�}k׮\�uTS{O#@`{\���\'��SG�Ӵ\�\�\�\�W^y\�v�\�)\�;\�\�\�\��}\�c\��YV�X\�s[?�\�݈E\0B�C\��@O�\�[\�\�\�߾ˀ\��\�IB\0{\�b;����\�6M�4i\�\�g�y\�\���}WWW\�H��ö�C>�\�{:\�w�\��q\��\�ccǎ\��:\�=��>�O\�˖-۶\�z\���\�q_l\Z\�-\�\�cs\��\��>!\0��\r�\�8k-ֶ\��m�c8v��v�O��_{�v�\�iGHD�ԇK�\�I\'��\�kFh�\Z5�\�5c\�n\��\�E\�Ϝr\�)=��9{;\������N;��\0 4!\0M\0B@�Є\0 4!\0M\0B@���\0! \0��\0B\0@\0! \0��\0B\0`0\�\��:n!\0\�̙3��\\�R\�\�Gm\�ҥ�St�\��´i\�.�>}�֗_~����믿ާ0eʔ7S�\�/h\Z�Ӻ8����\��\�F�ѧ���9rd~��\��\�kv\0�~!\���!^�\\.��T*7:��(HdYv_�n��0\���\�#T�\�C u�\�և@]ےڔG�<@���Yg�u\�.B��ʹ��C�:\Zؼ�\0H�mIm�\��h�\�]��\�8|��O�<@k���^\�M;���;��1\n�T*?Wu�����ê��\�\�.��\�(\��\�#����\0-\�\�^�\���4�(\��V�eǩ>@��n\���\�^u�(@C 9(�\�˩=a	\0/j\'�\�t\�Y\n\0�\�{�\�J�\�i�@�B ����bD�\�{-\r���@5\�ϱ<}y�%P�=z��\�r���-���@�T*\'\��\�v��P�\�\�\���d\0\n\�\�sgjoĴ�@�B���Ŕ�@C`ذa�ǌ��\�n	,B�T�T\�Ȳ\�lK	�`!R\0\\GuttkI,B�\\��\�Z3�0&N�xp��+Ө\�1K�`!:;;\����Ֆ@�B tttd\�G�Yj\0��e\��\�\�\�5jԑ�@�B�\Zs\�g^6Č�\0\��ꌣ��\�}��P��~\�\���}\�(X�,\�Ώ\�#G����P�)\�Ja����\0�\�\�_�\�_,I��@gg绫3�\�ji,B�\\>�zE�/X�\0�P�T.I�˛mmm\�X�\0�\�\�23�^ioo�%P��G�,[��\���,@�B �xlJ��,]���@(�͖��}\�(XT�\��u�~�\�ﱔ\n\�\�m^j/Y\�\0����w�\�o]�e�Y\�\0�j|8f-�JX\�\0�\�\�86v��G,q���@H#��\�\��\�SO}��P����f(jČ�Y�mJ��O-y���@H!�q�T*�a\�B�`!P��/KaSK\�/\0\���g��ƌ��(��q�\\.�N��G�\0B�����>X�q�J	�(\�\�_�\�*�\�g�5\0B��J�ҏR6�q�e\��Ԗ� \n�6\�h�\\�W5\0!P@\'Ɖd)��\Z�(�R��\��\�NR\r@�&��qV.���\�<��(f���v�j\0B��\�\�\��5N$K5\�T\r@�>W�qŮ\�\�q4&�S\r@LL7!a�\Z�(�\���b�j\0B���\�ű\�X5\0!P\�z\���\�!���b\�\�8�L%\0!P@1�DL+\�K� �Y��b���pN5�f\�VD����^��NL9ASP�\�!й�Ȳ\�b�ڧ �7.F�Q\r��`\�nB`\�СCQ�}���\�S�\�ԣ��V{�\n�@}�_w\\�^5�f�\��\r�7\n\��J\�\�G+�4\�h���>	��R-\�\�\�\���j\0�ˌ�^\n\�G҈`�G�F\�ή�U�o\�\�8:K5�F\r�\�0\n\��=:6�v�j\0��\�\��R\�8�,\�gT\n&\��C.\\�d�\�\��ԩS�ɓ\'k�ѦL��?�\�C[S��IC��)6uvv�\�H�̙3�+W\�\�\�\�\��U�V\�ӧOߚaR��_R[\�\n$F\0�o� ����o�6\�h�T�\�Dl\�y�m�\�C\����e\�G�\'���\���[\�K#�R�\�\�\��a�! z\��W�\��q>\����:\�\�\�^TG��q�@O[���|\���\��\�v-\�\�t��!��K�\��_�%��S\0\�\�\���\��[4b\�\�r�ܝ\���@�C\���{�!�\��[3���\�Ŏ\�\�\��[��!0o�\�]�@<�\�o\�Y�M��%\�\���ǀ�\�\�\��\�8\n�8\ZhW!�\��[?b\�\�r��J\n���k�`!�`\�\r��xL\�\��!\�\�ڎ�\�B�J\��9P�X�\�\�|\�\�)(\��\���!��3�>�\��{� !m\�\�?\�)\�>�~�B�\Z�� \�h\�Q(Jlڔ/x�Ɲ7��\�1�B�\Zϙq\nqF�s��\�\�>�x\�Y\�\�����ò,ې\�\�.�EЊ!�\��/�������Z�\�\�s�\n�a\�ȑ�\�R�\�?	Z(���oT jF��q4��o�	��Y�\�ݨ@L.Ե�S\0<�F��=�P�Q\�!��PkB�X!���`Y�es�GA��&�ըQ��LAН�\����@��T*��\���,B��R\\�F�;;;\�\���(�,\�KA�Ҍ� �@\r:��4\"X�\��a �@utt\��Q�\��\�@�bn:;f-�J�R\rB��R\�3�6\�pՀ�g�}6:th��\�O\��\�{o>w\�\��\�#�\�\�\�͘1#?ꨣ��|}\�\'�Y�y�\�w�\�\n��-R	h�H?��Z�*_�fM\�\�\�\�\�\�ٳ�\�Q\�?/n\��ŋp|\�w��\�/� \ZD\�8�B\��\�\�T\rh�\�A�\�\�fΜ��p\�	=��\�}˖-\�y��>�\�\�?��\��\��\�\�3������\�=�5\�\\�\�,Z�s\�1۽\�ƍ�\'�|�\�\�\�\�k�r\�)��a\�z�鮻\�\��,o�\��\�\\��r���\�?�n\�U\r(@Dg�E�]�zܸqۅ�\�7ߜ\�y\��?�\�?n\�\�\�c�\\rɶ��\�+vz,��������\�o߮�3fL\�s֮]�Ө��׬�Bj�G@\�m}h	��Q�T\�\�C\��Հ�c�=v�m����M6q��\�\�sb4��{\�=\�������\�~\�MIK�.�\�\�\�\�5k��\�\�\�\�%K�@?Ȳlr\Z\r�f\�Qh���>�\�c\�c\�:�\�&�{g�O�ϭX�b�\�5jT�k\�}�=�f<?�%\�v\�m�;\��|Æ\r�	���qty\n�9J-�\r>:\�Y�f\�9hҤI۾>�\�3�\�S\�_���m\�)}�\�=k��\�\'�\�T��m��#�\�\�4�cp\�\�5\�H��O>�g\'���}B��xo\�/��\�{�M\�O�:u[�5��ñ�v_t��\�\�\������\�\�GG\�q\�\�r�L�\�\�B\'v�F�}�G\n�z\��̵��GB��J�\�b\�\�\�U�|$�	���F\�ňଳ\�:J5@�bn\Zz\"��ӗ�!P01\�h\n�WS{P5@�bn:�z��E�B@s�\��gR5@�J#��\�C\�\�\���\Z �@����Y�-T	B��b�B\��\�~�\Z �@�J���W$��j��B`B1\�\�\�v�j�\���qA�K�\Z �@�Č�+\�\����(��W(��\�?T\rB��RܑB �����U��(�\��\�R=��|Հ~�\�븅@#ʲlZL5=|��O����3gnY�r�λ�\�ҥK�\�����\�\�\�ߖ:��Sl\�\�\�8VE�M�6\�\�ӧo}�\�u\�}\0S�Ly3�I���;\0\�\���*�\�G��\�i]�\�^\�\�f�Fm�c��?_�u��\�\�\�����ץ��s�m&N�xp��J���\���Ժ\�r~X5�\�=�P!\�\�P�^T\�\����\�0!КJ�\�qhjW�Ы\�\�\�w�֓e\���\�\0��\Z�.�~�\�\�I�\�V�h�\�7���i�~N5�݊�cR�!Z@u\'��\�6��!�(\�\�\�SO}W\Z,I\�\0\�U`�����:�-*\�ܣ��6@j�\�\�\�ߩ\"�����B�yutt�X\���D�� �IZs�pG�ͧR�|>-�7S��F5���:���@�ɲ\��\�9\0׫�\�bJ�X�T��\n�I\�s\0��\Z�)�J��y\�U�iB��1rKAЮ\Z@_t*���pP\��I˪{\�ȑU�OT*�\�FǢ�+&�K�0�k\���*�e|>u,�T�1U��X�ڲ�(��\0}*u.\�\�8s�h<qGZ6o�6/��P�\�utt��@��J4��L>Gm�\�ɪ��r�<2.:�\r\0g\�Y\�)~�\Z@��Rg�^%\ZC�R��\Z\0T��θ\0�J��~Z=�S5�Q*����Ġ���6\�\�{�\�H \�yU%G{{�\�\�2x66\�Ŵ\�*���9.��*1��\rvx\��W��2���\"��K\�7R[�>;:�Ť\0~n\�С��0(J�ҷSG�Z%�\�\'\�T�\�T\r`�Gbs�JX�+1hj��\��\�\�\�^V��uU�L5��P.�/M�\�r�\�_Y�}�z!�/�\�H#�+R{I%�5\0\�y�b\�n\�\0\ZJ꘮J�\�R�\�{1�g\�����@S�OP�\�\�\�S\'�W�\�[]]]�E��ھ2jԨ#UhH���>�U�\�tvv�/\������SE���\�V��F�T�\�B��\�6��>��=HE�F��R<��R��\�\0�zޥ\Z@S(�J?��T\�G\0c���^�\Z@3u^����\�՝\�\0\�Th��5��Ub�GR��M@�)H5���e\�\�R\'6O%�\�A�n�VwD9�f\r�_\�	M*��\�\�T�E�����дRGvgjsTb\�ĉ_q���j#NS�\�C\�ש=�{S?��\��͍)!Th��\'�m�\���kL�\�����r�|oZ�}D%v�_Lu\�\'֩\�j\���=���\�e\0�Je�j\0�\�\�Mq�\�]��n�N1R5���eٴ\�\�\�P��\��\�6�\�|R5�V^۝A�3t\�\�Cb\Z�\�ַ���\"@����!��d�\���S-V���<lذ\�U(B\�v\�\�!�\�k�1\n�р��\��\�8L�\�5(�J�J5\�l\�P\�x,u~�)\�\�G�\�@1�����!�dQ���:�\��\�.��\0RL�\�p���8\�_P\��\�\�\�Q�\�{ \�����\0E���C���k\���~\�?\�L�mmm\�[�@\�ť%��S4\���k\0ĵ\0N?���X�\0�8;��V�\�\�_\�r��\��=�PK\�����\�~ت�_\\�7��\��\�ۃ,q�:�s|�U\�\�O���\�9\0wZ\�\0����\�k�߫T*}5u�[\�\����v���8��u��;\�\��\�XK`�#�%����:�_\�&��;�f\�\�y�yi�R��~��R�=�~�M\'Z�\0{�\�,u��7�\�\�\�\��\�ج�ګg�u\�Q�*�ޏV���%\���G�\Zud\��_Imɩ���.K`\�F/�6�I?��Rۘ�lNL	ai\�{G�*�Tn\�\����.�\�Y�\0�ߙ�N\�[\���K�җ\�\�J�r�%p`!�&�o4\�獝\�\�s\0�e\�x��6�q\��Y�,�Y��>oْ蛑����\����u�J��-5��	�\�\���\r:��\�L�\�\�H\�hK�oװ�s=�?[gg绫G/�6l\�\�@߇��48�\�>WGGǱ�\�R{����m�@����\�*�����\���6���%Џ\�\�i�;k�\���8�\\.�\�\�\����\�J�rz�|�	��ߒ�\�bK``:\�Mi\�{X�\0~�>ϙ�\n���@w\Z	|v�?Ô\��F\0��D\0�ޜ\��O����~R\�??vN�\�\�,\r��	�OB\0�Cz\�\�\�W�v�%08!�f\�?>�\�\��ߟ\����\�/�=�PK`�B\�\�N\Z��9r\�Gc?Dj�ӷY\0\�\�\�ux�=��\��i\���nai\0�8\nhO!\�_j�kT/s�%0x���\n�r��9f\�\����z!��,�\r�\�( \�ob\�sz\�ϫ>@Ȳlao��xpPz�\'cZ�����:@�(�J�\��þ��^�\�SO}WzͿ�\�\\�n߫\�\0\r&u\�\�\�`C_��ӯ^�xI��J4���X-\�\�\���x\�\�\��R\0�i\�ĉ�2@c�VD\��Z1i\n�7\�\�oU�9B���\�O\�t�=���[=�Uh����\�qIk�WF\0��\�	\�\\�5�\'�����#��h�\�S��P\��/\�\� �	\�\�\�r�@\�@\n@\���\�\�NL��:�\�,{���\�\�	\���\�\���`\\�%u��\�b0}qD\0�\05�n\Z�\�?\�Ieq9ȸ,�r�^\0\���ڈ �A��Lm�R�v\0\��ܖc�=�\�84��(%@1�ǻ\�����������韌\0\0�<\0\�z�?�\�\��n��C=��	\0\Z#\0�2\�og�e7A��\�\���!\0\Z7\0�T\�\��\�[\�@�ݴ�\���`W|}\�\��}>���\r�=��{\0�\�E\04O\0\�.��!\0v�\0�$\0v�\056\r������}���{tW\�\��U�(�`pG{�i��G�[\0��O�6��MA\0M}yt�\�\0\Z4z;j��\�\�\� ��va/k\�}y\��$%h�A\�$\0\0�lDP7\rٻYD\�\�|\0�&\�6|\0\�b#�}	\0\�\"#�}\�\�\0@��f\�P\�;�\n9\"�\�C\0\0�\�\�/\0���\�º\0p&0@�\�\���1(@1G#F�\�\0@AUC\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0�\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0�\0\0B\0\0!\0�\0@\0!\0 \0\0\0�\0\0B\0\0!\0�\0@\0 \0\0\0\Z�\�_��\�z�h\�\�\�SdYv�J�n�\�M�:t\�!�P�\�@�\\�\\�\0Z?z\�7�\�(\0����\0�ˌ\0\n*���]�@�F=��\0Z\\t��Ɵ\�\�\�a�\�;\�x+�5�ͮT*7vuu�j\0M���\��ԱOO�\�8[��p\�-Y�\�O�WE�&\\�O��}��\����\�E�md\0\�$��\��q\�\��\�s\�\�o�\���G\�_z\�|\�ƍy�ە+W\�O<�D����$7n\\o\�I�Q*�NS]�G�tttl�\����\�o�t�o��V��\�̙��?~\�0\�\�|���\�?)�{\�g�:�\�w\�}yWW�\�\0\ZYlJ��~\�\�s\�=���_|1?���\�4\� b\'p�>��\�\�ߗ\��\� �\�Y\�\0\�(��M@}5\�mD�æ�GU`\�y\0��b@�}��b3��\00H\�D����6oޜ��o}\�[���\�[\n\0� �ԟ	����s\�nwfqjGX\Z\0,լ\�| ��\��\�b�!K`�U\'�\�\��\�\�\�\�n\�nZ	K`\�C`\�E\�c*����\�6	��4\0X\�|�\�X�|���@�7P?\r��0�#�mqm2��\�W���� ��`\0FB\0`0\�\'\0P쑀��\0\n\�\0(��~�`�1���|\�\�\0�)\��\��\�(��ӿ~с\r\�_{\�,�\0�(�\'�{t=�\�fԕ\�\�8\�Wh$q�߸\�o_cx̘1�1ЈJ�\�i���\"�jD#��\0����Su�\�\n�\� 6\r\�>�\�Y�\0v\����U�	��v\�М9s��0\�	&l\��\�\�\n\0�\��\�\��\�o\"�3�{챞��j�\�\�ml󏠈3�\�O�\�`@�����G\r`{\�N`�&\����\'\�\�,ޛgǉ`�J峪\�\�b��\�\\C1:XU?\ru\��kc2��\�T\0\0\0\0\0\0\0\0\0\0\0\0�\���\�\��l\�\0\�\0\0\0\0IEND�B`�',1);
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
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','22501',10),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
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
INSERT INTO `act_hi_actinst` VALUES ('10006','Entrust:4:7508','10001','10005','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-03 10:57:11.575','2019-06-03 10:57:11.585',10,NULL,''),('10007','Entrust:4:7508','10001','10005','submitEntrust','10008',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:57:11.595',NULL,NULL,NULL,''),('12506','Entrust:4:7508','12501','12505','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-03 10:58:39.272','2019-06-03 10:58:39.276',4,NULL,''),('12507','Entrust:4:7508','12501','12505','submitEntrust','12508',NULL,'ToSubmit','userTask','201906031001','2019-06-03 10:58:39.279',NULL,NULL,NULL,''),('17506','Entrust:5:15006','17501','17505','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:15.331','2019-06-04 11:50:15.333',2,NULL,''),('17507','Entrust:5:15006','17501','17505','submitEntrust','17508',NULL,'ToSubmit','userTask','u20190604195010','2019-06-04 11:50:15.335',NULL,NULL,NULL,''),('17515','Entrust:5:15006','17510','17514','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:16.843','2019-06-04 11:50:16.844',1,NULL,''),('17516','Entrust:5:15006','17510','17514','submitEntrust','17517',NULL,'ToSubmit','userTask','u20190604195010','2019-06-04 11:50:16.844',NULL,NULL,NULL,''),('17524','Entrust:5:15006','17519','17523','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:18.257','2019-06-04 11:50:18.257',0,NULL,''),('17525','Entrust:5:15006','17519','17523','submitEntrust','17526',NULL,'ToSubmit','userTask','u20190604195011','2019-06-04 11:50:18.258',NULL,NULL,NULL,''),('17533','Entrust:5:15006','17528','17532','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:19.365','2019-06-04 11:50:19.366',1,NULL,''),('17534','Entrust:5:15006','17528','17532','submitEntrust','17535',NULL,'ToSubmit','userTask','u20190604195013','2019-06-04 11:50:19.366',NULL,NULL,NULL,''),('17542','Entrust:5:15006','17537','17541','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:21.269','2019-06-04 11:50:21.269',0,NULL,''),('17543','Entrust:5:15006','17537','17541','submitEntrust','17544',NULL,'ToSubmit','userTask','u20190604195014','2019-06-04 11:50:21.269',NULL,NULL,NULL,''),('17551','Entrust:5:15006','17546','17550','start',NULL,NULL,'开始','startEvent',NULL,'2019-06-04 11:50:22.656','2019-06-04 11:50:22.656',0,NULL,''),('17552','Entrust:5:15006','17546','17550','submitEntrust','17553',NULL,'ToSubmit','userTask','u20190604195014','2019-06-04 11:50:22.656',NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_identitylink` VALUES ('10009',NULL,'participant','201906031001',NULL,'10001'),('12509',NULL,'participant','201906031001',NULL,'12501'),('17509',NULL,'participant','u20190604195010',NULL,'17501'),('17518',NULL,'participant','u20190604195010',NULL,'17510'),('17527',NULL,'participant','u20190604195011',NULL,'17519'),('17536',NULL,'participant','u20190604195013',NULL,'17528'),('17545',NULL,'participant','u20190604195014',NULL,'17537'),('17554',NULL,'participant','u20190604195014',NULL,'17546');
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
INSERT INTO `act_hi_procinst` VALUES ('17501','17501',NULL,'Entrust:5:15006','2019-06-04 11:50:15.275',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('17510','17510',NULL,'Entrust:5:15006','2019-06-04 11:50:16.843',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('17519','17519',NULL,'Entrust:5:15006','2019-06-04 11:50:18.257',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('17528','17528',NULL,'Entrust:5:15006','2019-06-04 11:50:19.365',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('17537','17537',NULL,'Entrust:5:15006','2019-06-04 11:50:21.268',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL),('17546','17546',NULL,'Entrust:5:15006','2019-06-04 11:50:22.655',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('17508','Entrust:5:15006','submitEntrust','17501','17505','ToSubmit',NULL,NULL,NULL,'u20190604195010','2019-06-04 11:50:15.350',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17517','Entrust:5:15006','submitEntrust','17510','17514','ToSubmit',NULL,NULL,NULL,'u20190604195010','2019-06-04 11:50:16.844',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17526','Entrust:5:15006','submitEntrust','17519','17523','ToSubmit',NULL,NULL,NULL,'u20190604195011','2019-06-04 11:50:18.258',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17535','Entrust:5:15006','submitEntrust','17528','17532','ToSubmit',NULL,NULL,NULL,'u20190604195013','2019-06-04 11:50:19.366',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17544','Entrust:5:15006','submitEntrust','17537','17541','ToSubmit',NULL,NULL,NULL,'u20190604195014','2019-06-04 11:50:21.269',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,''),('17553','Entrust:5:15006','submitEntrust','17546','17550','ToSubmit',NULL,NULL,NULL,'u20190604195014','2019-06-04 11:50:22.656',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_varinst` VALUES ('17502','17501','17501',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195010',NULL,'2019-06-04 11:50:15.329','2019-06-04 11:50:15.329'),('17503','17501','17501',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195015',NULL,'2019-06-04 11:50:15.330','2019-06-04 11:50:15.330'),('17504','17501','17501',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:15.330','2019-06-04 11:50:15.330'),('17511','17510','17510',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195010',NULL,'2019-06-04 11:50:16.843','2019-06-04 11:50:16.843'),('17512','17510','17510',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195016',NULL,'2019-06-04 11:50:16.843','2019-06-04 11:50:16.843'),('17513','17510','17510',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:16.843','2019-06-04 11:50:16.843'),('17520','17519','17519',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195011',NULL,'2019-06-04 11:50:18.257','2019-06-04 11:50:18.257'),('17521','17519','17519',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195018',NULL,'2019-06-04 11:50:18.257','2019-06-04 11:50:18.257'),('17522','17519','17519',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:18.257','2019-06-04 11:50:18.257'),('17529','17528','17528',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195013',NULL,'2019-06-04 11:50:19.365','2019-06-04 11:50:19.365'),('17530','17528','17528',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195019',NULL,'2019-06-04 11:50:19.365','2019-06-04 11:50:19.365'),('17531','17528','17528',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:19.365','2019-06-04 11:50:19.365'),('17538','17537','17537',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195014',NULL,'2019-06-04 11:50:21.268','2019-06-04 11:50:21.268'),('17539','17537','17537',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195021',NULL,'2019-06-04 11:50:21.268','2019-06-04 11:50:21.268'),('17540','17537','17537',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:21.268','2019-06-04 11:50:21.268'),('17547','17546','17546',NULL,'ClientID','string',0,NULL,NULL,NULL,'u20190604195014',NULL,'2019-06-04 11:50:22.655','2019-06-04 11:50:22.655'),('17548','17546','17546',NULL,'EntrustID','string',0,NULL,NULL,NULL,'p20190604195022',NULL,'2019-06-04 11:50:22.655','2019-06-04 11:50:22.655'),('17549','17546','17546',NULL,'WorkerIDs','string',0,NULL,NULL,NULL,'w2',NULL,'2019-06-04 11:50:22.656','2019-06-04 11:50:22.656');
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-05-30 13:08:27.016',NULL),('15001','SpringAutoDeployment',NULL,NULL,'','2019-06-04 11:49:32.248',NULL),('20001','SpringAutoDeployment',NULL,NULL,'','2019-06-05 05:41:31.246',NULL),('2501','SpringAutoDeployment',NULL,NULL,'','2019-06-02 08:52:12.220',NULL),('5001','EntrustProcess测试',NULL,NULL,'','2019-06-03 06:48:13.221',NULL),('7501','EntrustProcess测试',NULL,NULL,'','2019-06-03 06:53:22.625',NULL),('7505','EntrustProcess测试',NULL,NULL,'','2019-06-03 06:53:24.508',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('Entrust:1:2506',1,'http://www.activiti.org/test','委托','Entrust',1,'2501','/home/czf/桌面/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/czf/桌面/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:2:5004',1,'http://www.activiti.org/test','委托','Entrust',2,'5001','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:3:7504',1,'http://www.activiti.org/test','委托','Entrust',3,'7501','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:4:7508',1,'http://www.activiti.org/test','委托','Entrust',4,'7505','processes/Entrust.bpmn20.xml','processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:5:15006',1,'http://www.activiti.org/test','委托','Entrust',5,'15001','/home/dell/stconline/server/target/classes/processes/Entrust.bpmn20.xml','/home/dell/stconline/server/target/classes/processes/Entrust.Entrust.png',NULL,0,1,1,'',NULL),('Entrust:6:20007',1,'http://www.activiti.org/test','委托','Entrust',6,'20001','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.bpmn20.xml','E:\\Git\\stconline\\server\\target\\classes\\processes\\Entrust.Entrust.png',NULL,0,1,1,'',NULL),('entrust_process:1:4',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',1,'1','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:2:2507',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',2,'2501','/home/czf/桌面/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/czf/桌面/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:3:15007',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',3,'15001','/home/dell/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/dell/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL),('entrust_process:4:20006',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',4,'20001','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.bpmn','E:\\Git\\stconline\\server\\target\\classes\\processes\\EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL);
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
INSERT INTO `act_ru_execution` VALUES ('17501',1,'17501',NULL,NULL,'Entrust:5:15006',NULL,'17501',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:15.275',NULL,NULL,0,0,0,0,0,0,0,0,0),('17505',1,'17501',NULL,'17501','Entrust:5:15006',NULL,'17501','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:15.330',NULL,NULL,0,0,0,0,0,0,0,0,0),('17510',1,'17510',NULL,NULL,'Entrust:5:15006',NULL,'17510',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:16.843',NULL,NULL,0,0,0,0,0,0,0,0,0),('17514',1,'17510',NULL,'17510','Entrust:5:15006',NULL,'17510','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:16.843',NULL,NULL,0,0,0,0,0,0,0,0,0),('17519',1,'17519',NULL,NULL,'Entrust:5:15006',NULL,'17519',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:18.257',NULL,NULL,0,0,0,0,0,0,0,0,0),('17523',1,'17519',NULL,'17519','Entrust:5:15006',NULL,'17519','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:18.257',NULL,NULL,0,0,0,0,0,0,0,0,0),('17528',1,'17528',NULL,NULL,'Entrust:5:15006',NULL,'17528',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:19.365',NULL,NULL,0,0,0,0,0,0,0,0,0),('17532',1,'17528',NULL,'17528','Entrust:5:15006',NULL,'17528','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:19.365',NULL,NULL,0,0,0,0,0,0,0,0,0),('17537',1,'17537',NULL,NULL,'Entrust:5:15006',NULL,'17537',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:21.268',NULL,NULL,0,0,0,0,0,0,0,0,0),('17541',1,'17537',NULL,'17537','Entrust:5:15006',NULL,'17537','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:21.269',NULL,NULL,0,0,0,0,0,0,0,0,0),('17546',1,'17546',NULL,NULL,'Entrust:5:15006',NULL,'17546',NULL,1,0,1,0,0,1,NULL,'',NULL,'2019-06-04 11:50:22.655',NULL,NULL,0,0,0,0,0,0,0,0,0),('17550',1,'17546',NULL,'17546','Entrust:5:15006',NULL,'17546','submitEntrust',1,0,0,0,0,1,NULL,'',NULL,'2019-06-04 11:50:22.656',NULL,NULL,0,0,0,0,0,0,0,0,0);
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
INSERT INTO `act_ru_identitylink` VALUES ('17509',1,NULL,'participant','u20190604195010',NULL,'17501',NULL),('17518',1,NULL,'participant','u20190604195010',NULL,'17510',NULL),('17527',1,NULL,'participant','u20190604195011',NULL,'17519',NULL),('17536',1,NULL,'participant','u20190604195013',NULL,'17528',NULL),('17545',1,NULL,'participant','u20190604195014',NULL,'17537',NULL),('17554',1,NULL,'participant','u20190604195014',NULL,'17546',NULL);
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
INSERT INTO `act_ru_task` VALUES ('17508',1,'17505','17501','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195010',NULL,50,'2019-06-04 11:50:15.335',NULL,NULL,1,'',NULL,NULL),('17517',1,'17514','17510','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195010',NULL,50,'2019-06-04 11:50:16.844',NULL,NULL,1,'',NULL,NULL),('17526',1,'17523','17519','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195011',NULL,50,'2019-06-04 11:50:18.258',NULL,NULL,1,'',NULL,NULL),('17535',1,'17532','17528','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195013',NULL,50,'2019-06-04 11:50:19.366',NULL,NULL,1,'',NULL,NULL),('17544',1,'17541','17537','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195014',NULL,50,'2019-06-04 11:50:21.269',NULL,NULL,1,'',NULL,NULL),('17553',1,'17550','17546','Entrust:5:15006','ToSubmit',NULL,NULL,'submitEntrust',NULL,'u20190604195014',NULL,50,'2019-06-04 11:50:22.656',NULL,NULL,1,'',NULL,NULL);
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
INSERT INTO `act_ru_variable` VALUES ('17502',1,'string','ClientID','17501','17501',NULL,NULL,NULL,NULL,'u20190604195010',NULL),('17503',1,'string','EntrustID','17501','17501',NULL,NULL,NULL,NULL,'p20190604195015',NULL),('17504',1,'string','WorkerIDs','17501','17501',NULL,NULL,NULL,NULL,'w2',NULL),('17511',1,'string','ClientID','17510','17510',NULL,NULL,NULL,NULL,'u20190604195010',NULL),('17512',1,'string','EntrustID','17510','17510',NULL,NULL,NULL,NULL,'p20190604195016',NULL),('17513',1,'string','WorkerIDs','17510','17510',NULL,NULL,NULL,NULL,'w2',NULL),('17520',1,'string','ClientID','17519','17519',NULL,NULL,NULL,NULL,'u20190604195011',NULL),('17521',1,'string','EntrustID','17519','17519',NULL,NULL,NULL,NULL,'p20190604195018',NULL),('17522',1,'string','WorkerIDs','17519','17519',NULL,NULL,NULL,NULL,'w2',NULL),('17529',1,'string','ClientID','17528','17528',NULL,NULL,NULL,NULL,'u20190604195013',NULL),('17530',1,'string','EntrustID','17528','17528',NULL,NULL,NULL,NULL,'p20190604195019',NULL),('17531',1,'string','WorkerIDs','17528','17528',NULL,NULL,NULL,NULL,'w2',NULL),('17538',1,'string','ClientID','17537','17537',NULL,NULL,NULL,NULL,'u20190604195014',NULL),('17539',1,'string','EntrustID','17537','17537',NULL,NULL,NULL,NULL,'p20190604195021',NULL),('17540',1,'string','WorkerIDs','17537','17537',NULL,NULL,NULL,NULL,'w2',NULL),('17547',1,'string','ClientID','17546','17546',NULL,NULL,NULL,NULL,'u20190604195014',NULL),('17548',1,'string','EntrustID','17546','17546',NULL,NULL,NULL,NULL,'p20190604195022',NULL),('17549',1,'string','WorkerIDs','17546','17546',NULL,NULL,NULL,NULL,'w2',NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
-- Table structure for table `tbl_sys_entrust`
--

DROP TABLE IF EXISTS `tbl_sys_entrust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sys_entrust` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `process_instance_id` varchar(255) DEFAULT NULL,
  `process_state` int(11) DEFAULT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
INSERT INTO `tbl_sys_entrust` VALUES (1,'17501',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195015',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,'17510',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195016',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(3,'17519',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(4,'17528',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195019',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3),(5,'17537',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),(6,'17546',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'p20190604195022',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4);
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
  `password` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user`
--

LOCK TABLES `tbl_sys_user` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user` DISABLE KEYS */;
INSERT INTO `tbl_sys_user` VALUES (9,'$2a$10$yicg4parlvccAlZF5YuUBukgN1lvBsSrZEG3x7cZzySzmbTsGyrN6','SS,USER','u20190605134944','SSB'),(8,'$2a$10$IqcgtoVcKYWSbWm8qgHPAukbAY5ckeHlYOOWUSUf7uQ7kflCdoq9W','SS,USER','u20190605134833','SSA'),(7,'$2a$10$6l33U7F7cjQAE195sh2sr.9zDQEdFlD62TKAny4pzhfF/8IflYPcK','CUS,USER','u20190605134759','CUSC'),(6,'$2a$10$ZgVEAigy6ThCL8omHD2wP.v6JmWcMyMg6GNDqff3AFFZKbVuaN2ni','CUS,USER','u20190605134754','CUSB'),(5,'$2a$10$8Abi3J5mBkt56T7D9gt.geulQbsdP0Vm3ScwiR.7KbYcoCGu5UzMy','CUS,USER','u20190605134344','CUSA'),(10,'$2a$10$vwjMP/wk3Y784K1b4DYdIuOPxmQa0BoQmXOyuOP4keEhHrHoFWZV.','SM,USER','u20190605135114','SMA'),(11,'$2a$10$aYX7pelQ8quDWK9oUmGf9uDMyA/69YW9W3lOVyLqPJYc8m0sRvZDC','TS,USER','u20190605135358','TSA'),(12,'$2a$10$ADZhPAEFjKQwRaXpzsX0iudNRGYZNyJyVtvSwYfydhuSK0f7y6.qC','TS,USER','u20190605135411','TSB'),(13,'$2a$10$JcDZImu1LBuauLLJsyGpiuN1zXYimgGTlpXGUPmM.ljrjfKgc.tny','TM,USER','u20190605135543','TMA'),(14,'$2a$10$8JQTL3a0SiiHIdL5su8cmebzsTsY/MrRpmqpi8w2MP5ICO8MFRiiK','QM,USER','u20190605135736','QMA'),(15,'$2a$10$N1UDFDHAAIaZa/GkSPInLO/WPTY9mY.5BiKEZreAmU7sccBkKfMs2','ADMIN,USER','u20190605135828','admin');
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

-- Dump completed on 2019-06-05  6:00:49
