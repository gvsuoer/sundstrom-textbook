<?xml version="1.0" encoding="UTF-8"?>


<!-- Parts of this file were adapted from the author guide at https://github.com/rbeezer/mathbook and the analagous file at https://github.com/twjudson/aata -->
<!-- Conveniences for classes of similar elements -->
<!DOCTYPE xsl:stylesheet [
    <!ENTITY % entities SYSTEM "entities.ent">
    %entities;
]>

<!-- DMOI customizations for LaTeX runs -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- assumes this has been copied to mathbook/user -->
<xsl:import pretext-href="pretext-latex.xsl" />
<!-- <xsl:import pretext-href="C:\Users\oer\Documents\pretext-conversions\mathbook\pretext-latex.xsl" /> -->

<xsl:import href="pretext-latex-sundstrom-style.xsl" />
<!-- Assumes next file can be found in mathbook/user -->
<xsl:import href="custom-common.xsl" />
<!-- <xsl:import href="C:\Users\oer\Documents\pretext-conversions\mathbook\pretext-common.xsl" /> -->


<xsl:param name="debug.exercises.forward" select="'yes'"/>


<!-- Parameters to pass via xsltproc "stringparam" on command-line            -->
<!-- Or make a thin customization layer and use 'select' to provide overrides -->
<!--  -->
<!-- LaTeX executable, "engine"                       -->
<!-- pdflatex is default, xelatex or lualatex for Unicode support -->
<!-- N.B. This has no effect, and may never.  xelatex and lualatex support is automatic -->
<!-- <xsl:param name="latex.engine" select="'pdflatex'" /> -->
<!--  -->
<!-- Standard fontsizes: 10pt, 11pt, or 12pt       -->
<!-- extsizes package: 8pt, 9pt, 14pt, 17pt, 20pt  -->
<!-- memoir class offers more, but maybe other changes? -->
<!-- <xsl:param name="latex.font.size" select="'11pt'" /> -->
<!--  -->
<!-- Geometry: page shape, margins, etc            -->
<!-- Pass a string with any of geometry's options  -->
<!-- Default is empty and thus ineffective         -->
<!-- Otherwise, happens early in preamble template -->
<!-- <xsl:param name="latex.geometry" select="'papersize={7in,10in}, width=4.85in, inner=1in, height=8.5in, top=0.75in, twoside, ignoreheadfoot'"/> -->
<!-- papersize={7in,10in},  width=5in, inner=.75in, height=8.25in, top=0.75in, twoside, ignoreheadfoot, hmargin={0.85in, 0.5in}, -->
<!--  -->

<!--  -->
<!-- Author's Tools                                            -->
<!-- Set the author-tools parameter to 'yes'                   -->
<!-- (Documented in mathbook-common.xsl)                       -->
<!-- Installs some LaTeX-specific behavior                     -->
<!-- (1) Index entries in margin of the page                   -->
<!--      where defined, on single pass (no real index)        -->
<!-- (2) LaTeX labels near definition and use                  -->
<!--     N.B. Some are author-defined; others are internal,    -->
<!--     and CANNOT be used as xml:id's (will raise a warning) -->
<!--  -->
<!-- Draft Copies                                              -->
<!-- Various options for working copies for authors            -->
<!-- (1) LaTeX's draft mode                                    -->
<!-- (2) Crop marks on letter paper, centered                  -->
<!--     presuming geometry sets smaller page size             -->
<!--     with paperheight, paperwidth                          -->
<!-- <xsl:param name="latex.draft" select="'no'"/> -->
<!--  -->
<!-- Print Option                                         -->
<!-- For a non-electronic copy, inactive links in black   -->
<!-- Any color options go to black and white, as possible -->
<!-- <xsl:param name="latex.print" select="'no'"/> -->
<!-- Sidedness -->
<!-- <xsl:param name="latex.sides" select="'two'"/> -->
<!--  -->
<!-- Preamble insertions                    -->
<!-- Insert packages, options into preamble -->
<!-- early or late                          -->
<!-- <xsl:param name="latex.preamble.early" select="''" /> -->
<!-- <xsl:param name="latex.preamble.late" select="''" /> -->
<!--  -->
<!-- Console characters allow customization of how    -->
<!-- LaTeX macros are recognized in the fancyvrb      -->
<!-- package's Verbatim clone environment, "console"  -->
<!-- The defaults are traditional LaTeX, we let any   -->
<!-- other specification make a document-wide default -->
<!-- <xsl:param name="latex.console.macro-char" select="'\'" />
<xsl:param name="latex.console.begin-char" select="'{'" />
<xsl:param name="latex.console.end-char" select="'}'" /> -->







