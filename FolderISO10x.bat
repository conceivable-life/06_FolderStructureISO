@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM ============================================================
REM ¤ ISO 13485 — IVF MASTER STRUCTURE — REFINED V4 (LAB OPS) ¤
REM ============================================================

REM Generar nombre único / Generate unique name
FOR /f "tokens=2 delims==" %%a IN ('wmic os get localdatetime /value') DO SET "dt=%%a"
SET "YYYYMMDD=%dt:~0,8%"
SET "HHMMSS=%dt:~8,6%"
SET "RANDOM_ID=!YYYYMMDD!-!HHMMSS!-%RANDOM%"

SET "ROOT=%CD%\IVF_MASTER_V4_!RANDOM_ID!"

echo.
echo ——————————————————————————————————————————————————————————
echo • CREATING REFINED MASTER STRUCTURE (LAB OPS VERSION)
echo • LOCATION: %ROOT%
echo ——————————————————————————————————————————————————————————
echo.

mkdir "%ROOT%"


REM ============================================================
REM 1.0 GOVERNANCE / GOBERNANZA
REM ============================================================
SET GOV=%ROOT%\00_Governance-Gobernanza
echo ... 00 Governance
mkdir "%GOV%"

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

REM Central ISO Documentation
CALL :MakeISO_Deep "%GOV%"


REM ============================================================
REM 2.0 STRATEGIC PROCESSES / PROCESOS ESTRATEGICOS
REM ============================================================
SET STRA=%ROOT%\01_StrategicProcesses-ProcesosEstrategicos
echo ... 01 Strategic
mkdir "%STRA%"

mkdir "%STRA%\01_RiskManagement-GestionRiesgos\01_RiskPlan-PlanRiesgos"
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\02_HazardAnalysis-AnalisisPeligros"
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\03_RiskEvaluation-EvaluacionRiesgos"
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\04_RiskControls-ControlesRiesgos"
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\05_RiskReport-ReporteRiesgos"
mkdir "%STRA%\01_RiskManagement-GestionRiesgos\06_PostProduction-PostProduccion"

mkdir "%STRA%\02_RegulatoryAffairs-AsuntosRegulatorios\01_FDA_510k"
mkdir "%STRA%\02_RegulatoryAffairs-AsuntosRegulatorios\02_CE_MDR"
mkdir "%STRA%\02_RegulatoryAffairs-AsuntosRegulatorios\03_LocalRegistrations-RegistrosLocales"
mkdir "%STRA%\02_RegulatoryAffairs-AsuntosRegulatorios\04_LabelingUDI-EtiquetadoUDI"

mkdir "%STRA%\03_AuditsCAPA-AuditoriasCAPA\01_InternalAudits-AuditoriasInternas"
mkdir "%STRA%\03_AuditsCAPA-AuditoriasCAPA\02_ExternalAudits-AuditoriasExternas"
mkdir "%STRA%\03_AuditsCAPA-AuditoriasCAPA\03_SupplierAudits-AuditoriasProveedores"
mkdir "%STRA%\03_AuditsCAPA-AuditoriasCAPA\04_CAPA-AccionesCorrectivas"
mkdir "%STRA%\03_AuditsCAPA-AuditoriasCAPA\05_NonConformities-NoConformidades"

mkdir "%STRA%\04_ConfigManagement-GestionConfiguracion\01_Plans-Planes"
mkdir "%STRA%\04_ConfigManagement-GestionConfiguracion\02_Baselines-LineasBase"

mkdir "%STRA%\05_ProjectManagement-GestionProyectos\01_Portfolio-Portafolio"
mkdir "%STRA%\05_ProjectManagement-GestionProyectos\02_Resources-Recursos"

mkdir "%STRA%\06_KPIs-Indicadores\01_QualityObjectives-ObjetivosCalidad"
mkdir "%STRA%\06_KPIs-Indicadores\02_Dashboard-Tablero"


REM ============================================================
REM 3.0 OPERATIONAL PROCESSES / PROCESOS OPERATIVOS
REM ============================================================
SET OPER=%ROOT%\02_OperationalProcesses-ProcesosOperativos
echo ... 02 Operational
mkdir "%OPER%"

