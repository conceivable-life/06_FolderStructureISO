@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM ============================================================
REM ¤ ISO 13485 — IVF MASTER STRUCTURE — CENTRALIZED DOCS ¤
REM ============================================================

REM Generar nombre único / Generate unique name
FOR /f "tokens=2 delims==" %%a IN ('wmic os get localdatetime /value') DO SET "dt=%%a"
SET "YYYYMMDD=%dt:~0,8%"
SET "HHMMSS=%dt:~8,6%"
SET "RANDOM_ID=!YYYYMMDD!-!HHMMSS!-%RANDOM%"

SET "ROOT=%CD%\IVF_MASTER_CENTRALIZED_!RANDOM_ID!"

echo.
echo ——————————————————————————————————————————————————————————
echo • CREATING STRUCTURE (CENTRALIZED ISO DOCS)
echo • LOCATION: %ROOT%
echo ——————————————————————————————————————————————————————————
echo.

mkdir "%ROOT%"


REM ============================================================
REM 1.0 GOVERNANCE / GOBERNANZA (QMS)
REM ============================================================
SET GOV=%ROOT%\00_Governance-Gobernanza
echo ... 00 Governance (Repo Central)
mkdir "%GOV%"

REM ... (Carpetas estándar de gobernanza se mantienen igual) ...
mkdir "%GOV%\01_Policies-Politicas\01_QualityPolicy-PoliticaCalidad"
mkdir "%GOV%\01_Policies-Politicas\02_InfoSecPolicy-SeguridadInfo"
mkdir "%GOV%\01_Policies-Politicas\03_CodeOfEthics-CodigoEtica"
mkdir "%GOV%\02_Scope-Alcance\01_Certifications-Certificaciones"
mkdir "%GOV%\02_Scope-Alcance\02_Exclusions-Exclusiones"
mkdir "%GOV%\03_ManagementManual-ManualGestion\01_QualityManual-ManualCalidad"
mkdir "%GOV%\03_ManagementManual-ManualGestion\02_SafetyManual-ManualSeguridad"
mkdir "%GOV%\04_Organization-Organizacion\01_JobDescriptions-DescripcionesPuesto"
mkdir "%GOV%\04_Organization-Organizacion\02_ResponsibilityMatrix-MatrizResponsabilidad"
mkdir "%GOV%\05_ManagementReview-RevisionDireccion\01_Agendas-Agendas"
mkdir "%GOV%\05_ManagementReview-RevisionDireccion\02_Minutes-Minutas"
mkdir "%GOV%\05_ManagementReview-RevisionDireccion\03_ActionItems-Acciones"
mkdir "%GOV%\06_Strategy-Estrategia\01_MissionVision-MisionVision"
mkdir "%GOV%\06_Strategy-Estrategia\02_Objectives-Objetivos"

REM *** AQUI SI VA LA DOCUMENTACION ISO CENTRALIZADA ***
CALL :MakeISO_Deep "%GOV%"


REM ============================================================
REM 2.0 STRATEGIC PROCESSES / PROCESOS ESTRATEGICOS
REM ============================================================
SET STRA=%ROOT%\01_StrategicProcesses-ProcesosEstrategicos
echo ... 01 Strategic (Sin ISO folder duplicado)
mkdir "%STRA%"

REM 1. Risk Management
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\01_RiskPlan-PlanRiesgos"
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\02_HazardAnalysis-AnalisisPeligros"
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\03_RiskEvaluation-EvaluacionRiesgos"
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\04_RiskControls-ControlesRiesgos"
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\05_RiskReport-ReporteRiesgos"
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\06_PostProduction-PostProduccion"

REM 2. Regulatory Affairs
mkdir "%STRA%\02_RegulatoryAffairs-AsuntosRegulatorios\01_FDA_510k"
mkdir "%STRA%\02_RegulatoryAffairs-AsuntosRegulatorios\02_CE_MDR"
mkdir "%STRA%\02_RegulatoryAffairs-AsuntosRegulatorios\03_LocalRegistrations-RegistrosLocales"
mkdir "%STRA%\02_RegulatoryAffairs-AsuntosRegulatorios\04_LabelingUDI-EtiquetadoUDI"

REM 3. PMS
mkdir "%STRA%\03_PostMarketSurveillance-Vigilancia\01_Complaints-Quejas"
mkdir "%STRA%\03_PostMarketSurveillance-Vigilancia\02_VigilanceReporting-ReportesVigilancia"
mkdir "%STRA%\03_PostMarketSurveillance-Vigilancia\03_CustomerFeedback-Retroalimentacion"

