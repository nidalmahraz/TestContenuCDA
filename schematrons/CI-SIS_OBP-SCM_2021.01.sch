<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    CI-SIS_OBP-SCM_2021.01.sch    
    ......................................................................................................................................................    
    Auteur : ANS
    ......................................................................................................................................................    
    Historique :
        17/10/2013 : Création
        19/06/2015 : Maj des include telecom20110728.sch  -> telecom20150317.sch
        14/03/2018 : MAJ du pattern Variables
        20/11/2020 : Modification du nom du schématron JDV appelé (ancien JDV_routeOfAdministration_OBP.sch)
        10/09/2021 : Modification du nom du schématron

-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" defaultPhase="CI-SIS_OBP-SCM_2021.01"
    xmlns:cda="urn:hl7-org:v3" queryBinding="xslt2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" schemaVersion="CI-SIS_OBP-SCM_2021.01.sch">
    <title>Vérification de la conformité au modèle OBP-SCM_2021.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
    <!-- Abstract patterns -->    
    <include href="abstract/dansJeuDeValeurs.sch"/>
    <include href="abstract/IVL_TS.sch"/>
    
    <!-- Entete -->    
    <include href="include/specificationsVolets/OBP_2021.01/Entete/Entete_OBP.sch"/>
    
    <!-- Sections --> 
    <include href="include/specificationsVolets/OBP_2021.01/S_BirthOrganizer_OBP.sch"/>
    <include href="include/specificationsVolets/OBP_2021.01/S_activeProblem_OBP.sch"/>
    <include href="include/specificationsVolets/OBP_2021.01/S_codedDetailedPhysicalExamination_OBP.sch"/>
    <include href="include/specificationsVolets/OBP_2021.01/S_codedSocialHistory_OBP.sch"/>
    <include href="include/specificationsVolets/OBP_2021.01/S_patientEducationAndConsents_OBP.sch"/>
    <include href="include/specificationsVolets/OBP_2021.01/S_pregnancyHistoryOrganizer_OBP.sch"/>
        
    <!-- JDV --> 
    <include href="include/jeuxDeValeurs/OBP_2021.01/JDV_LesionTraumatiqueObstetricale_OBP.sch"/>
    <include href="include/jeuxDeValeurs/OBP_2021.01/JDV_approachSiteCode_OBP.sch"/>
    <include href="include/jeuxDeValeurs/OBP_2021.01/JDV_TypePortageAgentInfectieux_OBP.sch"/>
    <include href="include/jeuxDeValeurs/OBP_2021.01/JDV_CertitudeDiagnostic-CISIS.sch"/>
    <include href="include/jeuxDeValeurs/OBP_2021.01/JDV_TypeInfectionNN_OBP.sch"/>
    <include href="include/jeuxDeValeurs/OBP_2021.01/JDV_ModeSortie_OBP.sch"/>
    <include href="include/jeuxDeValeurs/OBP_2021.01/JDV_TypeAllaitementNN_OBP.sch"/>
        
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    <!--           Phase en vigueur            -->    
    <!-- ::::::::::::::::::::::::::::::::::::: -->
    
    <phase id="CI-SIS_OBP-SCM_2021.01">
        <active pattern="variables"/>
        <p>Vérification complète de la conformité au CI-SIS</p>
        
        <!-- Activation Entete -->
        <active pattern="Entete_OBP"/>
        
        <!-- Activation Sections -->
        <active pattern="S_BirthOrganizer_OBP"/>
        <active pattern="S_activeProblem_OBP"/>
        <active pattern="S_CodedDetailedPhysicalExamination_OPB.sch"/>
        <active pattern="S_codedSocialHistory_OBP"/>
        <active pattern="S_patientEducationAndConsents_OBP"/>
        <active pattern="S_pregnancyHistoryOrganizer_OBP"/>
        
        <!-- Activation JDV -->
        <active pattern="JDV_approachSiteCode_OBP"/>
        <active pattern="JDV_ModeSortie_OBP"/>
        <active pattern="JDV_LesionTraumatiqueObstetricale_OBP"/>
        <active pattern="JDV_TypePortageAgentInfectieux_OBP"/>
        <active pattern="JDV_CertitudeDiagnostic-CISIS"/>
        <active pattern="JDV_TypeInfectionNN_OBP"/>
        <active pattern="JDV_TypeAllaitementNN_OBP"/>
        
    </phase>

    <!-- Variables globales -->

    <pattern id="variables">
        
        <!-- chemins relatifs des fichiers jeux de valeurs -->
        <let name="jdv_approachSiteCode_OBP" value="'../jeuxDeValeurs/JDV_HL7_RouteOfAdministration-CISIS.xml'"/>
        <let name="JDV_CertitudeDiagnostic-CISIS" value="'../jeuxDeValeurs/JDV_CertitudeDiagnostic-CISIS.xml'"/>
        <let name="jdv_OBP_ModeSortie" value="'../jeuxDeValeurs/JDV_OBP_ModeSortie-CISIS.xml'"/>
        <let name="jdv_OBP_LesionTraumatiqueObstetricale" value="'../jeuxDeValeurs/JDV_OBP_LesionTraumatiqueObstetricale-CISIS.xml'"/>
        <let name="jdv_OBP_TypePortageAgentInfectieux" value="'../jeuxDeValeurs/JDV_OBP_TypePortageAgentInfectieux-CISIS.xml'"/>
        <let name="jdv_OBP_TypeInfectionNN" value="'../jeuxDeValeurs/JDV_OBP_TypeInfectionNN-CISIS.xml'"/>
        <let name="jdv_OBP_TypeAllaitementNN" value="'../jeuxDeValeurs/JDV_OBP_TypeAllaitementNN-CISIS.xml'"/>
        
        <rule context="cda:ClinicalDocument">
            <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.4']"> 
                [CI-SIS_OBP-SCM_2021.01] Le template "Synthèse Suites de Couches Mère (SCM)" (1.2.250.1.213.1.1.1.12.4) doit être présent.
            </assert>
            
            <assert test="./cda:code[@code='15508-5' and @codeSystem='2.16.840.1.113883.6.1']"> 
                [CI-SIS_OBP-SCM_2021.01] L'élément code doit avoir @code ="15508-5" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
            </assert>
        </rule>
    </pattern>
</schema>