REM 1. Supply Chain
mkdir "%OPER%\01_SupplyChain-CadenaSuministro\01_Purchasing-Compras"
mkdir "%OPER%\01_SupplyChain-CadenaSuministro\02_ASL-ListaProveedoresAprobados"
mkdir "%OPER%\01_SupplyChain-CadenaSuministro\03_ContractManufacturing-ManufacturaTerceros"
mkdir "%OPER%\01_SupplyChain-CadenaSuministro\04_IncomingInspection-InspeccionRecibo"
mkdir "%OPER%\01_SupplyChain-CadenaSuministro\05_Inventory-Inventario"
mkdir "%OPER%\01_SupplyChain-CadenaSuministro\06_Logistics-Logistica"

REM 2. Product Management (WITH UX)
SET PRODMAN=%OPER%\02_ProductManagement-GestionProducto
mkdir "%PRODMAN%"
CALL :MakeProdMgmt "%PRODMAN%"

REM 3. Exploration
SET EXPL=%OPER%\03_Exploration-Exploracion
mkdir "%EXPL%"
CALL :MakeExploration "%EXPL%"

REM 4. Engineering Root
SET ENG=%OPER%\04_Engineering-Ingenieria
mkdir "%ENG%"

REM 5. LAB OPS (RENAMED FROM BIO LAB)
mkdir "%OPER%\05_LabOps-OperacionesLaboratorio\01_CleanroomProtocols-ProtocolosCuartoLimpio"
mkdir "%OPER%\05_LabOps-OperacionesLaboratorio\02_MediaControl-ControlMedios"
mkdir "%OPER%\05_LabOps-OperacionesLaboratorio\03_SterilizationRecords-RegistrosEsterilizacion"
mkdir "%OPER%\05_LabOps-OperacionesLaboratorio\04_EquipmentCalibration-CalibracionEquipos"


REM ============================================================
REM 4.1 GLOBAL DOMAINS (UPDATED LIST)
REM ============================================================
echo ... 4.1 Global Engineering Domains
SET DOM_ROOT=%ENG%\00_GlobalDomains-DominiosGlobales
mkdir "%DOM_ROOT%"

SET DOMAINS="01_ProjectManagement-GestionProyectos" "02_SoftwareEngineering-IngenieriaSoftware" "03_SystemsEngineering-IngenieriaSistemas" "04_MachineLearning-AprendizajeAutomatico" "05_QualityAssurance-AseguramientoCalidad" "06_Mechatronics-Mecatronica" "07_Optics-Optica" "08_Research-Investigacion" "09_VerVal-VerificacionValidacion" "10_DevOps-Despliegue" "11_Data-Datos" "12_Infrastructure-Infraestructura"

FOR %%D IN (%DOMAINS%) DO (
    mkdir "%DOM_ROOT%\%%~D"
    
    IF "%%~D"=="08_Research-Investigacion" (
        CALL :Domain_Research "%DOM_ROOT%\%%~D"
    ) ELSE IF "%%~D"=="09_VerVal-VerificacionValidacion" (
        CALL :Domain_VerVal "%DOM_ROOT%\%%~D"
    ) ELSE IF "%%~D"=="05_QualityAssurance-AseguramientoCalidad" (
        CALL :Domain_QA_Enhanced "%DOM_ROOT%\%%~D"
    ) ELSE IF "%%~D"=="11_Data-Datos" (
        CALL :Domain_Data "%DOM_ROOT%\%%~D"
    ) ELSE IF "%%~D"=="12_Infrastructure-Infraestructura" (
        CALL :Domain_Infra "%DOM_ROOT%\%%~D"
    ) ELSE IF "%%~D"=="02_SoftwareEngineering-IngenieriaSoftware" (
        CALL :Domain_SW "%DOM_ROOT%\%%~D"
    ) ELSE IF "%%~D"=="06_Mechatronics-Mecatronica" (
        CALL :Domain_HW "%DOM_ROOT%\%%~D"
    ) ELSE IF "%%~D"=="04_MachineLearning-AprendizajeAutomatico" (
        CALL :Domain_ML "%DOM_ROOT%\%%~D"
    ) ELSE IF "%%~D"=="07_Optics-Optica" (
        CALL :Domain_OP "%DOM_ROOT%\%%~D"
    ) ELSE (
        CALL :Domain_Mgmt "%DOM_ROOT%\%%~D"
    )
)