REM 4. Audits & CAPA
mkdir "%STRA%\04_AuditsCAPA-AuditoriasCAPA\01_InternalAudits-AuditoriasInternas"
mkdir "%STRA%\04_AuditsCAPA-AuditoriasCAPA\02_ExternalAudits-AuditoriasExternas"
mkdir "%STRA%\04_AuditsCAPA-AuditoriasCAPA\03_SupplierAudits-AuditoriasProveedores"
mkdir "%STRA%\04_AuditsCAPA-AuditoriasCAPA\04_CAPA-AccionesCorrectivas"
mkdir "%STRA%\04_AuditsCAPA-AuditoriasCAPA\05_NonConformities-NoConformidades"

REM 5. Others
mkdir "%STRA%\05_ConfigManagement-GestionConfiguracion"
mkdir "%STRA%\06_ProjectManagement-GestionProyectos"

REM *** AQUI ESTABA EL CONFLICTO: 07_KPIs es ahora único ***
mkdir "%STRA%\07_KPIs-Indicadores"

REM *** ELIMINADO: CALL :MakeISO_Deep *** REM (Ya no generamos la carpeta ISO aqui)


REM ============================================================
REM 3.0 OPERATIONAL PROCESSES / PROCESOS OPERATIVOS
REM ============================================================
SET OPER=%ROOT%\02_OperationalProcesses-ProcesosOperativos
echo ... 02 Operational
mkdir "%OPER%"

mkdir "%OPER%\01_ManufacturingGMP-Manufactura\01_DMR-RegistroMaestroDispositivo"
mkdir "%OPER%\01_ManufacturingGMP-Manufactura\02_DHR-HistorialDispositivo"
mkdir "%OPER%\01_ManufacturingGMP-Manufactura\03_AssemblyInstructions-InstruccionesEnsamble"
mkdir "%OPER%\01_ManufacturingGMP-Manufactura\04_ProductionOrders-OrdenesProduccion"
mkdir "%OPER%\01_ManufacturingGMP-Manufactura\05_PackagingLabeling-EmpaqueEtiquetado"
mkdir "%OPER%\01_ManufacturingGMP-Manufactura\06_NonConformingMaterial-MaterialNoConforme"

mkdir "%OPER%\02_SupplyChain-CadenaSuministro\01_Purchasing-Compras"
mkdir "%OPER%\02_SupplyChain-CadenaSuministro\02_ASL-ListaProveedoresAprobados"
mkdir "%OPER%\02_SupplyChain-CadenaSuministro\03_IncomingInspection-InspeccionRecibo"
mkdir "%OPER%\02_SupplyChain-CadenaSuministro\04_Inventory-Inventario"

mkdir "%OPER%\03_BioLab-Laboratorio\01_CleanroomProtocols-ProtocolosCuartoLimpio"
mkdir "%OPER%\03_BioLab-Laboratorio\02_MediaControl-ControlMedios"
mkdir "%OPER%\03_BioLab-Laboratorio\03_SterilizationRecords-RegistrosEsterilizacion"
mkdir "%OPER%\03_BioLab-Laboratorio\04_Calibration-Calibracion"

SET ENG=%OPER%\04_Engineering-Ingenieria
mkdir "%ENG%"


REM ============================================================
REM 4.1 DOMAINS (EXPANDED & BILINGUAL) / DOMINIOS
REM ============================================================
echo ... 4.1 Creating Expanded Domains

SET DOMAINS="01_ProjectManagement-GestionProyectos" "02_SoftwareEngineering-IngenieriaSoftware" "03_SystemsEngineering-IngenieriaSistemas" "04_MachineLearning-AprendizajeAutomatico" "05_QualityAssurance-AseguramientoCalidad" "06_Mechatronics-Mecatronica" "07_Optics-Optica" "08_ClinicalResearch-InvestigacionClinica" "09_IndependentVerification-VerificacionIndependiente" "10_DevOps-Despliegue"

