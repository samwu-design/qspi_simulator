/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/88-ISE_share/spi-simulator/design_rtl/sdram_controllor/sdram_ip/sdram_cmd.v";
static unsigned int ng1[] = {15U, 0U};
static unsigned int ng2[] = {3U, 0U};
static unsigned int ng3[] = {4095U, 0U};
static unsigned int ng4[] = {0U, 0U};
static unsigned int ng5[] = {23U, 0U};
static unsigned int ng6[] = {2U, 0U};
static unsigned int ng7[] = {4U, 0U};
static unsigned int ng8[] = {6U, 0U};
static unsigned int ng9[] = {8U, 0U};
static unsigned int ng10[] = {1U, 0U};
static unsigned int ng11[] = {18U, 0U};
static unsigned int ng12[] = {17U, 0U};
static unsigned int ng13[] = {5U, 0U};
static unsigned int ng14[] = {7U, 0U};
static unsigned int ng15[] = {16U, 0U};
static unsigned int ng16[] = {63U, 0U};
static unsigned int ng17[] = {9U, 0U};
static unsigned int ng18[] = {11U, 0U};
static unsigned int ng19[] = {19U, 0U};
static unsigned int ng20[] = {21U, 0U};
static int ng21[] = {4, 0};
static unsigned int ng22[] = {22U, 0U};
static unsigned int ng23[] = {20U, 0U};
static int ng24[] = {1, 0};
static unsigned int ng25[] = {10U, 0U};



static void Cont_47_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;

LAB0:    t1 = (t0 + 5400U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 4168);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7112);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 7048);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memset(t22, 0, 8);
    t23 = 2U;
    t24 = t23;
    t25 = (t4 + 4);
    t26 = *((unsigned int *)t4);
    t23 = (t23 & t26);
    t27 = *((unsigned int *)t25);
    t24 = (t24 & t27);
    t23 = (t23 >> 1);
    t24 = (t24 >> 1);
    t28 = (t22 + 4);
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t29 | t23);
    t30 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t30 | t24);
    xsi_driver_vfirst_trans(t18, 0, 0);
    t31 = (t0 + 6984);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    memset(t35, 0, 8);
    t36 = 4U;
    t37 = t36;
    t38 = (t4 + 4);
    t39 = *((unsigned int *)t4);
    t36 = (t36 & t39);
    t40 = *((unsigned int *)t38);
    t37 = (t37 & t40);
    t36 = (t36 >> 2);
    t37 = (t37 >> 2);
    t41 = (t35 + 4);
    t42 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t42 | t36);
    t43 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t43 | t37);
    xsi_driver_vfirst_trans(t31, 0, 0);
    t44 = (t0 + 6920);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memset(t48, 0, 8);
    t49 = 8U;
    t50 = t49;
    t51 = (t4 + 4);
    t52 = *((unsigned int *)t4);
    t49 = (t49 & t52);
    t53 = *((unsigned int *)t51);
    t50 = (t50 & t53);
    t49 = (t49 >> 3);
    t50 = (t50 >> 3);
    t54 = (t48 + 4);
    t55 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t55 | t49);
    t56 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t56 | t50);
    xsi_driver_vfirst_trans(t44, 0, 0);
    t57 = (t0 + 6856);
    t58 = (t57 + 56U);
    t59 = *((char **)t58);
    t60 = (t59 + 56U);
    t61 = *((char **)t60);
    memset(t61, 0, 8);
    t62 = 16U;
    t63 = t62;
    t64 = (t4 + 4);
    t65 = *((unsigned int *)t4);
    t62 = (t62 & t65);
    t66 = *((unsigned int *)t64);
    t63 = (t63 & t66);
    t62 = (t62 >> 4);
    t63 = (t63 >> 4);
    t67 = (t61 + 4);
    t68 = *((unsigned int *)t61);
    *((unsigned int *)t61) = (t68 | t62);
    t69 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t69 | t63);
    xsi_driver_vfirst_trans(t57, 0, 0);
    t70 = (t0 + 6712);
    *((int *)t70) = 1;

