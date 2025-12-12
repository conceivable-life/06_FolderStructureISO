@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM ============================================================
REM ¤ IVF SHARED DRIVE — WORKING DIRECTORY (WIP ONLY) ¤
REM ============================================================
REM ADVERTENCIA: Esta estructura es para TRABAJO DIARIO.
REM NO contiene registros oficiales firmados (DHF/DMR).

REM Generar nombre único
FOR /f "tokens=2 delims==" %%a IN ('wmic os get localdatetime /value') DO SET "dt=%%a"
SET "YYYYMMDD=%dt:~0,8%"
SET "HHMMSS=%dt:~8,6%"
SET "RANDOM_ID=!YYYYMMDD!-!HHMMSS!-%RANDOM%"

SET "ROOT=%CD%\IVF_SHARED_WORKSPACE_!RANDOM_ID!"

echo.
echo ——————————————————————————————————————————————————————————
echo • CREANDO SHARED DRIVE DE TRABAJO (WIP)
echo • LOCATION: %ROOT%
echo ——————————————————————————————————————————————————————————
echo.

mkdir "%ROOT%"

REM === CREAR ARCHIVO LEAME DE ADVERTENCIA ===
echo ======================================================== > "%ROOT%\00_READ_ME_FIRST.txt"
echo ESTE ES UN DIRECTORIO DE TRABAJO (WORKING DIRECTORY) >> "%ROOT%\00_READ_ME_FIRST.txt"
echo ======================================================== >> "%ROOT%\00_READ_ME_FIRST.txt"
echo. >> "%ROOT%\00_READ_ME_FIRST.txt"
echo 1. Este espacio es para BORRADORES, COLABORACION y ARCHIVOS NATIVOS (CAD, Word, Excel). >> "%ROOT%\00_READ_ME_FIRST.txt"
echo 2. NO guarde aqui registros finales firmados (PDFs oficiales). >> "%ROOT%\00_READ_ME_FIRST.txt"
echo 3. Los registros oficiales deben subirse al QMS Master Structure. >> "%ROOT%\00_READ_ME_FIRST.txt"
echo. >> "%ROOT%\00_READ_ME_FIRST.txt"
echo -------------------------------------------------------- >> "%ROOT%\00_READ_ME_FIRST.txt"


REM ============================================================
REM 1.0 ADMIN & GENERAL (Drafting Policies)
REM ============================================================
SET ADMIN=%ROOT%\01_Admin_General
mkdir "%ADMIN%"

mkdir "%ADMIN%\01_Templates_Logos-Plantillas"
mkdir "%ADMIN%\02_QMS_Drafting-RedaccionSGC"
REM Aqui se escriben las politicas antes de aprobarlas
mkdir "%ADMIN%\02_QMS_Drafting-RedaccionSGC\01_Procedures_WIP"
mkdir "%ADMIN%\02_QMS_Drafting-RedaccionSGC\02_Forms_WIP"
mkdir "%ADMIN%\03_General_Planning-PlaneacionGeneral"


REM ============================================================
REM 2.0 DEPARTMENTS (Daily Work)
REM ============================================================
SET DEPTS=%ROOT%\02_Departments-Departamentos
mkdir "%DEPTS%"

REM Espacios de trabajo por area funcional
mkdir "%DEPTS%\01_HumanResources-RRHH\WIP_Candidates"
mkdir "%DEPTS%\01_HumanResources-RRHH\Internal_Events"

mkdir "%DEPTS%\02_Finance-Finanzas\Quotes_In_Process"
mkdir "%DEPTS%\02_Finance-Finanzas\Budget_Drafts"

mkdir "%DEPTS%\03_SupplyChain-CadenaSuministro\Vendor_Conversations"
mkdir "%DEPTS%\03_SupplyChain-CadenaSuministro\Potential_Suppliers"

mkdir "%DEPTS%\04_Marketing-Marketing\Assets_Library"
mkdir "%DEPTS%\04_Marketing-Marketing\SocialMedia_Calendar"
mkdir "%DEPTS%\04_Marketing-Marketing\Events_Planning"

mkdir "%DEPTS%\05_IT_Facilities\Software_Licenses"
mkdir "%DEPTS%\05_IT_Facilities\Network_Diagrams"


REM ============================================================
REM 3.0 PRODUCT MANAGEMENT & DISCOVERY
REM ============================================================
SET PROD=%ROOT%\03_Product_Strategy-EstrategiaProducto
mkdir "%PROD%"