REM ============================================================
REM 4.2 ACTIVE PROJECTS (AURA V1)
REM ============================================================
echo ... 4.2 Active Projects
SET PROJ_ROOT=%ENG%\01_ActiveProjects-ProyectosActivos
mkdir "%PROJ_ROOT%"

SET AURA=%PROJ_ROOT%\01_Aura_System_V1
mkdir "%AURA%"

REM --- Aura Mgmt ---
mkdir "%AURA%\01_ProjectManagement-GestionProyecto\01_Schedule-Cronograma"
mkdir "%AURA%\01_ProjectManagement-GestionProyecto\02_Budget-Presupuesto"
mkdir "%AURA%\02_SystemsEngineering-IngenieriaSistema\01_SystemRequirements-RequisitosSistema"
mkdir "%AURA%\02_SystemsEngineering-IngenieriaSistema\02_SystemArchitecture-ArquitecturaSistema"
mkdir "%AURA%\02_SystemsEngineering-IngenieriaSistema\03_CM-GestionConfiguracion"
mkdir "%AURA%\02_SystemsEngineering-IngenieriaSistema\04_ChM-ControlCambios"
mkdir "%AURA%\03_RiskManagement-RiesgosProducto\01_FMEA-AnalisisModoFalla"
mkdir "%AURA%\04_Regulatory-RegulatorioEspecifico\01_DHF_Index-IndiceDHF"


REM ============================================================
REM 4.3 AURA SUBSYSTEMS (WITH MECH/TEST/RESEARCH)
REM ============================================================
SET SUBSYS_ROOT=%AURA%\33_Subsystems-Subsistemas
mkdir "%SUBSYS_ROOT%"

SET SUBS=03_C_DISH 04_C_SPERM 05_C_EGG 06_C_ICSI 07_C_HANDLER 09_C_CULTURE 10_C_NEXUS 13_C_ELN

FOR %%S IN (%SUBS%) DO (
    echo ... Configuring Subsystem: %%S
    mkdir "%SUBSYS_ROOT%\%%S"
    
    REM A. Core Integration
    mkdir "%SUBSYS_ROOT%\%%S\00_IntegrationSpecs-EspecificacionesIntegracion"
    mkdir "%SUBSYS_ROOT%\%%S\01_ProductIntegration-IntegracionProducto"
    CALL :Sub_PI "%SUBSYS_ROOT%\%%S\01_ProductIntegration-IntegracionProducto"
    
    REM B. Disciplines
    mkdir "%SUBSYS_ROOT%\%%S\02_Mechatronics-Mecatronica"
    CALL :Prod_Hardware "%SUBSYS_ROOT%\%%S\02_Mechatronics-Mecatronica"
    
    mkdir "%SUBSYS_ROOT%\%%S\03_Software-Software"
    CALL :Prod_Software "%SUBSYS_ROOT%\%%S\03_Software-Software"
    
    mkdir "%SUBSYS_ROOT%\%%S\04_Optics-Optica"
    CALL :Prod_Optics "%SUBSYS_ROOT%\%%S\04_Optics-Optica"

    mkdir "%SUBSYS_ROOT%\%%S\05_MachineLearning-IA"
    CALL :Prod_ML "%SUBSYS_ROOT%\%%S\05_MachineLearning-IA"
    
    REM C. Specialized Subsystem Folders
    mkdir "%SUBSYS_ROOT%\%%S\06_Testing-Pruebas"
    CALL :Sub_Testing "%SUBSYS_ROOT%\%%S\06_Testing-Pruebas"
    
    mkdir "%SUBSYS_ROOT%\%%S\07_Research-Investigacion"
    CALL :Sub_Research "%SUBSYS_ROOT%\%%S\07_Research-Investigacion"
    
    mkdir "%SUBSYS_ROOT%\%%S\08_AutomationProtocols-ProtocolosAutomatizacion"
    CALL :Sub_Auto "%SUBSYS_ROOT%\%%S\08_AutomationProtocols-ProtocolosAutomatizacion"
    
    REM D. User Docs
    mkdir "%SUBSYS_ROOT%\%%S\09_UserDocs-DocumentacionUsuario"
    CALL :Sub_UserDocs "%SUBSYS_ROOT%\%%S\09_UserDocs-DocumentacionUsuario"
)


