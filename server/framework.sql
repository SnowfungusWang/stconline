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
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1558854172960\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"entrust_process\" isClosed=\"false\" isExecutable=\"true\" name=\"EntrustProcess\" processType=\"None\">\r\n    <startEvent id=\"start\" name=\"StartAnEntrust\"/>\r\n    <userTask activiti:candidateGroups=\"${CustomersGroup}\" activiti:exclusive=\"true\" id=\"to_submit\" name=\"Edit\"/>\r\n    <userTask activiti:candidateGroups=\"${StaffGroup}\" activiti:exclusive=\"true\" id=\"to_accept\" name=\"Review\"/>\r\n    <sequenceFlow id=\"_2\" sourceRef=\"start\" targetRef=\"to_submit\"/>\r\n    <sequenceFlow id=\"_3\" name=\"Submit\" sourceRef=\"to_submit\" targetRef=\"to_accept\"/>\r\n    <sequenceFlow id=\"_4\" name=\"Refuse\" sourceRef=\"to_accept\" targetRef=\"to_submit\"/>\r\n    <endEvent id=\"_5\" name=\"EndEntrustProcess\"/>\r\n    <sequenceFlow id=\"_6\" name=\"Accept\" sourceRef=\"to_accept\" targetRef=\"_5\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#FFFFFF;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"entrust_process\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"Shape-start\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"335.0\" y=\"125.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_submit\" id=\"Shape-to_submit\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"275.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"to_accept\" id=\"Shape-to_accept\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"280.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"155.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"_5\" id=\"Shape-_5\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"340.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_2\" id=\"BPMNEdge__2\" sourceElement=\"start\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"351.0\" y=\"157.0\"/>\r\n        <omgdi:waypoint x=\"351.0\" y=\"230.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"12.0\" width=\"0.0\" x=\"0.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_3\" id=\"BPMNEdge__3\" sourceElement=\"edit\" targetElement=\"to_accept\">\r\n        <omgdi:waypoint x=\"320.0\" y=\"285.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"320.0\" y=\"340.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_4\" id=\"BPMNEdge__4\" sourceElement=\"to_accept\" targetElement=\"edit\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"340.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"315.0\"/>\r\n        <omgdi:waypoint x=\"385.0\" y=\"285.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"3.0\" width=\"0.0\" x=\"0.0\" y=\"-25.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"_6\" id=\"BPMNEdge__6\" sourceElement=\"to_accept\" targetElement=\"_5\">\r\n        <omgdi:waypoint x=\"356.0\" y=\"395.0\"/>\r\n        <omgdi:waypoint x=\"356.0\" y=\"450.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"0.0\" width=\"0.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('3',1,'/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0F_#�\0\0�IDATx\�\�\�\r����\'�\�/f5���^\�m6ƽۦ\��n\Z�ɍ���\�\rmW\�93�\��V��\�\ZI	E��Uz�jE��Z��n-\"UD^�:\�wQ�+��:�Tpx���sg\�a�Q)0\�\�s>�\�sxΙ3\��?\�����~\�\0\�HRJ�nH\���8\�\�uim~�\�\�w�\�Ϧ9mO���\��gw�\�\�\�s��oË�g�\��\'q\0j慔�\�0�lO(}\"\�\�B\�WR\�oO\�{��\�\���\�)�[��??�\�#@\��isz���۞̡�\�x>\�\�	�;r=\�\���on\�	�\�^~��\�\�Gs\�\�u\�[\�\���\��_�\�>�\�󯦴,?\����􋞟�\�\��9���\�zШP7?�\�\�&\�k|m�\�s^{6�\�^�?6s��\�\�\�?t�5�-ؑnڙR[�\�\���۞M�\���\�O\�\�Z\�?s|N\�\�����\�O\��o�cz\�/)=����o�u\0]��/ߚ^�\�3K{:�\�[�\�\��xbOu\�\�\�����\�5ݕ��4sEg츻*?��il\�^��m/��V�\�{�un\�\�ٯ@MB\��t\��\�#\�r]�@GZ\�/�\�S��\�_�͜\�RZ\��\�%?_�wItoq0K~�\�?vlɏŁ-w.\�\�\�\�\�\��tz0O�\�\�֤\�ƴ\�\���\�Ӛ<\�\�\\�\Zy\0jz\�\�|E��8!�\�e��.\�s=�\�\�㠕\\7\�Z�zF��}�.ȵ�\' �\��\�K{\�wo�Sz\�{r�\�\"o7\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��O���\�H)�`���F��2�uG�w��!�)F�Z�\�\�mO�\�\�\�z�}⢷ӍϦt�\�֤߾˴O,ݟ�Ϗ_+�\�Ǵ\�\�ҝ3_J�\�{oy<\�\�y_���6��\"�+{\�\0��~x{�Ō\�\�\�����V��3O;f�i7�1=A���o�Ǵ\�\�6��x�`G�)�6<�_���Om\0jz�\�1:�U)M�\�?��iY\�����\�7?�\�G\�S\��\�\"@{;\�\�\��x-�߹<\�2\�\0\�2�\"��\���\�5\�ϯ��\�\��\�s}*6]4\��{��s2}:��\�1\�\�߭Y\�\����\��\�Y����=�ˌ<\0��s\"\�z���\\�֋)]\�d=��7\�\�����78\�ϧ\�=�s~�\���\�͞\0P���\�Ϧ9���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\���\�ͻ\�nxkڴi]\��\�wSkkkjjjJ�G�N\����\�\�ɓ�L�:uÄ	�c\�\0r6n\�\�r\�w�y\�%��q\�ƥ_�\�W\��\�O�6mJ�w\�NaϞ=���#=�\�i\�̙i\�رi���]�&MZZ�TN4�\0\�{gw\�E��^|�\�)wviٲe\�\��~-_�<\�0�w\�y)w�S�(\0u\�\��\�g?\�8qbz\�\�\�\�X�re�0aB�ַ��Zkk\��F���cǎ	�\'ON\�]w]z�\�7ӑ�A\��.�袿\�\�	@\�txxW_}uڷo_:\�f̘\�\�Æ\r;\�hP3�/6iFGv4�\��\�\�ӨQ�\�\Zq\0j&Z�}xGj�\�m\�;vlW�R�h\�t�Y3�Ҍ#4C\�\�\�Ҳ\��=\0]���%�+��rOSS\�����+�ĉ\�\�\��z饗R\���:��A3��?ĕV�\��+imm\�_.�ϳ\0q-͸�X-\\{����\�,\0E\\<:��Y�=�ؾz\�,\0E\�-!.][�n\�ʡ\�i)\00(\�@�wKlq\�5��\0���Щ%���9\�sj\�\�u	=\0\�w��\�\�\�\�\�\�c�\0�fʔ)��:zs޼y�\�`\�\\q\�kku�\�\�ɓ7;O�A3ao�;�&Wd�ː�\"\0�|��ڛ\�\�\�iӵ7\\?���\�k5�.�\��\�\�\0��kmm=���\�\�Z�|��ޟ����\�幟\051~��\�q#٣}\��]�v\�onn\�\�\�\�\0\�\�رc7]{\�G󠖮�;:\�\��j�\r@M\�A%�\�\�z\�\r7�\�\�4iҫq^^lN5\�\0\�E�]p�?�\�O\�Ν;�\�&͋.�(\\Yg?\0u|�G�^}\�v=���}\�J\�ËM�:<\0\�Vl2jԨ}S�L\�\�w(�<�z\�-���\�(M�\0P��;\�]\�=ѭ�3�kڴi��,Y�o�\�\��\�~x�wK��G?��\�[\�\�bq���8\�\�L\0��b�s-ȵ6᮸-PUu\�>�\\\�qi1WZ��A�F��a#@��\�qF���\�Ç�`$\0h�\�\�:묳>f$\0h�\�=z�\�F�F��\�r��F�«T*�G�q��\0�:�}#G����\0��\�\��\�Q�F���\0�:��!\�g�\0�z��\����\0�B\�\�\\_1\04B\�\�nnn>\�H\0Pxq�������\0�:��\�CF�F���i$\0(�J��F�T���\0�:���\�勍\0�z�\�n\�F�F���.5\04B\�u\�l$\0h�\�\�\\.��\Z	\0\Z!�6V*���\0�����\�\�\�\�	\0\Z�\�[�;�\�F�F�5�n0\0^\���\\.�o6\04B\�\\*�n3\0^SS\�K�~m$\0(�r��<�\�]F�F\���\��w��\0��*�ʳ�R\��F�\�\�]ޓ9�\�7\04B\�=�C\�#@\�555=�\�a#@#�\�\�\�\�-2\0^^�RYb$\0h�Л�8�\0��\��\\\�F�\�\�#@#�ެz\�	\0\n/.A�\"3\04B\��&�ދF�\�\n\�테\0�W�T~�C\�ߍ\0�W.�o\���g#@#�ލ9�\�	\0\n/\������F�F\���\�\�[g$\0h�N\�z�\0�\�\�\�|E\��6	\0\n/wy�su	\0\n�T*]V�T�\Z	\0\n/\�ws����\0��r\�M(�\�ۍ\0�W*�����7�\0�����r��\�H\0Px9�F\�z\�H\0Px�,�\�.#@\�577��Co��\0��J�\��zo	\0\n�\\.!�^g<omm=�R��\�\�\�r��`\�ˡ�=�\�\���??�j����wǻ�]wE�g�\0�\rvLtz^�\\^n�\0h�nO�@��\�~B\�\�(�r�<��.o����rнQzی\0��;��U]\�D#@��\�\�7#�\0�W*�.z\0CTJ\�իW�kooO.L�\�\�W\�Ղ\�ҥK�r\��\�\�\\^[[[\�\�\�H���J�ڲeKZ�xqW�i�‚�O\���\��u��j*6iZ)���\�\�\�/��XY!+���z믛\�\�\'��/���\�yL�2WB(T\�\�ؾ!�8orz��\�P1-^�BWB(L\�[~�A�\�[\�ϱBWB(N\��\�O�x\�\n]	=�0��\��z��z�\�SJ\�C-�\�h́B/^�BWB(L\�z�C/^�BWB(L\�m۰,���7m\�i��z@aB/j\�S�>(�b���z@�B\�\�Ӫ\�f�i3O�׬Е\�\nzqŕ��~�}z񚫲(�\�\�\�ܦU�\�M\Z0�z+\�\�\��)��\�{�\�Nק�P�\�{?\�ݻu}V�J\�C&��\��\�-+x%�!zJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0��~j���\�NH^xaZ�jU�җ��������޹s\�\'�x\��\�柙={�Pz�\�\Z��!͜9��}\�ƍ���_<`�\�w\�\�=��W^9\�gn��va\'�\0�W�\�\�7oޜ\�x㍃\�\�GM_�\�W\�w\�ޝ�y\�o��fM��\�\����3�K�,zBz�z�\�rK�5kV��\�\�Y�\�\�ɓ�\�-�\�s�{絶��4~��\�\�۷o\�0UBzu\�\�\��+Wv?\�Gұ\��\��N=�\�\��\�m۶u�L\�(� �\�:�z7O����T\��\�d*�\0�ޠW\�f\�q\�ƥ;v����d�\�\'N\�>J3�>���_�bE��\�\�\�_\�q\�i\�\�\�OzBz�������\�͛��9#׭[�\�k�g�yfw��|ߟ\�=͡\�.B@\�)� ��\�zJ\�=%�\0��z�гBVBzJ	=@\�)%�\0���\���zBzJ\�=%�\0��z\0BO	=\0����>���BVBhmmm�;::��\�Q��\�ׯ͡\�\�/��E��h�\�\�]���ZC��w\�\�ѐ��V��`�������j.���\��+6?5B\�w\�}\�\�s\�Ms\�\��\�����%�\�7�I�2\�\�\�	<�\Z�T*kr-�\�\�ojj\�ʕ\�\��TK��x\�ȁ�o�\�\��X\�y\��\�|+s\�y�%�\��7s����\�\�\�\�\��y���t\08��7=wV;�ӿ�q\�m\�z�]\�\�<�\'ZR\0�\�\�\�\�s�\�\�\�rQ�\�%\�\�\��B���\�\�g�p8A3/�\��:��U\�zQ\�\"�-5\0و#N\�\�o�\�z��8xe��{+\�\�DK�\�\��=�ɟ\�h~�xo6\�K�\�\�F\��\�?f̘�\�Q\�-�\n��܉�ϘǘWK��Y�\�s�\�Ug�筱\�.\�\�\�U\�\�\���%�\�\Z.?ʵ{\�ȑ���\�o3f\�c\�k\�+-9\0\�\\�r�ĕO.*�\\*�.�y�y�8�.\�\\�\r��.�\��ۛe	𾴶�~\"inn��P���\����$\0\�\�{>wL\�\r\����$x���J\�\����S�Њ�O,�I\�w�D\�W\�я�E8���\�\��N�,\0��\�rg�v�\�s�\�R�\�PcE��I|�z��\0�\r��R\�kW\�\�C����Bܮ��\�/�[=\�%�\�\�g\�^y9N)p\�RO��Frl���7����;�P�\�\�{[[[�/�w�\�\�5��%\�x�.��\�J�rm�|\��]�\�\�\�\�\�\�h q#\�o6\���\�\��\0h�G��\�z��\��\rz߈\�c\��\�\��+�˫��\�\�[�\�\�Q�%\0\�ȑ#�[^᧖����:9�\�\�477�W�E\0\\^\��6��w\�\0<�AC\�zO�/�qV�\�q\�_�TN\�߽˝\�\Z\�\�ѣO��\�r\�7���w�\�ε\�\0\r&��\'đ�---���o\�I=.G\�\�\�\0�|\�w/�	ەJe]�,u�5lذcr\�\�(�J�/��\�\�l9�\�\�Ç�`�4�x�)\����:\�\����\�\� �\�1\�\�#G���\����\�m\�S4\0\�?^\�᰼h\�+w��\�n�6K�w�u\�Y\���\'׏\��7Wg\��>l	\�7$���\��tA�ώ���%�@A1/\�����\�\�#�+�w\���\�` vz~C�k\�Mrw777_a��b�fl\�\�{Ͻ8\�?O��\�\�?\�\�u�iӒ\�}�Z\���8����\��|cܒ\'\�u\���W\� K�C阖\��x=�����\�\\\��;\�_\�<[z\0Jx�\�\�U�]o\�\�f\�8=ND�\�-A\0ޗR����M�}/\��\�⚝uڙ\�S\�(\0�\�\�\�\�/\�\�\�\��|�\�w\\L:6\�\�ť-E\0ޗ\�\�\�\�sx̉�n�\�˯M���\���`�W-A\0ٹ\�{R��\\��߂z�׸1lϕd��%�\�ߪ>����\�R�,�y��\08\"������eK�^\��^\�\\.26\�\�y:\�R\���\�z6y��N\�\�z/X2\05�R:f�\�\�\�\�\�\�\�\����\�Q��s\�s\�=7\���\r�,X��.]ڕk��6�\�\"�\�\�\�RGGG\�\�\�TG�v\�\�\�p\�y˖-i�\�\�]9\0���j*:<��#�r\�\�\�/��ؤi���bs��8��bEd��� ��ꭿnJ���UZ�\��\�\�1\�\�\\	=�P��c���\�\�\���w@Ŵx\�\n]	=�0��n��^o�_>\�\n]	=�8��\�#?0�\�5+t%�ދ�8`\�\�kV\�J\�BO)��Ћ�5\n�x\�\n]	=�0��\�\��x\�\n]	=�0��mò�\�\�S޴��\�kV\�J\��	��5O���ЋiV\�J\�\�\n��\�N��q�\�<-^�BWB(D\�\�W^~���\�\�k�ʢ�0�C/wp�V-J/<4i��\�xO�Wק�0\�Bｺ;]�z@aB\��tw\�\��Y�+��\��[���\��\��L\�)%�\0���\���RBzJ	=@\�)� ��\�zJ\�=%�\0�^o-Y�$�t\�IiժU\�\�O;\�#�\��g\�jBz�QL������\�\�c�{\�ڵ��\�w\�}w�g��\�+�M\�B���q\�\�\�`z\�G�\�N�۶u��\�~\�=mmm\�\�SOM˖-;\�\�>����\�ӧ�Ǎt׬I��ԧ�\�ݻw�g�y�\�\�\�\�g�y\�i��\�\�A<k֬\�y�\�G>��z\�)� �\\\�\�r\�-\�\�{\�M���p@\�\�kW\\qEw�\����\��\�?�я��\�\�P?~|�{�o\�~�\�\�3{�\�\�\���r\�J� �\\\�\�&\�x�馛\�y-���6nܸ\�}s\�_}w��\�4�~��~é�k�\���\�ޮ���\�qݺuB@\�\�\�\�\r�\�M�s\�\�\�ބY��͛7Ե�3�\�n��\�{�ό�Ǿ��3g�c�=6\�ܹ\�>=\0�wd�w�b\�&\�x>bĈB蓟�dw�v\�g�y��\��\�w�bŊ\�\�bSgߠ\�3\�H\�\�|\�3i˖-\�kz\0B\�+Be\�\�_\�}\�C쟋`;\�S\�\�X����\�A)Q�\�Q};��>3�\�\�\�oW)�\0��z\0BO	=\0����\�SBzJ	=@\�)%�\0���\���RBzJ\�=%�\0��z\0BO	=\0����\�SBzBO	=�Q\�}ଐ�\�\ZB[[\����+euTk���ks\�u��jjѢE?Z�xq\�k��f嬎Z\�-X�`o�i�‚\�+����\�ߊ\�O꽫R��C�N�0\r6옦�&��\0(��#G��\��!�3\�\�\�r�\�H\0Px9��)wzB���Sr\�\�7\0^KK\�i9��	\0\n�R���Co��\0�B\�\�z{�\0�W*��\�\�{\�H\0Px9�\�ε\�H\0Px�JeT�\\\�i$\0(�x\�\�No��\0�:�q9�\�0\0^�T�v�׍\0�z�\�\�\�j$\0(�\�\�\�)\�r�\�H\0PxMMM?ʵ\�H\0Px�˛�Co��\0�B\�zk�\0�z7\�\�{\�H\0Px�J嗹^6\0^\��\�̵\�H\0\��ww�\\^f$\0(�R���J��\0�:�9��0\04B\�\�\����\0�Boa��F�F��|F�F��r����\0�B\�8�\�H\0Pxq�B��`$\0(�r��Bss�o�\0�� �K�	\0\n/.6]*�n3\0^�\\^\�\�\�<\�H\0Pxqٸ���\0�:���ӻ\�H\0\��ަJ�r��\0�:��\�\�M1\04B��5ץF�«T*\�sM4\04B��F�qF�F���i$\0(�#F����\�s�Xz;s5\0\n�\\./\������\�\�\�\�\�\�\�\0CZKK\�i\�zݕ��#@!\�`{~���T*�uy\04D��\��pr��\�\'��\��\0(�R���~B\�V#@!\�\�Xx��\rv�Q��\�\��yU��~bD\0(z��9B\�_�\�6\Z\0Fl�\���\\m��\�\�\�{ K�m�ڛ��g8��!\'.=��lq�=\�ubz\�s�\�\n.q\�2�@\�wv9�\�a�%\��v�\0u\�\�\��|\�\�v�\r�q\�ƥ�o�9=��\�iÆ\ri�\�\�)\�cGGGz�\�\�wܑ&N�\�߉\�\�T�@݈�2[ZZ�W\�����\�@۷o_z��{\�4iҤ�\�ו?�Q�.�zsf�4gΜC\n��z\�\�\�\�ڷ\�|\0\�Nl\�́\�U�)�\�_NG\�_��t�\�\��\�\�	@M\�A+\���\"�bݑ�W|��\��-\0�8J�z�\�\���\���l\�|\�\�0h\�<�\��x�\�h�}|\���b���\0���ϫ�\�ܳgO:\�.��\�\�͜\�-\0��ؗW}��8-a0,[�\�+�\�:\�\�\0ਊS�^9�SU�	\�q�NK���\�\�\�\��s뭷��4s\�\�.Sfi\0p�CoKo�ĥ\�SlJ�\�Ĺ\�\�\0\�\�a�\���M�6\rj\�\�y{շ%�4\08ڝ\�;�\�{�\������[\Z\0Z\�Ղ\�@�\0G�}z\04R�\�\�M\0\Z&���@c\�\�U��\"\�%�\\\�,\0���f\�Os\�M\0\ZB\�Ӯ�.�\�\�M�4\�]\0|q?�>]\�@�t{m�u\��s\�9ǝ\���\�\�\�\�\�\��\�Z\�<�#}^\���\�7k\�\�k�t�R\�\�՛9#��T\�^u\�\�\�\�g\��e�}�:�bSg\�\�;��[b^�M�\�\�M5\�\0\�]��\��\�s\��i	�\'O> \�\�s\0�|_�\�\�W�\�3�\��\�Ov_���\"\���\�\"\�J+\�\'�W\�óI���T\�y����V\0�{q_\�Ҟ��r\����\�J�x\�\�\��e����,\�Vgt[�oKTu9�\�q�踖�K�\0\0\0\0\0\0\0\0\0\0\0\0\0�\����\"c<O e\0\0\0\0IEND�B`�',1);
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
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2019-05-30 13:08:27.016',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('entrust_process:1:4',1,'http://www.activiti.org/test','EntrustProcess','entrust_process',1,'1','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.bpmn','/home/lfm/repos/SE/stconline/server/target/classes/processes/EntrustProcess.entrust_process.png',NULL,0,1,1,'',NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_entrust`
--

LOCK TABLES `tbl_sys_entrust` WRITE;
/*!40000 ALTER TABLE `tbl_sys_entrust` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sys_user`
--

LOCK TABLES `tbl_sys_user` WRITE;
/*!40000 ALTER TABLE `tbl_sys_user` DISABLE KEYS */;
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

-- Dump completed on 2019-05-30 13:08:46