LAB1:    return;
}

static void Cont_48_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 5648U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 4328);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7176);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 3U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 1);
    t18 = (t0 + 6728);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_49_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 5896U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 4488);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 7240);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 4095U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 11);
    t18 = (t0 + 6744);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_54_3(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 6144U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 3448U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t18 = *((unsigned int *)t4);
    t19 = (~(t18));
    t20 = *((unsigned int *)t12);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t22, 8);

LAB16:    t16 = (t0 + 7304);
    t23 = (t16 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 4194303U;
    t28 = t27;
    t29 = (t3 + 4);
    t30 = *((unsigned int *)t3);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t16, 0, 21);
    t35 = (t0 + 6760);
    *((int *)t35) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 2648U);
    t17 = *((char **)t16);
    goto LAB9;

LAB10:    t16 = (t0 + 2488U);
    t22 = *((char **)t16);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 22, t17, 22, t22, 22);
    goto LAB16;

LAB14:    memcpy(t3, t17, 8);
    goto LAB16;

}

static void Always_56_4(char *t0)
{
    char t4[8];
    char t27[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    int t21;
    int t22;
    int t23;
    int t24;
    int t25;
    char *t26;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;

LAB0:    t1 = (t0 + 6392U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 6776);
    *((int *)t2) = 1;
    t3 = (t0 + 6424);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(56, ng0);

LAB5:    xsi_set_current_line(57, ng0);
    t5 = (t0 + 1208U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 3128U);
    t3 = *((char **)t2);

LAB14:    t2 = ((char*)((ng4)));
    t21 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t21 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t21 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t21 == 1)
        goto LAB17;

LAB18:    t5 = ((char*)((ng7)));
    t22 = xsi_vlog_unsigned_case_compare(t3, 4, t5, 4);
    if (t22 == 1)
        goto LAB19;

LAB20:    t6 = ((char*)((ng8)));
    t23 = xsi_vlog_unsigned_case_compare(t3, 4, t6, 4);
    if (t23 == 1)
        goto LAB21;

LAB22:    t12 = ((char*)((ng9)));
    t24 = xsi_vlog_unsigned_case_compare(t3, 4, t12, 4);
    if (t24 == 1)
        goto LAB23;

LAB24:    t13 = ((char*)((ng10)));
    t25 = xsi_vlog_unsigned_case_compare(t3, 4, t13, 4);
    if (t25 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng2)));
    t21 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t21 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng13)));
    t21 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t21 == 1)
        goto LAB29;

LAB30:    t5 = ((char*)((ng14)));
    t22 = xsi_vlog_unsigned_case_compare(t3, 4, t5, 4);
    if (t22 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng17)));
    t21 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t21 == 1)
        goto LAB33;

LAB34:
LAB36:
LAB35:    xsi_set_current_line(146, ng0);

LAB92:    xsi_set_current_line(147, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 12, 0LL);

LAB37:
LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(57, ng0);

LAB13:    xsi_set_current_line(58, ng0);
    t19 = ((char*)((ng1)));
    t20 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 5, 0LL);
    xsi_set_current_line(59, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 12, 0LL);
    goto LAB12;

LAB15:    xsi_set_current_line(64, ng0);

LAB38:    xsi_set_current_line(65, ng0);
    t5 = ((char*)((ng5)));
    t6 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 5, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 12, 0LL);
    goto LAB37;

LAB17:    goto LAB15;

LAB19:    goto LAB15;

LAB21:    goto LAB15;

LAB23:    goto LAB15;

LAB25:    xsi_set_current_line(69, ng0);

LAB39:    xsi_set_current_line(70, ng0);
    t19 = ((char*)((ng11)));
    t20 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t20, t19, 0, 0, 5, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 12, 0LL);
    goto LAB37;

LAB27:    xsi_set_current_line(74, ng0);

LAB40:    xsi_set_current_line(75, ng0);
    t5 = ((char*)((ng12)));
    t6 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t6, t5, 0, 0, 5, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 12, 0LL);
    goto LAB37;

LAB29:    goto LAB27;