REM ============================================================
REM 5.0 SUPPORT PROCESSES
REM ============================================================
SET SUP=%ROOT%\03_SupportProcesses-ProcesosSoporte
echo ... 03 Support
mkdir "%SUP%"

mkdir "%SUP%\01_HumanResources-RRHH\01_OrgCharts-Organigramas"
mkdir "%SUP%\01_HumanResources-RRHH\02_TrainingRecords-RegistrosEntrenamiento"
mkdir "%SUP%\01_HumanResources-RRHH\03_CompetencyMatrix-MatrizCompetencias"
mkdir "%SUP%\01_HumanResources-RRHH\04_Onboarding-Induccion"

mkdir "%SUP%\02_IT-TI\01_Infrastructure-Infraestructura"
mkdir "%SUP%\02_IT-TI\02_Cybersecurity-Ciberseguridad"
mkdir "%SUP%\02_IT-TI\03_Backups-Respaldos"
mkdir "%SUP%\02_IT-TI\04_SoftwareValidation-ValidacionSoftware" 

mkdir "%SUP%\03_Marketing-Marketing\01_BrandAssets-ActivosMarca"
mkdir "%SUP%\03_Marketing-Marketing\02_MarketResearch-InvestigacionMercado"
mkdir "%SUP%\03_Marketing-Marketing\03_Campaigns-Campanas"
mkdir "%SUP%\03_Marketing-Marketing\04_Events-Eventos"
mkdir "%SUP%\03_Marketing-Marketing\05_Content-Contenido"

mkdir "%SUP%\04_Facilities-Infraestructura\01_MaintenancePlans-PlanesMantenimiento"
mkdir "%SUP%\04_Facilities-Infraestructura\02_Calibration-Calibracion"
mkdir "%SUP%\04_Facilities-Infraestructura\03_EnvironmentalControl-ControlAmbiental"

mkdir "%SUP%\05_Finance-Finanzas"
mkdir "%SUP%\06_Legal-Juridico"
mkdir "%SUP%\07_Comms-Comunicacion"
mkdir "%SUP%\08_Admin-Administracion"


echo.
echo ——————————————————————————————————————————————————————————
echo • COMPLETED / COMPLETADO
echo • REFINED MASTER STRUCTURE GENERATED AT:
echo • %ROOT%
echo ——————————————————————————————————————————————————————————
echo.
pause
exit /b


REM ============================================================
REM =============== FUNCTIONS (UPDATED) ========================
REM ============================================================

:MakeISO_Deep
mkdir "%~1\07_ISODocumentation-DocumentacionISO\A_Normative-Normativos\01_Procedures-Procedimientos"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\A_Normative-Normativos\02_WorkInstructions-InstruccionesTrabajo"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\A_Normative-Normativos\03_Policies-Politicas"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\A_Normative-Normativos\04_Specs-Especificaciones"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\B_Controlled-Controlados\01_Forms-Formularios"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\B_Controlled-Controlados\02_Records-Registros"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\B_Controlled-Controlados\03_MasterLists-ListasMaestras"
mkdir "%~1\07_ISODocumentation-DocumentacionISO\C_Uncontrolled-NoControlados\01_Drafts-Borradores"
GOTO :EOF

