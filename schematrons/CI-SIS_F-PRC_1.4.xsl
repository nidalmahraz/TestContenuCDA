<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:schold="http://www.ascc.net/xml/schematron"
                xmlns:iso="http://purl.oclc.org/dsdl/schematron"
                xmlns:cda="urn:hl7-org:v3"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:jdv="http://esante.gouv.fr"
                xmlns:svs="urn:ihe:iti:svs:2008"
                version="2.0"><!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
<xsl:param name="archiveDirParameter"/>
   <xsl:param name="archiveNameParameter"/>
   <xsl:param name="fileNameParameter"/>
   <xsl:param name="fileDirParameter"/>
   <xsl:variable name="document-uri">
      <xsl:value-of select="document-uri(/)"/>
   </xsl:variable>

   <!--PHASES-->


<!--PROLOG-->
<xsl:output xmlns:svrl="http://purl.oclc.org/dsdl/svrl" method="xml"
               omit-xml-declaration="no"
               standalone="yes"
               indent="yes"/>

   <!--XSD TYPES FOR XSLT2-->


<!--KEYS AND FUNCTIONS-->


<!--DEFAULT RULES-->


<!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<xsl:template match="*" mode="schematron-select-full-path">
      <xsl:apply-templates select="." mode="schematron-get-full-path-2"/>
   </xsl:template>

   <!--MODE: SCHEMATRON-FULL-PATH-->