LAB31:    xsi_set_current_line(79, ng0);

LAB41:    xsi_set_current_line(80, ng0);
    t6 = ((char*)((ng15)));
    t12 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t12, t6, 0, 0, 5, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng4)));
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng16)));
    t5 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 12, 0LL);
    goto LAB37;

LAB33:    xsi_set_current_line(92, ng0);
    t5 = (t0 + 3288U);
    t6 = *((char **)t5);

LAB42:    t5 = ((char*)((ng4)));
    t22 = xsi_vlog_unsigned_case_compare(t6, 4, t5, 4);
    if (t22 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng6)));
    t21 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t21 == 1)
        goto LAB45;

LAB46:    t5 = ((char*)((ng7)));
    t22 = xsi_vlog_unsigned_case_compare(t6, 4, t5, 4);
    if (t22 == 1)
        goto LAB47;

LAB48:    t12 = ((char*)((ng18)));
    t23 = xsi_vlog_unsigned_case_compare(t6, 4, t12, 4);
    if (t23 == 1)
        goto LAB49;

LAB50:    t13 = ((char*)((ng17)));
    t24 = xsi_vlog_unsigned_case_compare(t6, 4, t13, 4);
    if (t24 == 1)
        goto LAB51;

LAB52:    t19 = ((char*)((ng10)));
    t25 = xsi_vlog_unsigned_case_compare(t6, 4, t19, 4);
    if (t25 == 1)
        goto LAB53;

LAB54:    t2 = ((char*)((ng2)));
    t21 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t21 == 1)
        goto LAB55;

LAB56:    t2 = ((char*)((ng13)));
    t21 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t21 == 1)
        goto LAB57;

LAB58:    t2 = ((char*)((ng14)));
    t21 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t21 == 1)
        goto LAB59;

LAB60:    t2 = ((char*)((ng9)));
    t21 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t21 == 1)
        goto LAB61;

LAB62:    t2 = ((char*)((ng25)));
    t21 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t21 == 1)
        goto LAB63;

LAB64:
LAB66:
LAB65:    xsi_set_current_line(140, ng0);

LAB91:    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 12, 0LL);

LAB67:    goto LAB37;

LAB43:    xsi_set_current_line(93, ng0);

LAB68:    xsi_set_current_line(94, ng0);
    t12 = ((char*)((ng5)));
    t13 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 5, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 12, 0LL);
    goto LAB67;

LAB45:    goto LAB43;

LAB47:    goto LAB43;

LAB49:    goto LAB43;

LAB51:    goto LAB43;

LAB53:    xsi_set_current_line(98, ng0);

LAB69:    xsi_set_current_line(99, ng0);
    t20 = ((char*)((ng19)));
    t26 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t26, t20, 0, 0, 5, 0LL);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 3768U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 20);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 20);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 3U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 3U);
    t13 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t13, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 3768U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 8);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 8);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 4095U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 4095U);
    t13 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t13, t4, 0, 0, 12, 0LL);
    goto LAB67;

LAB55:    xsi_set_current_line(103, ng0);

LAB70:    xsi_set_current_line(104, ng0);
    t5 = ((char*)((ng20)));
    t12 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t12, t5, 0, 0, 5, 0LL);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3768U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 20);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 20);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 3U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 3U);
    t13 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t13, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 3768U);
    t5 = *((char **)t2);
    memset(t27, 0, 8);
    t2 = (t27 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 0);
    *((unsigned int *)t27) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t11 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t13 = ((char*)((ng7)));
    xsi_vlogtype_concat(t4, 12, 12, 2U, t13, 4, t27, 8);
    t19 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 12, 0LL);
    goto LAB67;

LAB57:    xsi_set_current_line(111, ng0);