FOR %%D IN (%DOMAINS%) DO (
    mkdir "%ENG%\%%~D"
    IF "%%~D"=="08_ClinicalResearch-InvestigacionClinica" (CALL :Domain_RS_IVF "%ENG%\%%~D") ELSE IF "%%~D"=="09_IndependentVerification-VerificacionIndependiente" (CALL :Domain_Test_IVF "%ENG%\%%~D") ELSE IF "%%~D"=="01_ProjectManagement-GestionProyectos" (CALL :Domain_PM_Robust "%ENG%\%%~D") ELSE IF "%%~D"=="03_SystemsEngineering-IngenieriaSistemas" (CALL :Domain_SE_Robust "%ENG%\%%~D") ELSE IF "%%~D"=="02_SoftwareEngineering-IngenieriaSoftware" (CALL :Domain_SW "%ENG%\%%~D") ELSE IF "%%~D"=="06_Mechatronics-Mecatronica" (CALL :Domain_HW "%ENG%\%%~D") ELSE IF "%%~D"=="07_Optics-Optica" (CALL :Domain_OP_IVF "%ENG%\%%~D") ELSE IF "%%~D"=="04_MachineLearning-AprendizajeAutomatico" (CALL :Domain_ML_IVF "%ENG%\%%~D") ELSE IF "%%~D"=="05_QualityAssurance-AseguramientoCalidad" (CALL :Domain_QA_Robust "%ENG%\%%~D") ELSE (CALL :Domain_Mgmt "%ENG%\%%~D")
)


REM ============================================================
REM 4.2 SUBSYSTEMS / SUBSISTEMAS
REM ============================================================
SET SUBSYS=%ENG%\33_C_Subsystems-Subsistemas
mkdir "%SUBSYS%"

SET SUBS=03_C_DISH 04_C_SPERM 05_C_EGG 06_C_ICSI 07_C_HANDLER 09_C_CULTURE 10_C_NEXUS 12_AURA 13_C_ELN

FOR %%S IN (%SUBS%) DO (
    echo ... Configuring Subsystem: %%S
    mkdir "%SUBSYS%\%%S"
    mkdir "%SUBSYS%\%%S\00_IntegrationSpecs-EspecificacionesIntegracion"
    mkdir "%SUBSYS%\%%S\00_LocalMgmt-GestionLocal\01_CM-Configuracion"
    mkdir "%SUBSYS%\%%S\00_LocalMgmt-GestionLocal\02_ChM-ControlCambios"
    
    mkdir "%SUBSYS%\%%S\01_ProductIntegration-IntegracionProducto"
    CALL :Sub_PI "%SUBSYS%\%%S\01_ProductIntegration-IntegracionProducto"
    
    mkdir "%SUBSYS%\%%S\02_Mechatronics-Mecatronica"
    CALL :Prod_Hardware "%SUBSYS%\%%S\02_Mechatronics-Mecatronica"
    
    mkdir "%SUBSYS%\%%S\03_Software-Software"
    CALL :Prod_Software "%SUBSYS%\%%S\03_Software-Software"
    
    mkdir "%SUBSYS%\%%S\04_Optics-Optica"
    CALL :Prod_Optics "%SUBSYS%\%%S\04_Optics-Optica"

    mkdir "%SUBSYS%\%%S\05_MachineLearning-IA"
    CALL :Prod_ML "%SUBSYS%\%%S\05_MachineLearning-IA"
    
    mkdir "%SUBSYS%\%%S\06_AutomationProtocols-ProtocolosAutomatizacion\01_Definitions-Definiciones"
    mkdir "%SUBSYS%\%%S\06_AutomationProtocols-ProtocolosAutomatizacion\02_Logs-DatosCrudos"
    mkdir "%SUBSYS%\%%S\06_AutomationProtocols-ProtocolosAutomatizacion\03_Reports-Reportes"
    
    mkdir "%SUBSYS%\%%S\07_SystemVerification-VerificacionSistema"
    CALL :Sub_Verification "%SUBSYS%\%%S\07_SystemVerification-VerificacionSistema"

    mkdir "%SUBSYS%\%%S\08_UserDocs-DocumentacionUsuario"
    CALL :Sub_UserDocs "%SUBSYS%\%%S\08_UserDocs-DocumentacionUsuario"
)


REM ============================================================
REM 5.0 SUPPORT PROCESSES / PROCESOS DE SOPORTE
REM ============================================================
SET SUP=%ROOT%\03_SupportProcesses-ProcesosSoporte
echo ... 03 Support (Sin ISO folder duplicado)
mkdir "%SUP%"