:MakeProdMgmt
REM Product Management with UX
mkdir "%~1\01_Strategy-Estrategia\01_VisionMission"
mkdir "%~1\01_Strategy-Estrategia\02_Roadmap-MapaRuta"
mkdir "%~1\01_Strategy-Estrategia\03_OKRs-Objetivos"
mkdir "%~1\02_Discovery-Descubrimiento\01_UserResearch-InvestigacionUsuario"
mkdir "%~1\02_Discovery-Descubrimiento\02_CompetitorAnalysis-AnalisisCompetencia"
mkdir "%~1\02_Discovery-Descubrimiento\03_Personas-PerfilesUsuario"
mkdir "%~1\02_Discovery-Descubrimiento\04_VoiceOfCustomer-VozCliente"
mkdir "%~1\03_Definition-Definicion\01_PRDs-DocumentosRequisitos"
mkdir "%~1\03_Definition-Definicion\02_UserStories-HistoriasUsuario"
mkdir "%~1\03_Definition-Definicion\03_DesignSpecs-SpecsDiseno"
mkdir "%~1\04_Backlog-Backlog\01_Epics-Epicas"
mkdir "%~1\04_Backlog-Backlog\02_Prioritization-Priorizacion"
mkdir "%~1\05_GoToMarket-Lanzamiento\01_LaunchPlan-PlanLanzamiento"
mkdir "%~1\05_GoToMarket-Lanzamiento\02_SalesEnablement-MaterialVentas"
mkdir "%~1\05_GoToMarket-Lanzamiento\03_Pricing-Precios"
mkdir "%~1\06_Analytics-Analitica\01_ProductMetrics-MetricasProducto"
REM *** NEW UX FOLDER ***
mkdir "%~1\07_UX-ExperienciaUsuario\01_UserResearch-Investigacion"
mkdir "%~1\07_UX-ExperienciaUsuario\02_Wireframes-PrototiposBajaFidelidad"
mkdir "%~1\07_UX-ExperienciaUsuario\03_Prototypes-PrototiposAltaFidelidad"
mkdir "%~1\07_UX-ExperienciaUsuario\04_UsabilityTesting-PruebasUsabilidad"
GOTO :EOF

:MakeExploration
REM Exploration Sandbox
SET DOMAINS="01_Concepts-Conceptos" "02_Software-Software" "03_Mechatronics-Mecatronica" "04_Optics-Optica" "05_AI_Models-ModelosIA"
FOR %%D IN (%DOMAINS%) DO (
    mkdir "%~1\%%~D\01_Ideas-Ideacion"
    mkdir "%~1\%%~D\02_Prototypes-Prototipos"
    mkdir "%~1\%%~D\03_Feasibility-Factibilidad"
    mkdir "%~1\%%~D\04_References-Referencias"
)
GOTO :EOF

REM --- NEW & UPDATED DOMAIN FUNCTIONS ---

:Domain_Data
REM New Data Domain
mkdir "%~1\01_DataGovernance-GobernanzaDatos"
mkdir "%~1\02_DataArchitecture-ArquitecturaDatos"
mkdir "%~1\03_SecurityPrivacy-SeguridadPrivacidad"
mkdir "%~1\04_AnalyticsBI-AnaliticaBI"
GOTO :EOF

:Domain_Infra
REM New Infrastructure Domain
mkdir "%~1\01_Cloud-Nube"
mkdir "%~1\02_OnPremise-Local"
mkdir "%~1\03_Networking-Redes"
mkdir "%~1\04_Security-SeguridadPerimetral"
GOTO :EOF

:Domain_QA_Enhanced
REM QA with QC
mkdir "%~1\01_QMS_Processes-ProcesosSGC"
mkdir "%~1\02_Audits-Auditorias"
mkdir "%~1\03_CAPA-AccionesCorrectivas"
REM *** NEW QC FOLDER ***
mkdir "%~1\04_QualityControl-ControlCalidad\01_IncomingInspection-InspeccionRecibo"
mkdir "%~1\04_QualityControl-ControlCalidad\02_InProcess-EnProceso"
mkdir "%~1\04_QualityControl-ControlCalidad\03_FinalInspection-InspeccionFinal"
mkdir "%~1\04_QualityControl-ControlCalidad\04_Calibration-CalibracionEquipos"
GOTO :EOF

:Domain_VerVal
REM Renamed & Expanded VerVal
mkdir "%~1\01_VerificationPlans-PlanesVerificacion"
mkdir "%~1\02_ValidationPlans-PlanesValidacion"
mkdir "%~1\03_Traceability-Trazabilidad"
mkdir "%~1\04_RegressionTesting-PruebasRegresion"
mkdir "%~1\05_Tools-HerramientasAutomatizacion"
GOTO :EOF

:Domain_Research
REM Renamed Research with Clinical Protocols
mkdir "%~1\01_ClinicalProtocols-ProtocolosClinicos"
mkdir "%~1\02_LiteratureReview-RevisionLiteratura"
mkdir "%~1\03_FeasibilityStudies-EstudiosFactibilidad"
mkdir "%~1\04_Publications-Publicaciones"
GOTO :EOF