mkdir "%PROD%\01_User_Research-Entrevistas"
mkdir "%PROD%\02_Competitor_Analysis"
mkdir "%PROD%\03_Roadmap_Drafts"
mkdir "%PROD%\04_Feature_Requests-Solicitudes"


REM ============================================================
REM 4.0 ENGINEERING SANDBOX (Exploration)
REM ============================================================
SET SANDBOX=%ROOT%\04_Engineering_Sandbox-Exploracion
mkdir "%SANDBOX%"
REM Lugar sucio para pruebas rapidas
mkdir "%SANDBOX%\01_Crazy_Ideas"
mkdir "%SANDBOX%\02_PoC_Software"
mkdir "%SANDBOX%\03_3D_Printing_Files"
mkdir "%SANDBOX%\04_Papers_Research"


REM ============================================================
REM 5.0 ACTIVE PROJECTS (The Core Work)
REM ============================================================
SET PROJ=%ROOT%\05_Active_Projects-ProyectosActivos
mkdir "%PROJ%"

REM *** AURA SYSTEM V1 (WORKING FOLDER) ***
SET AURA=%PROJ%\01_Aura_System_V1_WIP
mkdir "%AURA%"

REM --- Project Admin ---
mkdir "%AURA%\00_Project_Admin\Meeting_Notes"
mkdir "%AURA%\00_Project_Admin\Schedules_Gantt"
mkdir "%AURA%\00_Project_Admin\Budget_Tracking"

REM --- Engineering Disciplines (General) ---
mkdir "%AURA%\01_System_Specs_Drafts"
mkdir "%AURA%\02_Risk_Analysis_Worksheets"

REM --- SUBSYSTEMS WORKSPACES ---
SET SUBSYS_ROOT=%AURA%\03_Subsystems_Workspaces
mkdir "%SUBSYS_ROOT%"

SET SUBS=03_C_DISH 04_C_SPERM 05_C_EGG 06_C_ICSI 07_C_HANDLER 09_C_CULTURE 10_C_NEXUS 13_C_ELN

FOR %%S IN (%SUBS%) DO (
    mkdir "%SUBSYS_ROOT%\%%S"
    
    REM 1. Mechanical Design (Native Files)
    mkdir "%SUBSYS_ROOT%\%%S\01_Mechanical_CAD_WIP"
    mkdir "%SUBSYS_ROOT%\%%S\01_Mechanical_CAD_WIP\SolidWorks_Assembly"
    mkdir "%SUBSYS_ROOT%\%%S\01_Mechanical_CAD_WIP\Drawings_Drafts"
    mkdir "%SUBSYS_ROOT%\%%S\01_Mechanical_CAD_WIP\Scratchpad"
    
    REM 2. Software (Links & Builds)
    mkdir "%SUBSYS_ROOT%\%%S\02_Software_Dev"
    mkdir "%SUBSYS_ROOT%\%%S\02_Software_Dev\Local_Logs"
    mkdir "%SUBSYS_ROOT%\%%S\02_Software_Dev\Temp_Builds"
    
    REM 3. Electronics
    mkdir "%SUBSYS_ROOT%\%%S\03_Electronics_WIP"
    mkdir "%SUBSYS_ROOT%\%%S\03_Electronics_WIP\Altium_Projects"
    mkdir "%SUBSYS_ROOT%\%%S\03_Electronics_WIP\Datasheets_Components"
    
    REM 4. Testing & Lab
    mkdir "%SUBSYS_ROOT%\%%S\04_Lab_Testing_RawData"
    mkdir "%SUBSYS_ROOT%\%%S\04_Lab_Testing_RawData\Video_Recordings"
    mkdir "%SUBSYS_ROOT%\%%S\04_Lab_Testing_RawData\Microscope_Images"
    mkdir "%SUBSYS_ROOT%\%%S\04_Lab_Testing_RawData\Excel_Data"
    
    REM 5. Integration
    mkdir "%SUBSYS_ROOT%\%%S\05_Integration_Notes"
)

REM ============================================================
REM 6.0 PERSONAL FOLDERS (Optional but recommended for ShareDrives)
REM ============================================================
SET PERS=%ROOT%\06_Personal_DropBox
mkdir "%PERS%"
mkdir "%PERS%\_READ_ME.txt" 
REM (Create a dummy text file explaining "Temporary files only, auto-delete in 30 days")


echo.
echo ——————————————————————————————————————————————————————————
echo • COMPLETED / COMPLETADO
echo • SHARED WORK DRIVE STRUCTURE GENERATED AT:
echo • %ROOT%
echo ——————————————————————————————————————————————————————————
echo.
pause