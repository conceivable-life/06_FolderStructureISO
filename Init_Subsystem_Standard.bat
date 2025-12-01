@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM ============================================================
REM ¤ ISO 13485 — SUBSYSTEM GENERATOR (PORTABLE) ¤
REM ============================================================
REM Ejecuta este script DENTRO de la carpeta del subsistema.
REM Genera la estructura estándar bilingüe (EN/ES) en el directorio actual.

SET "ROOT=%CD%"

echo.
echo ——————————————————————————————————————————————————————————
echo • INITIALIZING STANDARD SUBSYSTEM STRUCTURE
echo • INICIALIZANDO ESTRUCTURA ESTANDAR DE SUBSISTEMA
echo.
echo • TARGET: %ROOT%
echo ——————————————————————————————————————————————————————————
echo.
echo Press any key to confirm... / Presione una tecla para confirmar...
pause >nul

echo ... Generating structure...

REM ============================================================
REM A. INTEGRATION & MANAGEMENT
REM ============================================================
mkdir "00_IntegrationSpecs-EspecificacionesIntegracion"

mkdir "00_LocalMgmt-GestionLocal\01_CM-Configuracion"
mkdir "00_LocalMgmt-GestionLocal\02_ChM-ControlCambios"


REM ============================================================
REM B. PRODUCT INTEGRATION (PI) - MANUFACTURING
REM ============================================================
mkdir "01_ProductIntegration-IntegracionProducto"
CALL :Sub_PI "01_ProductIntegration-IntegracionProducto"


REM ============================================================
REM C. ENGINEERING DISCIPLINES (HW, SW, OP, ML)
REM ============================================================

REM 1. Mechatronics
mkdir "02_Mechatronics-Mecatronica"
CALL :Prod_Hardware "02_Mechatronics-Mecatronica"

REM 2. Software / Firmware
mkdir "03_Software-Software"
CALL :Prod_Software "03_Software-Software"

REM 3. Optics
mkdir "04_Optics-Optica"
CALL :Prod_Optics "04_Optics-Optica"

REM 4. Machine Learning / AI
mkdir "05_MachineLearning-IA"
CALL :Prod_ML "05_MachineLearning-IA"


REM ============================================================
REM D. AUTOMATION PROTOCOLS (ROBOTICS VALIDATION)
REM ============================================================
mkdir "06_AutomationProtocols-ProtocolosAutomatizacion\01_Definitions-Definiciones"
mkdir "06_AutomationProtocols-ProtocolosAutomatizacion\02_Logs-DatosCrudos"
mkdir "06_AutomationProtocols-ProtocolosAutomatizacion\03_Reports-Reportes"


REM ============================================================
REM E. SYSTEM VERIFICATION (V-MODEL IQ/OQ/PQ)
REM ============================================================
mkdir "07_SystemVerification-VerificacionSistema"
CALL :Sub_Verification "07_SystemVerification-VerificacionSistema"


REM ============================================================
REM F. USER DOCUMENTATION (LABELING / IFU)
REM ============================================================
mkdir "08_UserDocs-DocumentacionUsuario"
CALL :Sub_UserDocs "08_UserDocs-DocumentacionUsuario"


echo.
echo ——————————————————————————————————————————————————————————
echo • DONE / COMPLETADO
echo • Subsystem ready at: %ROOT%
echo ——————————————————————————————————————————————————————————
echo.
pause
exit /b


REM ============================================================
REM =============== FUNCTIONS (STANDARD TEMPLATES) =============
REM ============================================================

:Sub_PI
REM Product Integration / Integracion de Producto
mkdir "%~1\01_ICDs-DocumentosControlInterfaz"
mkdir "%~1\02_AssemblySOPs-InstruccionesEnsamble"
mkdir "%~1\03_MfgChecklists-ListasVerificacionManufactura"
mkdir "%~1\04_IntegrationBuilds-RegistrosIntegracion"
mkdir "%~1\05_CableHarness-ArnesesCables"
GOTO :EOF

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

:Sub_Verification
REM V&V
mkdir "%~1\01_MasterVerificationPlan-PlanMaestroVerificacion"
mkdir "%~1\02_TestProtocols-ProtocolosPrueba\01_IQ-Instalacion"
mkdir "%~1\02_TestProtocols-ProtocolosPrueba\02_OQ-Operacion"
mkdir "%~1\02_TestProtocols-ProtocolosPrueba\03_PQ-Desempeno"
mkdir "%~1\03_TestReports-ResultadosPrueba"
mkdir "%~1\04_TraceabilityMatrix-MatrizTrazabilidad"
mkdir "%~1\05_DefectLog-RegistroDefectos"
GOTO :EOF

:Sub_UserDocs
REM Labeling / Etiquetado
mkdir "%~1\01_UserManual-ManualUsuario"
mkdir "%~1\02_UserChecklists-ListasUsuario"
mkdir "%~1\03_QuickRefGuides-GuiasRapidas"
mkdir "%~1\04_Labels-EtiquetasSeguridad"
mkdir "%~1\05_TrainingMaterials-MaterialEntrenamiento"
GOTO :EOF