REM --- Existing Domain Functions ---
:Domain_SW
mkdir "%~1\01_CodingStds-EstandaresCodigo"
mkdir "%~1\02_CommonLibraries-LibreriasComunes"
GOTO :EOF
:Domain_HW
mkdir "%~1\01_CAD_Standards-EstandaresCAD"
mkdir "%~1\02_PartLibraries-LibreriasPartes"
GOTO :EOF
:Domain_OP_IVF
mkdir "%~1\01_MicroscopyStds-EstandaresMicroscopia"
mkdir "%~1\02_LensCatalog-CatalogoLentes"
GOTO :EOF
:Domain_ML_IVF
mkdir "%~1\01_ModelZoo-ModelosEmbrion"
mkdir "%~1\02_DataPrivacy-PrivacidadDatos"
GOTO :EOF
:Domain_SE_Robust
mkdir "%~1\01_Requirements-RequisitosSistema"
mkdir "%~1\02_Architecture-ArquitecturaSistema"
GOTO :EOF
:Domain_PM_Robust
mkdir "%~1\01_ProjectPlan-PlanMaestro"
mkdir "%~1\02_Schedule-Cronograma"
GOTO :EOF
:Domain_Mgmt
mkdir "%~1\01_Standards-Estandares"
mkdir "%~1\02_Templates-Plantillas"
GOTO :EOF

REM --- SUBSYSTEM PRODUCT FUNCTIONS ---

:Prod_Hardware
REM Mechatronics
mkdir "%~1\01_Requirements-Requisitos"
mkdir "%~1\02_DesignCAD-DisenoCAD"
mkdir "%~1\03_BOMs-ListaMateriales"
mkdir "%~1\04_AssemblyInstructions-InstruccionesArmado"
mkdir "%~1\05_Drawings-PlanosFabricacion"
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
GOTO :EOF

:Prod_ML
mkdir "%~1\01_Datasets-ConjuntoDatos"
mkdir "%~1\02_Training-Entrenamiento"
mkdir "%~1\03_Models-Modelos"
mkdir "%~1\04_Validation-Validacion"
GOTO :EOF

:Sub_PI
mkdir "%~1\01_ICDs-DocumentosControlInterfaz"
mkdir "%~1\02_AssemblySOPs-InstruccionesEnsamble"
mkdir "%~1\03_MfgChecklists-ListasVerificacionManufactura"
mkdir "%~1\04_IntegrationBuilds-RegistrosIntegracion"
mkdir "%~1\05_CableHarness-ArnesesCables"
GOTO :EOF

:Sub_Auto
mkdir "%~1\01_Definitions-Definiciones"
mkdir "%~1\02_Logs-Registros"
mkdir "%~1\03_Reports-Reportes"
GOTO :EOF

:Sub_Verification
mkdir "%~1\01_MVP-PlanMaestro"
mkdir "%~1\02_TestProtocols_IQ_OQ_PQ"
mkdir "%~1\03_TestReports-Resultados"
mkdir "%~1\04_Traceability-Trazabilidad"
GOTO :EOF

:Sub_UserDocs
mkdir "%~1\01_UserManual-ManualUsuario"
mkdir "%~1\02_UserChecklists-ListasUsuario"
mkdir "%~1\03_QuickRefGuides-GuiasRapidas"
mkdir "%~1\04_Labels-EtiquetasSeguridad"
GOTO :EOF

:Sub_Testing
REM New Subsystem Testing Folder
mkdir "%~1\01_UnitTesting-PruebasUnitarias"
mkdir "%~1\02_IntegrationTesting-PruebasIntegracion"
mkdir "%~1\03_SystemTesting-PruebasSistema"
mkdir "%~1\04_TestResults-Resultados"
GOTO :EOF

:Sub_Research
REM New Subsystem Research Folder
mkdir "%~1\01_ClinicalProtocols-ProtocolosClinicos"
mkdir "%~1\02_Tests-Pruebas"
mkdir "%~1\03_DataCollection-RecoleccionDatos"
GOTO :EOF