mkdir "%SUP%\01_HumanResources-RRHH\01_OrgCharts-Organigramas"
mkdir "%SUP%\01_HumanResources-RRHH\02_TrainingRecords-RegistrosEntrenamiento"
mkdir "%SUP%\01_HumanResources-RRHH\03_CompetencyMatrix-MatrizCompetencias"
mkdir "%SUP%\01_HumanResources-RRHH\04_Onboarding-Induccion"

mkdir "%SUP%\02_IT-TI\01_Infrastructure-Infraestructura"
mkdir "%SUP%\02_IT-TI\02_Cybersecurity-Ciberseguridad"
mkdir "%SUP%\02_IT-TI\03_Backups-Respaldos"
mkdir "%SUP%\02_IT-TI\04_SoftwareValidation-ValidacionSoftware" 

mkdir "%SUP%\03_Facilities-Infraestructura\01_MaintenancePlans-PlanesMantenimiento"
mkdir "%SUP%\03_Facilities-Infraestructura\02_Calibration-Calibracion"
mkdir "%SUP%\03_Facilities-Infraestructura\03_EnvironmentalControl-ControlAmbiental"

mkdir "%SUP%\04_Finance-Finanzas"
mkdir "%SUP%\05_Legal-Juridico"
mkdir "%SUP%\06_Comms-Comunicacion"
mkdir "%SUP%\07_Admin-Administracion"

REM *** ELIMINADO: CALL :MakeISO_Deep *** REM (Soporte guarda sus registros en sus propias carpetas)


echo.
echo ——————————————————————————————————————————————————————————
echo • COMPLETED / COMPLETADO
echo • CENTRALIZED STRUCTURE GENERATED / ESTRUCTURA CENTRALIZADA GENERADA
echo • %ROOT%
echo ——————————————————————————————————————————————————————————
echo.
pause
exit /b


REM ============================================================
REM =============== FUNCTIONS (BILINGUAL) ======================
REM ============================================================

:MakeISO_Deep
REM Esta carpeta solo existe en 00_Governance
mkdir "%~1\07_ISODocumentation-DocumentacionISO\A_Normative-Normativos\01_Procedures-Procedimientos"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\A_Normative-Normativos\02_WorkInstructions-InstruccionesTrabajo"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\A_Normative-Normativos\03_Policies-Politicas"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\A_Normative-Normativos\04_Specs-Especificaciones"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\B_Controlled-Controlados\01_Forms-Formularios"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\B_Controlled-Controlados\02_Records-Registros"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\B_Controlled-Controlados\03_ExternalDocs-DocumentosExternos"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\B_Controlled-Controlados\04_MasterLists-ListasMaestras"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\C_Uncontrolled-NoControlados\01_Drafts-Borradores"
GOTO :EOF


:Sub_PI
mkdir "%~1\01_ICDs-DocumentosControlInterfaz"
mkdir "%~1\02_AssemblySOPs-InstruccionesEnsamble"
mkdir "%~1\03_MfgChecklists-ListasVerificacionManufactura"
mkdir "%~1\04_IntegrationBuilds-RegistrosIntegracion"
mkdir "%~1\05_CableHarness-ArnesesCables"
GOTO :EOF


:Sub_Verification
mkdir "%~1\01_MasterVerificationPlan-PlanMaestroVerificacion"
mkdir "%~1\02_TestProtocols-ProtocolosPrueba\01_IQ-Instalacion"
mkdir "%~1\02_TestProtocols-ProtocolosPrueba\02_OQ-Operacion"
mkdir "%~1\02_TestProtocols-ProtocolosPrueba\03_PQ-Desempeno"
mkdir "%~1\03_TestReports-ResultadosPrueba"
mkdir "%~1\04_TraceabilityMatrix-MatrizTrazabilidad"
mkdir "%~1\05_DefectLog-RegistroDefectos"
GOTO :EOF


:Sub_UserDocs
mkdir "%~1\01_UserManual-ManualUsuario"
mkdir "%~1\02_UserChecklists-ListasUsuario"
mkdir "%~1\03_QuickRefGuides-GuiasRapidas"
mkdir "%~1\04_Labels-EtiquetasSeguridad"
mkdir "%~1\05_TrainingMaterials-MaterialEntrenamiento"
GOTO :EOF