<!-- Include a style file at the end of the preamble: -->

<xsl:param name="latex.preamble.late">
  <xsl:text>%This should load all the style information that ptx does not.&#xa;</xsl:text>
    <xsl:text>% Change list titles to bold&#xa;</xsl:text>
    <xsl:text>\renewcommand{\lititle}[1]{{\textbf{#1}}}&#xa;</xsl:text>
    <xsl:text>\usepackage{setspace}&#xa;</xsl:text>
    <xsl:text>\usepackage{newtxtext, newtxmath}&#xa;</xsl:text>
    <xsl:text>% Macro for horizontal line&#xa;</xsl:text>
    <xsl:text>\newcommand{\hbreak}{\vskip6pt \hrule \vskip6pt}&#xa;</xsl:text>
    <xsl:text>% Add line break or hbreak before and after some elements&#xa;</xsl:text>
    <xsl:text>\AtBeginEnvironment{assemblage}{\vskip\baselineskip}&#xa;</xsl:text>
    <xsl:text>\AfterEndEnvironment{assemblage}{\vskip\baselineskip}</xsl:text>
    <xsl:text>\AtBeginEnvironment{example}{\vskip\baselineskip}</xsl:text>
    <xsl:text>\AfterEndEnvironment{example}{\vskip\baselineskip}</xsl:text>
    <xsl:text>\AtBeginEnvironment{inlineexercise}{\vskip\baselineskip}</xsl:text>
    <xsl:text>\AfterEndEnvironment{inlineexercise}{\hbreak}</xsl:text>
    <xsl:text>\AfterEndEnvironment{divisionexercise}{\vskip\baselineskip}</xsl:text>
    <xsl:text>\AfterEndEnvironment{worksheet-subsection}{\hbreak}</xsl:text>
    <xsl:text>\setlength{\parskip}{0.27\baselineskip}</xsl:text>
    <!-- <xsl:text>\setstretch{1.1}</xsl:text> -->
</xsl:param>


<!-- <xsl:param name="latex.preabmle.early">

</xsl:param> -->



<!-- Override default frontmatter pages: -->

<!-- Remove "half-title" leading page with -->
<!-- title only, at about 1:2 split    -->
<!-- <xsl:template match="book" mode="half-title" >
    <xsl:text>%% no half-title&#xa;</xsl:text>
</xsl:template> -->

<!-- Remove Ad card (may contain list of other books        -->
<!-- Or may be overridden to make title page spread -->
<!-- Obverse of half-title                          -->
<!-- <xsl:template match="book" mode="ad-card">
    <xsl:text>%% No adcard&#xa;</xsl:text>
</xsl:template> -->


<!-- Import custom title page -->
<!-- <xsl:template match="book" mode="title-page">
    <xsl:text>%% begin: title page&#xa;</xsl:text>
    <xsl:text>%% my custom page.&#xa;</xsl:text>
    <xsl:text>\input{frontmatter/title-page}&#xa;</xsl:text>
    <xsl:text>%% end: title page&#xa;</xsl:text>
</xsl:template> -->

<!-- Import custom copyright page -->
<!-- <xsl:template match="book" mode="copyright-page" >
    <xsl:text>%% begin: copyright-page&#xa;</xsl:text>
    <xsl:text>\input{frontmatter/copyright-page}&#xa;</xsl:text>
    <xsl:text>%% end:   copyright-page&#xa;</xsl:text>
</xsl:template> -->

<!-- Dedication style -->
<!-- <xsl:template match="dedication/p|dedication/p[1]" priority="1">
    <xsl:text>\begin{flushright}\large%&#xa;</xsl:text>
        <xsl:apply-templates />
    <xsl:text>%&#xa;</xsl:text>
    <xsl:text>\end{flushright}&#xa;</xsl:text>
</xsl:template> -->




<!-- Restyle paragraphs: -->
<!-- "paragraphs" -->
<!-- Body:  \begin{paragraphs}{title}{label}   -->
<!-- "titlesec" package, Subsection 9.2 has LaTeX defaults -->
<!-- We drop the indentation, and we pass the title itself -->
<!-- explicity with macro parameter #1 since we do not save-->
<!-- off the title in a PTX macro.  None of this is meant  -->
<!-- to support customization in a style.                  -->
<!-- Once a tcolorbox, see warnings as part of divisional  -->
<!-- introductions and conclusions.                        -->
<!-- <xsl:template match="paragraphs" mode="environment">
    <xsl:text>%% paragraphs: the terminal, pseudo-division&#xa;</xsl:text>
    <xsl:text>%% We use the lowest LaTeX traditional division&#xa;</xsl:text>
    <xsl:text>\titleformat{\subparagraph}[block]{\normalfont\filcenter\scshape\bfseries}{\thesubparagraph}{0em}{#1}&#xa;</xsl:text>
    <xsl:text>\titlespacing*{\subparagraph}{0pt}{3.25ex plus 1ex minus .2ex}{1ex}&#xa;</xsl:text>
    <xsl:text>\NewDocumentEnvironment{paragraphs}{mm}&#xa;</xsl:text>
    <xsl:text>{\subparagraph*{#1}\hypertarget{#2}{}}{}&#xa;</xsl:text>
</xsl:template> -->
<!-- Paragraphs -->
<!-- Non-structural, even if they appear to be -->
<!-- <xsl:template match="paragraphs"> -->
    <!-- Warn about paragraph deprecation -->
    <!-- <xsl:text>\begin{paragraphs}</xsl:text>
    <xsl:text>{</xsl:text> -->
    <!-- Get rid of punctuation: (change title-punctuated to title-full) -->
    <!-- <xsl:apply-templates select="." mode="title-full" />
    <xsl:text>}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:apply-templates select="." mode="latex-id" />
    <xsl:text>}</xsl:text>
    <xsl:text>%&#xa;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>\end{paragraphs}%&#xa;</xsl:text>
</xsl:template> -->


<!-- "proof" -->
<!-- Body:  \begin{proof}{title}{label}    -->
<!-- Title comes with punctuation, always. -->
<!-- <xsl:template match="proof" mode="environment">
    <xsl:text>%% proof: title is a replacement&#xa;</xsl:text>
    <xsl:text>\tcbset{ proofstyle/.style={</xsl:text>
    <xsl:apply-templates select="." mode="tcb-style" />
    <xsl:text>} }&#xa;</xsl:text>
    <xsl:text>\newtcolorbox{proofptx}[2]{title={\notblank{#1}{#1}{</xsl:text>
    <xsl:apply-templates select="." mode="type-name"/>
    <xsl:text>.}}, phantom={\hypertarget{#2}{}}, breakable, parbox=false, proofstyle }&#xa;</xsl:text>
</xsl:template> -->

<!-- Actually, redefine proofs to use the amsthm env for now -->
<!-- Proofs -->
<!-- Subsidary to THEOREM-LIKE, or standalone        -->
<!-- Defaults to "Proof", can be replaced by "title" -->
<!-- TODO: rename as "proof" once  amsthm  package goes away -->
<!-- <xsl:template match="proof">
    <xsl:text>\begin{proof}</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:if test="title">
        <xsl:apply-templates select="." mode="title-full"/>
    </xsl:if>
    <xsl:text>}</xsl:text>
    <xsl:text>&#xa;</xsl:text>
    <xsl:apply-templates select="*" />
    <xsl:text>\end{proof}&#xa;</xsl:text>
</xsl:template> -->

<!--HACK: 3-23-19 redefine the qed symbol to be qed  -->
<!-- "proof" -->
<!-- Title in italics, as in amsthm style.           -->
<!-- Filled, black square as QED, tombstone, Halmos. -->
<!-- Pushing the tombstone flush-right is a bit      -->
<!-- ham-handed, but more elegant TeX-isms           -->
<!-- (eg \hfill) did not get it done.  We require at -->
<!-- least two spaces gap to remain on the same      -->
<!-- line. Presumably the line will stretch when the -->
<!-- tombstone moves onto its own line.              -->
<!-- <xsl:template match="proof" mode="tcb-style">
    <xsl:text>bwminimalstyle, fonttitle=\normalfont\itshape, attach title to upper, after title={\space}, after upper={\space\space\hspace*{\stretch{1}}\(\textsc{qed}\)}&#xa;</xsl:text>
</xsl:template> -->




</xsl:stylesheet>