LAB71:    xsi_set_current_line(112, ng0);
    t5 = (t0 + 3608U);
    t12 = *((char **)t5);
    t5 = (t0 + 2968U);
    t13 = *((char **)t5);
    t5 = ((char*)((ng21)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_minus(t4, 32, t13, 9, t5, 32);
    memset(t27, 0, 8);
    t19 = (t12 + 4);
    t20 = (t4 + 4);
    t7 = *((unsigned int *)t12);
    t8 = *((unsigned int *)t4);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t19);
    t11 = *((unsigned int *)t20);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t19);
    t17 = *((unsigned int *)t20);
    t18 = (t16 | t17);
    t28 = (~(t18));
    t29 = (t15 & t28);
    if (t29 != 0)
        goto LAB75;

LAB72:    if (t18 != 0)
        goto LAB74;

LAB73:    *((unsigned int *)t27) = 1;

LAB75:    t30 = (t27 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (~(t31));
    t33 = *((unsigned int *)t27);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB76;

LAB77:    xsi_set_current_line(113, ng0);

LAB79:    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(115, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 12, 0LL);

LAB78:    goto LAB67;

LAB59:    xsi_set_current_line(119, ng0);

LAB80:    xsi_set_current_line(120, ng0);
    t5 = ((char*)((ng23)));
    t12 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t12, t5, 0, 0, 5, 0LL);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 3768U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 20);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 20);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 3U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 3U);
    t13 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t13, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 3768U);
    t5 = *((char **)t2);
    memset(t27, 0, 8);
    t2 = (t27 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 0);
    *((unsigned int *)t27) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t11 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t13 = ((char*)((ng7)));
    xsi_vlogtype_concat(t4, 12, 12, 2U, t13, 4, t27, 8);
    t19 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t19, t4, 0, 0, 12, 0LL);
    goto LAB67;

LAB61:    xsi_set_current_line(127, ng0);

LAB81:    xsi_set_current_line(128, ng0);
    t5 = (t0 + 3608U);
    t12 = *((char **)t5);
    t5 = (t0 + 2808U);
    t13 = *((char **)t5);
    t5 = ((char*)((ng24)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_minus(t4, 32, t13, 9, t5, 32);
    memset(t27, 0, 8);
    t19 = (t12 + 4);
    t20 = (t4 + 4);
    t7 = *((unsigned int *)t12);
    t8 = *((unsigned int *)t4);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t19);
    t11 = *((unsigned int *)t20);
    t14 = (t10 ^ t11);
    t15 = (t9 | t14);
    t16 = *((unsigned int *)t19);
    t17 = *((unsigned int *)t20);
    t18 = (t16 | t17);
    t28 = (~(t18));
    t29 = (t15 & t28);
    if (t29 != 0)
        goto LAB85;

LAB82:    if (t18 != 0)
        goto LAB84;

LAB83:    *((unsigned int *)t27) = 1;

LAB85:    t30 = (t27 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (~(t31));
    t33 = *((unsigned int *)t27);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB86;

LAB87:    xsi_set_current_line(129, ng0);

LAB89:    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 12, 0LL);

LAB88:    goto LAB67;

LAB63:    xsi_set_current_line(135, ng0);

LAB90:    xsi_set_current_line(136, ng0);
    t5 = ((char*)((ng12)));
    t12 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t12, t5, 0, 0, 5, 0LL);
    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(138, ng0);
    t2 = ((char*)((ng3)));
    t5 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 12, 0LL);
    goto LAB67;

LAB74:    t26 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB75;

LAB76:    xsi_set_current_line(112, ng0);
    t36 = ((char*)((ng22)));
    t37 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t37, t36, 0, 0, 5, 0LL);
    goto LAB78;

LAB84:    t26 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB85;

LAB86:    xsi_set_current_line(128, ng0);
    t36 = ((char*)((ng22)));
    t37 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t37, t36, 0, 0, 5, 0LL);
    goto LAB88;

}


extern void work_m_10887899162551176213_2879558445_init()
{
	static char *pe[] = {(void *)Cont_47_0,(void *)Cont_48_1,(void *)Cont_49_2,(void *)Cont_54_3,(void *)Always_56_4};
	xsi_register_didat("work_m_10887899162551176213_2879558445", "isim/tb_sdram_isim_beh.exe.sim/work/m_10887899162551176213_2879558445.didat");
	xsi_register_executes(pe);
}