<!--This mode can be used to generate an ugly though full XPath for locators-->
<xsl:template match="*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">
            <xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>*:</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>[namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:variable name="preceding"
                    select="count(preceding-sibling::*[local-name()=local-name(current())                                   and namespace-uri() = namespace-uri(current())])"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="@*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">@<xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>@*[local-name()='</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>' and namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <!--MODE: SCHEMATRON-FULL-PATH-2-->
<!--This mode can be used to generate prefixed XPath for humans-->
<xsl:template match="node() | @*" mode="schematron-get-full-path-2">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="preceding-sibling::*[name(.)=name(current())]">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-3-->
<!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
<xsl:template match="node() | @*" mode="schematron-get-full-path-3">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="parent::*">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>

   <!--MODE: GENERATE-ID-FROM-PATH -->
<xsl:template match="/" mode="generate-id-from-path"/>
   <xsl:template match="text()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
   </xsl:template>
   <xsl:template match="comment()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.@', name())"/>
   </xsl:template>
   <xsl:template match="*" mode="generate-id-from-path" priority="-0.5">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:text>.</xsl:text>
      <xsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
   </xsl:template>

   <!--MODE: GENERATE-ID-2 -->
<xsl:template match="/" mode="generate-id-2">U</xsl:template>
   <xsl:template match="*" mode="generate-id-2" priority="2">
      <xsl:text>U</xsl:text>
      <xsl:number level="multiple" count="*"/>
   </xsl:template>
   <xsl:template match="node()" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>n</xsl:text>
      <xsl:number count="node()"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="string-length(local-name(.))"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="translate(name(),':','.')"/>
   </xsl:template>
   <!--Strip characters--><xsl:template match="text()" priority="-1"/>

   <!--SCHEMA SETUP-->
<xsl:template match="/">
      <xsl:processing-instruction xmlns:svrl="http://purl.oclc.org/dsdl/svrl" name="xml-stylesheet">type="text/xsl" href="rapportSchematronToHtml4.xsl"</xsl:processing-instruction>
      <xsl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl"/>
      <svrl:schematron-output xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                              title="Rapport de conformit?? du document aux sp??cifications du volet Fiches Patient ?? risque en cardiologie (F-PRC_1.4)"
                              schemaVersion="CI-SIS_F-PRC_1.4.sch">
         <xsl:attribute name="document">
            <xsl:value-of select="document-uri(/)"/>
         </xsl:attribute>
         <xsl:attribute name="dateHeure">
            <xsl:value-of select="format-dateTime(current-dateTime(), '[D]/[M]/[Y] ?? [H]:[m]:[s] (temps UTC[Z])')"/>
         </xsl:attribute>
         <xsl:text/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_AllergiesAndIntolerances_F-PRC</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M5"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_DefribrillateurOrg_F-PRC</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M6"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_DispositifMedicalImplanteOrg_F-PRC</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M7"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_EndoprotheseOrg_F-PRC</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M8"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_ProtheseValvulaireOrg_F-PRC</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M9"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_SondeDefOrg_F-PRC</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M10"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_SondeStimOrg_F-PRC</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M11"/>
         <svrl:active-pattern>
            <xsl:attribute name="id">E_StimulateurOrg_F-PRC</xsl:attribute>
            <xsl:apply-templates/>
         </svrl:active-pattern>
         <xsl:apply-templates select="/" mode="M12"/>
      </svrl:schematron-output>
   </xsl:template>

   <!--SCHEMATRON PATTERNS-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">Rapport de conformit?? du document aux sp??cifications du volet Fiches Patient ?? risque en cardiologie (F-PRC_1.4)</svrl:text>

   <!--PATTERN E_AllergiesAndIntolerances_F-PRCCI-SIS Allergies and Intolerances (F-PRC)-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS Allergies and Intolerances (F-PRC)</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.6&#34;]"
                 priority="1000"
                 mode="M5">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root = &#34;1.3.6.1.4.1.19376.1.5.3.1.4.6&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:participant/@typeCode = &#34;CSM&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_AllergiesAndIntolerances_F-PRC] Erreur de Conformit?? CI-SIS: L'allerg??ne
            responsable de la r??action observ??e doit ??tre pr??sent. Un ??l??ment participant d'attribut
            typeCode='CSM' sera utilis?? pour le d??crire</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="                 (cda:participant[@typeCode = &#34;CSM&#34;]/cda:participantRole/cda:playingEntity/cda:code[@codeSystem = &#34;1.2.250.1.213.2.3&#34;]) or                 (cda:participant[@typeCode = &#34;CSM&#34;]/cda:participantRole/cda:playingEntity/cda:code[@codeSystem = &#34;1.2.250.1.213.2.3.2&#34;])"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_AllergiesAndIntolerances_F-PRC] Erreur de Conformit?? CI-SIS: Le m??dicament responsable de la r??action observ??e doit
            ??tre cod?? ?? partir: soit de la nomenclature CIS (1.2.250.1.213.2.3) si l'on code son nom
            de fantaisie, soit de la nomenclature CIS_Composition (1.2.250.1.213.2.3.2) si l'on code
            un composant d'un m??dicament</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:code[@code = &#34;DNAINT&#34;]) or ((cda:value/@code = &#34;10022401&#34;) or (cda:value/@code = &#34;10022402&#34;))"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_AllergiesAndIntolerances_F-PRC] Erreur de Conformit?? CI-SIS: Les effets d'augmentation ou de diminution de l'INR
            doivent ??tre not??s dans ce contexte non-allergique d'intol??rance m??dicamenteuse</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M5"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M5"/>
   <xsl:template match="@*|node()" priority="-2" mode="M5">
      <xsl:apply-templates select="*" mode="M5"/>
   </xsl:template>

   <!--PATTERN E_DefribrillateurOrg_F-PRCCI-SIS - D??fibrillateur-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS - D??fibrillateur</svrl:text>

	  <!--RULE -->
<xsl:template match="             *[(/cda:ClinicalDocument/cda:templateId[@root = &#34;1.2.250.1.213.1.1.1.2.1.3&#34;])             and (cda:code/@code = &#34;D0001-1&#34;)]"
                 priority="1000"
                 mode="M6">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="             *[(/cda:ClinicalDocument/cda:templateId[@root = &#34;1.2.250.1.213.1.1.1.2.1.3&#34;])             and (cda:code/@code = &#34;D0001-1&#34;)]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@code = &#34;D0001-1&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le code de
            l'organizer 'D??fibrillateur' doit ??tre L0062 pris dans le vocabulaire TA_PRC
            (1.2.250.1.213.1.1.4.2)</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@codeSystem = &#34;1.2.250.1.213.1.1.4.2&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> Erreur de Conformit?? CI-SIS:
            [E_DefribrillateurOrg_F-PRC] L'??l??ment 'codeSystem' de l'organizer 'D??fibrillateur' doit ??tre cod?? dans dans le
            vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2).</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test=".//cda:templateId[@root = &#34;1.2.250.1.213.1.1.3.1&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? PCC: L'??l??ment 'D??fibrillateur' doit au moins contenir une entr??e 'Observation
            Dispositifs M??dicaux'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0055&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: La date d'implantation du mat??riel est un ??l??ment
            obligatoire de l'organizer.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0056&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le Type de mat??riel implant?? est un ??l??ment obligatoire
            de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0054&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: La Localisation de l'implant est un ??l??ment obligatoire
            de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0050&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: La marque de l'implant est l'un des ??l??ments obligatoires
            constitutifs de l'organizer 'D??fibrillateur'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0051&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le mod??le de l'implant est un ??l??ment obligatoire de
            l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0059&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le num??ro de s??rie de l'implant est un ??l??ment
            obligatoire de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0001&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: La tension de la pile ?? ERI est l'un des ??l??ments
            obligatoires constitutifs de l'organizer 'D??fibrillateur'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0003&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: L'IRE est un ??l??ment obligatoire de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0004&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le type du d??fibrillateur est un ??l??ment obligatoire de
            l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0006&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le type d'asservissement est l'un des ??l??ments
            obligatoires constitutifs de l'organizer 'D??fibrillateur'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0007&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le t??l??suivi est un ??l??ment obligatoire de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0008&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: L'activation du t??l??suivi est un ??l??ment obligatoire de
            l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0009&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le stade NYHA est un ??l??ment obligatoire de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0010&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: La FEVG est l'un des ??l??ments obligatoires constitutifs
            de l'organizer 'D??fibrillateur'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0012&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: la date des derni??res mesures est un ??l??ment obligatoire
            de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0013&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: le mode programm?? est un ??l??ment obligatoire de
            l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0014&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Tension est un ??l??ment obligatoire de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0015&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Imp??dance est un ??l??ment obligatoire de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0016&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DefribrillateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Temps de charge est un ??l??ment obligatoire de
            l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M6"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M6"/>
   <xsl:template match="@*|node()" priority="-2" mode="M6">
      <xsl:apply-templates select="*" mode="M6"/>
   </xsl:template>

   <!--PATTERN E_DispositifMedicalImplanteOrg_F-PRCCI-SIS - Dispositif M??dical Implant??-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS - Dispositif M??dical Implant??</svrl:text>

	  <!--RULE -->