REM ============================================================
REM DOMAIN FUNCTIONS (BILINGUAL)
REM ============================================================
:Domain_RS_IVF
mkdir "%~1\01_ClinicalProtocols-ProtocolosClinicos"
mkdir "%~1\02_BioAssays-BioEnsayos"
mkdir "%~1\03_Regulatory-Regulatorio_FDA_MDR"
mkdir "%~1\04_HFE-FactoresHumanos"
mkdir "%~1\05_Literature-LiteraturaCientifica"
GOTO :EOF

:Domain_Test_IVF
mkdir "%~1\01_MasterValidationPlan-PlanMaestroValidacion"
mkdir "%~1\02_Templates-Plantillas_IQ_OQ_PQ"
mkdir "%~1\03_SystemIntegrationTest-PruebasIntegracionSistema"
mkdir "%~1\04_TraceabilityTools-HerramientasTrazabilidad"
GOTO :EOF

:Domain_SE_Robust
mkdir "%~1\01_Requirements-RequisitosSistema"
mkdir "%~1\02_Architecture-ArquitecturaSistema"
mkdir "%~1\03_CM-GestionConfiguracion"
mkdir "%~1\04_ChM-ControlCambios"
mkdir "%~1\05_PI-EstrategiaIntegracion"
mkdir "%~1\06_SafetyRisk-SeguridadRiesgo"
GOTO :EOF

:Domain_PM_Robust
mkdir "%~1\01_ProjectPlan-PlanMaestro"
mkdir "%~1\02_Schedule-Cronograma"
mkdir "%~1\03_RiskMgmt-GestionRiesgos"
mkdir "%~1\04_Stakeholders-Interesados"
GOTO :EOF

:Domain_SW
mkdir "%~1\01_CodingStds-EstandaresCodigo"
mkdir "%~1\02_CommonLibraries-LibreriasComunes"
mkdir "%~1\03_Tools-HerramientasValidacion"
GOTO :EOF

:Domain_HW
mkdir "%~1\01_CAD_Standards-EstandaresCAD"
mkdir "%~1\02_PartLibraries-LibreriasPartes"
mkdir "%~1\03_MaterialSpecs-EspecificacionesMaterial"
GOTO :EOF

:Domain_OP_IVF
mkdir "%~1\01_MicroscopyStds-EstandaresMicroscopia"
mkdir "%~1\02_LensCatalog-CatalogoLentes"
GOTO :EOF

:Domain_ML_IVF
mkdir "%~1\01_ModelZoo-ModelosEmbrion"
mkdir "%~1\02_DataPrivacy-PrivacidadDatos"
GOTO :EOF

:Domain_QA_Robust
mkdir "%~1\01_QMS_Processes-ProcesosSGC"
mkdir "%~1\02_Audits-Auditorias"
mkdir "%~1\03_CAPA-AccionesCorrectivas"
GOTO :EOF

:Domain_Mgmt
mkdir "%~1\01_Standards-Estandares"
GOTO :EOF


REM ============================================================
REM PRODUCT FUNCTIONS (BILINGUAL)
REM ============================================================
:Prod_Hardware
mkdir "%~1\01_Requirements-Requisitos"
mkdir "%~1\02_DesignCAD-DisenoCAD"
mkdir "%~1\03_BOMs-ListaMateriales"
mkdir "%~1\04_Prototypes-Prototipos"
mkdir "%~1\05_Verification-VerificacionFEA"
mkdir "%~1\06_Risk-RiesgoFMEA"
mkdir "%~1\07_MfgFiles-ArchivosManufactura"
GOTO :EOF

:Prod_Software
mkdir "%~1\01_Requirements-Requisitos"
mkdir "%~1\02_Architecture-Arquitectura"
mkdir "%~1\03_SourceCode-CodigoFuente"
mkdir "%~1\04_Testing-Pruebas"
mkdir "%~1\05_Risk-RiesgoCiberseguridad"
mkdir "%~1\06_Release-Lanzamiento"
GOTO :EOF

:Prod_Optics
mkdir "%~1\01_Requirements-Requisitos"
mkdir "%~1\02_Design-DisenoZemax"
mkdir "%~1\03_Drawings-PlanosISO10110"
mkdir "%~1\04_Testing-PruebasMTF"
GOTO :EOF

:Prod_ML
mkdir "%~1\01_Datasets-ConjuntoDatos"
mkdir "%~1\02_Training-Entrenamiento"
mkdir "%~1\03_Models-Modelos"
mkdir "%~1\04_Validation-Validacion"
GOTO :EOF