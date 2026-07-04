dnl # ------------------------------------------------------------------
dnl # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
dnl # embellishments.m4
dnl # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
dnl # ------------------------------------------------------------------
dnl # Project:  https://github.com/ad2108/m4-embellished-comments
dnl # Author:   ad2108
dnl # Date:     21.06.2026
dnl # Version:  1.0.2
dnl # License:  MIT
dnl # ------------------------------------------------------------------
dnl
dnl # ------------------------------------------------------------------
dnl # Comments
dnl # ------------------------------------------------------------------
dnl
define(`COMMENT',`COMMENT_SIGN_START $1 COMMENT_SIGN_END')dnl
dnl
dnl # ------------------------------------------------------------------
dnl # Simple Separators
dnl # ------------------------------------------------------------------
dnl
define(`SEP',`ifelse(0,$2,$1,$1`SEP($1,decr($2))')')dnl
define(`SEPARATOR',`COMMENT(SEP($1,$2))')dnl
dnl
define(`SEPARATOR_A',`SEPARATOR(-,70)')dnl
define(`SEPARATOR_B',`SEPARATOR(>,70)')dnl
define(`SEPARATOR_C',`SEPARATOR(><,35)')dnl
define(`SEPARATOR_D',`SEPARATOR(*,70)')dnl
dnl
dnl # ------------------------------------------------------------------
dnl # Big Section with 2 different Separatortypes
dnl # ------------------------------------------------------------------
dnl
define(`SECTION',`SEPARATOR(SEPARATOR_1,SEPARATOR_SIZE_1)
SEPARATOR(SEPARATOR_2,SEPARATOR_SIZE_2)
COMMENT($1)
SEPARATOR(SEPARATOR_2,SEPARATOR_SIZE_2)
SEPARATOR(SEPARATOR_1,SEPARATOR_SIZE_1)')dnl
dnl
dnl # ------------------------------------------------------------------
dnl # Subsection with one Separatortype
dnl # ------------------------------------------------------------------
dnl
define(`SUBSECTION',`SEPARATOR(SEPARATOR_1,SEPARATOR_SIZE_1)
COMMENT($1)
SEPARATOR(SEPARATOR_1,SEPARATOR_SIZE_1)')dnl
dnl
dnl # ------------------------------------------------------------------
dnl # Mainsection with two Separatortypes
dnl # ------------------------------------------------------------------
dnl
define(`MAINSECTION',`SEPARATOR(SEPARATOR_1,SEPARATOR_SIZE_1)
SEPARATOR(SEPARATOR_2,SEPARATOR_SIZE_2)
SEPARATOR(SEPARATOR_1,SEPARATOR_SIZE_1)
COMMENT($1)
SEPARATOR(SEPARATOR_1,SEPARATOR_SIZE_1)')dnl
dnl
dnl # ------------------------------------------------------------------
dnl # Simple Header with Project Information and 2 Separatortypes from setup.m4
dnl # ------------------------------------------------------------------
dnl
define(`HEADER',`SECTION($1)
COMMENT(Project:  PROJECT_NAME)
COMMENT(Author:   AUTHOR_NAME)
COMMENT(Date:     DATE)
COMMENT(Version:  VERSION)
COMMENT(License:  LICENSE)
SEPARATOR(SEPARATOR_1,SEPARATOR_SIZE_1)')dnl
dnl
dnl # ------------------------------------------------------------------
dnl # End of File
dnl # ------------------------------------------------------------------
dnl
define(`EOF',`SECTION(End of file)')dnl
dnl
dnl # ------------------------------------------------------------------
dnl # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
dnl # End of File
dnl # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
dnl # ------------------------------------------------------------------
dnl