<xsl:template match="*[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.2&#34;]" priority="1000"
                 mode="M7">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.2&#34;]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test=".//cda:templateId[@root = &#34;1.2.250.1.213.1.1.3.1&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DispositifM??dicalImplanteOrg_F-PRC] Erreur de Conformit?? PCC: L'organizer doit au moins contenir une entr??e 'Observation Dispositifs
            M??dicaux'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="                 (cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0055&#34;)                 and (cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:value/@value)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DispositifM??dicalImplanteOrg_F-PRC] Erreur de Conformit?? CI-SIS: La date d'implantation est un ??l??ment obligtoire de
            l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="                 cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]                 /cda:code/@code = &#34;L0056&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_DispositifM??dicalImplanteOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Dispositif implant??' est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M7"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M7"/>
   <xsl:template match="@*|node()" priority="-2" mode="M7">
      <xsl:apply-templates select="*" mode="M7"/>
   </xsl:template>

   <!--PATTERN E_EndoprotheseOrg_F-PRCCI-SIS - Endoproth??se -->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS - Endoproth??se </svrl:text>

	  <!--RULE -->
<xsl:template match="             *[(/cda:ClinicalDocument/cda:templateId[@root = &#34;1.2.250.1.213.1.1.1.2.1.2&#34;])             and (cda:code/@code = &#34;D0001-12&#34;)]"
                 priority="1000"
                 mode="M8">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="             *[(/cda:ClinicalDocument/cda:templateId[@root = &#34;1.2.250.1.213.1.1.1.2.1.2&#34;])             and (cda:code/@code = &#34;D0001-12&#34;)]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@code = &#34;D0001-12&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_EndoprotheseOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le code de l'organizer 'Endoproth??se' doit ??tre D0001-11 pris dans le vocabulaire TA_PRC
            (1.2.250.1.213.1.1.4.2)</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@codeSystem = &#34;1.2.250.1.213.1.1.4.2&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_EndoprotheseOrg_F-PRC] Erreur de Conformit?? CI-SIS: L'??l??ment 'codeSystem' de l'organizer 'Endoproth??se' doit ??tre cod?? dans dans le
            vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2).</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test=".//cda:templateId[@root = &#34;1.2.250.1.213.1.1.3.1&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_EndoprotheseOrg_F-PRC] Erreur de Conformit?? CI-SIS : L'organizer 'Endoproth??se' doit au moins contenir une entr??e 'Observation
            Dispositifs M??dicaux'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0055&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_EndoprotheseOrg_F-PRC] Erreur de Conformit?? CI-SIS: La date d'implantation du mat??riel est un ??l??ment
            obligatoire de l'organizer.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0056&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_EndoprotheseOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le 'Type de mat??riel implant??' est un ??l??ment obligatoire
            de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0039&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_EndoprotheseOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le 'Nom de l'mplant' de l'implant est un ??l??ment
            obligatoire de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0054&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_EndoprotheseOrg_F-PRC] Erreur de Conformit?? CI-SIS: La Localisation de l'implant est un ??l??ment obligatoire
            de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root = &#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code = &#34;L0051&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text>
            [E_EndoprotheseOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le mod??le de l'implant est l'un des ??l??ments obligatoires
            constitutifs de l'organizer'.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M8"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M8"/>
   <xsl:template match="@*|node()" priority="-2" mode="M8">
      <xsl:apply-templates select="*" mode="M8"/>
   </xsl:template>

   <!--PATTERN E_ProtheseValvulaireOrg_F-PRCCI-SIS - Proth??se Valvulaire-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS - Proth??se Valvulaire</svrl:text>

	  <!--RULE -->
<xsl:template match="*[(/cda:ClinicalDocument/cda:templateId[@root=&#34;1.2.250.1.213.1.1.1.2.1.5&#34;])          and (cda:code/@code=&#34;D0001-11&#34;)]"
                 priority="1000"
                 mode="M9">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[(/cda:ClinicalDocument/cda:templateId[@root=&#34;1.2.250.1.213.1.1.1.2.1.5&#34;])          and (cda:code/@code=&#34;D0001-11&#34;)]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@code =&#34;D0001-11&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le code de l'organizer 'Proth??se Valvulaire' doit ??tre L0062
            pris dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2)</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@codeSystem = &#34;1.2.250.1.213.1.1.4.2&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: L'??l??ment 'codeSystem' de l'organizer 'Proth??se Valvulaire'
            doit ??tre cod?? dans dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2).</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test=".//cda:templateId[@root = &#34;1.2.250.1.213.1.1.3.1&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS : L'organizer 'Proth??se Valvulaire' doit au moins contenir une entr??e 'Observation Dispositifs M??dicaux'</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0055&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: La date d'implantation du mat??riel est un ??l??ment obligatoire de l'organizer.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0056&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le 'Type de mat??riel implant??' est un ??l??ment obligatoire de l'organizer. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0051&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le 'mod??le' de l'implant est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0031&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le 'num??ro de s??rie' de l'implant est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0031&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le 'valve' que la proth??se remplace est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0032&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le 'composant' de la proth??se est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0033&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le 'diam??tre' de la proth??se est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0034&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le 'gradient' mesur?? est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0035&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_ProtheseValvulaireOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le 'niveau d'anticoagulation souhait??' est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M9"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M9"/>
   <xsl:template match="@*|node()" priority="-2" mode="M9">
      <xsl:apply-templates select="*" mode="M9"/>
   </xsl:template>

   <!--PATTERN E_SondeDefOrg_F-PRCCI-SIS - D??fibrillateur/Stimulateurs-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS - D??fibrillateur/Stimulateurs</svrl:text>

	  <!--RULE -->
<xsl:template match="*[(/cda:ClinicalDocument/cda:templateId[@root=&#34;1.2.250.1.213.1.1.1.2.1.3&#34;])          and ((cda:code/@code=&#34;D0001-3&#34;) or (cda:code/@code=&#34;D0001-4&#34;) or (cda:code/@code=&#34;D0001-5&#34;))]"
                 priority="1000"
                 mode="M10">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[(/cda:ClinicalDocument/cda:templateId[@root=&#34;1.2.250.1.213.1.1.1.2.1.3&#34;])          and ((cda:code/@code=&#34;D0001-3&#34;) or (cda:code/@code=&#34;D0001-4&#34;) or (cda:code/@code=&#34;D0001-5&#34;))]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@code =&#34;D0001-3&#34; or             @code =&#34;D0001-4&#34; or              @code =&#34;D0001-5&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le code de l'organizer 'Sonde' doit ??tre L0062
            pris dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@codeSystem = &#34;1.2.250.1.213.1.1.4.2&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: L'??l??ment 'codeSystem' de l'organizer 'D??fibrillateur'
            doit ??tre cod?? dans dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2). 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="(cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0055&#34;)              and (cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:value/@value)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: La date d'implantation est un ??l??ment obligtoire. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0056&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Dispositif implant??' est un ??l??ment obligtoire. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0054&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Localisation de l'implant'est un ??l??ment obligtoire. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0050&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Marque de l'implant'est un ??l??ment obligtoire. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0051&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Mod??le de l'implant' est un ??l??ment obligtoire. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0059&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Num??ro de s??rie' est un ??l??ment obligtoire. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0053&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Polarit??' est un ??l??ment obligtoire. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0017&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Connexions' est un ??l??ment obligtoire. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0018&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC]  Erreur de Conformit?? CI-SIS: 'Adapteur'est un ??l??ment obligtoire. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0019&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Voie d'abord' est un ??l??ment obligtoire. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0021&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Voie d'abord' est l'un des ??l??ments obligatoires constitutifs de l'organizer 'Sonde'. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0022&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'D??tection' est un ??l??ment obligatoire mesur?? ?? l'impl??mentation des sondes.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0015&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC]  Erreur de Conformit?? CI-SIS: 'Imp??dance' est un ??l??ment obligatoire mesur?? ?? l'impl??mentation des sondes. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0023&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Seuil ?? ms' est un ??l??ment obligatoire mesur?? ?? l'impl??mentation des sondes.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:code/@code=&#34;D0001-4&#34;)              or (cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0024&#34;)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRCF] Erreur de Conformit?? CI-SIS: 'D??fibrillation efficace' est un ??l??ment obligatoire mesur?? ?? l'impl??mentation de la sonde ventriculaire droite. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:code/@code=&#34;D0001-4&#34;)              or (cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0025&#34;)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC]  Erreur de Conformit?? CI-SIS: 'Imp??dance de choc' est un ??l??ment obligatoire mesur?? ?? l'impl??mentation de la sonde ventriculaire droite.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0016&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Temps de Charge' est un ??l??ment obligatoire mesur?? ?? l'impl??mentation des sondes
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0026&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Seuil de Stimulation' est un ??l??ment obligatoire mesur?? ?? l'impl??mentation des sondes</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:code/@code=&#34;D0001-4&#34;)              or (cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0027&#34;)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC]  Erreur de Conformit?? CI-SIS: 'Recueil' est un ??l??ment obligatoire  mesur?? ?? l'impl??mentation des sondes
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0015&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Imp??dance' est un ??l??ment obligatoire mesur?? ?? l'impl??mentation des sondes
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="not(cda:code/@code=&#34;D0001-4&#34;)              or (cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0025&#34;)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeDefOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Imp??dance de choc' est l'une des mesures  obligatoires constitutives de l'organizer 'Derni??res Mesures du ventricule droit'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M10"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M10"/>
   <xsl:template match="@*|node()" priority="-2" mode="M10">
      <xsl:apply-templates select="*" mode="M10"/>
   </xsl:template>

   <!--PATTERN E_SondeStimOrg_F-PRCCI-SIS - Stimulateurs-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS - Stimulateurs</svrl:text>

	  <!--RULE -->
<xsl:template match="*[(/cda:ClinicalDocument/cda:templateId[@root=&#34;1.2.250.1.213.1.1.1.2.1.4&#34;])          and ((cda:code/@code=&#34;D0001-3&#34;) or (cda:code/@code=&#34;D0001-4&#34;) or (cda:code/@code=&#34;D0001-5&#34;))]"
                 priority="1000"
                 mode="M11">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[(/cda:ClinicalDocument/cda:templateId[@root=&#34;1.2.250.1.213.1.1.1.2.1.4&#34;])          and ((cda:code/@code=&#34;D0001-3&#34;) or (cda:code/@code=&#34;D0001-4&#34;) or (cda:code/@code=&#34;D0001-5&#34;))]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@code =&#34;D0001-3&#34; or             @code =&#34;D0001-4&#34; or              @code =&#34;D0001-5&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le code de l'organizer 'Sonde' doit ??tre L0062
            pris dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2)
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:code[@codeSystem = &#34;1.2.250.1.213.1.1.4.2&#34;]"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: L'??l??ment 'codeSystem' de l'organizer 'D??fibrillateur'
            doit ??tre cod?? dans dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2). 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="(cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0055&#34;) and              (cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:value/@value)"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: La date d'implantation est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0056&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC]  Erreur de Conformit?? CI-SIS: 'Dispositif implant??' est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0054&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC]  Erreur de Conformit?? CI-SIS: 'Localisation de l'implant'est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0050&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Marque de l'implant'est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0051&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC]  Erreur de Conformit?? CI-SIS: 'Mod??le de l'implant' est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0059&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Num??ro de s??rie' est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0053&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Polarit??' est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0017&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Connexions' est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0018&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC]  Erreur de Conformit?? CI-SIS: 'Adapteur'est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0019&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Voie d'abord' est un ??l??ment obligtoire. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0021&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Courant' est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer 'Sonde'.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0022&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC]  Erreur de Conformit?? CI-SIS: 'D??tection' est un ??l??ment obligatoire 
            mesur?? ?? l'impl??mentation des sondes.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0015&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Imp??dance' est un ??l??ment obligatoire 
            mesur?? ?? l'impl??mentation des sondes.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0023&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Seuil ?? ms' est un ??l??ment obligatoire 
            mesur?? ?? l'impl??mentation des sondes.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0026&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC] Erreur de Conformit?? CI-SIS: 'Seuil de Stimulation' est un ??l??ment obligatoire 
            mesur?? ?? l'impl??mentation des sondes</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]             /cda:code/@code=&#34;L0015&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_SondeStimOrg_F-PRC]  Erreur de Conformit?? CI-SIS: 'Imp??dance' est un ??l??ment obligatoire 
            mesur?? ?? l'impl??mentation des sondes</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M11"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M11"/>
   <xsl:template match="@*|node()" priority="-2" mode="M11">
      <xsl:apply-templates select="*" mode="M11"/>
   </xsl:template>

   <!--PATTERN E_StimulateurOrg_F-PRCCI-SIS - Stimulateur-->
<svrl:text xmlns:svrl="http://purl.oclc.org/dsdl/svrl">CI-SIS - Stimulateur</svrl:text>

	  <!--RULE -->
<xsl:template match="*[(/cda:ClinicalDocument/cda:templateId[@root=&#34;1.2.250.1.213.1.1.1.2.1.4&#34;]) and (cda:code/@code=&#34;D0001-2&#34;) ]"
                 priority="1000"
                 mode="M12">
      <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                       context="*[(/cda:ClinicalDocument/cda:templateId[@root=&#34;1.2.250.1.213.1.1.1.2.1.4&#34;]) and (cda:code/@code=&#34;D0001-2&#34;) ]"/>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0055&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: La date d'implantation du mat??riel est un ??l??ment obligatoire de l'organizer.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0056&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le Type de mat??riel implant?? est un ??l??ment obligatoire de l'organizer. 
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0050&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: La marque de l'implant est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0051&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le mod??le de l'implant est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer'.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0059&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le num??ro de s??rie de l'implant est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer'.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0060&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: La Fr??quence s/s aimant de l'implant est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer'.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0065&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC]  Erreur de Conformit?? CI-SIS: La Tension batterie de l'implant est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer'.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0036&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le type de Pacemaker est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer'.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0006&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: L'asservissement est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0007&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: La pr??sence pou l'absence de t??l??suivi est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0008&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: L'activation du t??l??suivi est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer'.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0009&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Le stade NYHA est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0010&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: La FEVG est l'un 
            des ??l??ments obligatoires constitutifs de l'organizer.</svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0012&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: la date des derni??res mesures est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0013&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC]  Erreur de Conformit?? CI-SIS: le mode programm?? est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0037&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: la fr??quence sans aimant est un 
            ??l??ment obligatoire de l'organizer 'Derni??res Mesures'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0066&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: la fr??quence sans aimant est un 
            ??l??ment obligatoire de l'organizer 'Derni??res Mesures'. </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0014&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Tension est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>

		    <!--ASSERT -->
<xsl:choose>
         <xsl:when test="cda:component/cda:observation[cda:templateId/@root=&#34;1.2.250.1.213.1.1.3.1&#34;]/cda:code/@code=&#34;L0015&#34;"/>
         <xsl:otherwise>
            <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
               <xsl:attribute name="location">
                  <xsl:apply-templates select="." mode="schematron-select-full-path"/>
               </xsl:attribute>
               <svrl:text> 
            [E_StimulateurOrg_F-PRC] Erreur de Conformit?? CI-SIS: Imp??dance est un ??l??ment obligatoire de l'organizer.
        </svrl:text>
            </svrl:failed-assert>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="*" mode="M12"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M12"/>
   <xsl:template match="@*|node()" priority="-2" mode="M12">
      <xsl:apply-templates select="*" mode="M12"/>
   </xsl:template>
</xsl:stylesheet>