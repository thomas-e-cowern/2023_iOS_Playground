/* Copyright (c) 2015, Google Inc.
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
 * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
 * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE. */

 /* This file was generated by err_data_generate.go. */

#include <CJWTKitBoringSSL_base.h>
#include <CJWTKitBoringSSL_err.h>

#include <assert.h>

static_assert(ERR_LIB_NONE == 1, "library value changed");
static_assert(ERR_LIB_SYS == 2, "library value changed");
static_assert(ERR_LIB_BN == 3, "library value changed");
static_assert(ERR_LIB_RSA == 4, "library value changed");
static_assert(ERR_LIB_DH == 5, "library value changed");
static_assert(ERR_LIB_EVP == 6, "library value changed");
static_assert(ERR_LIB_BUF == 7, "library value changed");
static_assert(ERR_LIB_OBJ == 8, "library value changed");
static_assert(ERR_LIB_PEM == 9, "library value changed");
static_assert(ERR_LIB_DSA == 10, "library value changed");
static_assert(ERR_LIB_X509 == 11, "library value changed");
static_assert(ERR_LIB_ASN1 == 12, "library value changed");
static_assert(ERR_LIB_CONF == 13, "library value changed");
static_assert(ERR_LIB_CRYPTO == 14, "library value changed");
static_assert(ERR_LIB_EC == 15, "library value changed");
static_assert(ERR_LIB_SSL == 16, "library value changed");
static_assert(ERR_LIB_BIO == 17, "library value changed");
static_assert(ERR_LIB_PKCS7 == 18, "library value changed");
static_assert(ERR_LIB_PKCS8 == 19, "library value changed");
static_assert(ERR_LIB_X509V3 == 20, "library value changed");
static_assert(ERR_LIB_RAND == 21, "library value changed");
static_assert(ERR_LIB_ENGINE == 22, "library value changed");
static_assert(ERR_LIB_OCSP == 23, "library value changed");
static_assert(ERR_LIB_UI == 24, "library value changed");
static_assert(ERR_LIB_COMP == 25, "library value changed");
static_assert(ERR_LIB_ECDSA == 26, "library value changed");
static_assert(ERR_LIB_ECDH == 27, "library value changed");
static_assert(ERR_LIB_HMAC == 28, "library value changed");
static_assert(ERR_LIB_DIGEST == 29, "library value changed");
static_assert(ERR_LIB_CIPHER == 30, "library value changed");
static_assert(ERR_LIB_HKDF == 31, "library value changed");
static_assert(ERR_LIB_TRUST_TOKEN == 32, "library value changed");
static_assert(ERR_LIB_USER == 33, "library value changed");
static_assert(ERR_NUM_LIBS == 34, "number of libraries changed");

const uint32_t kOpenSSLReasonValues[] = {
    0xc320885,
    0xc32889f,
    0xc3308ae,
    0xc3388be,
    0xc3408cd,
    0xc3488e6,
    0xc3508f2,
    0xc35890f,
    0xc36092f,
    0xc36893d,
    0xc37094d,
    0xc37895a,
    0xc38096a,
    0xc388975,
    0xc39098b,
    0xc39899a,
    0xc3a09ae,
    0xc3a8892,
    0xc3b00f7,
    0xc3b8921,
    0x10320892,
    0x10329641,
    0x1033164d,
    0x10339666,
    0x10341679,
    0x10348f93,
    0x10350ccc,
    0x1035968c,
    0x103616b6,
    0x103696c9,
    0x103716e8,
    0x10379701,
    0x10381716,
    0x10389734,
    0x10391743,
    0x1039975f,
    0x103a177a,
    0x103a9789,
    0x103b17a5,
    0x103b97c0,
    0x103c17e6,
    0x103c80f7,
    0x103d17f7,
    0x103d980b,
    0x103e182a,
    0x103e9839,
    0x103f1850,
    0x103f9863,
    0x10400c90,
    0x10409876,
    0x10411894,
    0x104198a7,
    0x104218c1,
    0x104298d1,
    0x104318e5,
    0x104398fb,
    0x10441913,
    0x10449928,
    0x1045193c,
    0x1045994e,
    0x10460635,
    0x1046899a,
    0x10471963,
    0x1047997a,
    0x1048198f,
    0x1048999d,
    0x10490edf,
    0x104997d7,
    0x104a16a1,
    0x14320c73,
    0x14328c81,
    0x14330c90,
    0x14338ca2,
    0x143400b9,
    0x143480f7,
    0x18320090,
    0x18328fe9,
    0x183300b9,
    0x18338fff,
    0x18341013,
    0x183480f7,
    0x18351032,
    0x1835904a,
    0x1836105f,
    0x18369073,
    0x183710ab,
    0x183790c1,
    0x183810d5,
    0x183890e5,
    0x18390ac0,
    0x183990f5,
    0x183a111b,
    0x183a9141,
    0x183b0ceb,
    0x183b9190,
    0x183c11a2,
    0x183c91ad,
    0x183d11bd,
    0x183d91ce,
    0x183e11df,
    0x183e91f1,
    0x183f121a,
    0x183f9233,
    0x1840124b,
    0x1840870d,
    0x18411164,
    0x1841912f,
    0x1842114e,
    0x18428cd8,
    0x1843110a,
    0x18439176,
    0x18441028,
    0x18449097,
    0x20321285,
    0x20329272,
    0x24321291,
    0x243289e0,
    0x243312a3,
    0x243392b0,
    0x243412bd,
    0x243492cf,
    0x243512de,
    0x243592fb,
    0x24361308,
    0x24369316,
    0x24371324,
    0x24379332,
    0x2438133b,
    0x24389348,
    0x2439135b,
    0x28320cc0,
    0x28328ceb,
    0x28330c90,
    0x28338cfe,
    0x28340ccc,
    0x283480b9,
    0x283500f7,
    0x28358cd8,
    0x2836099a,
    0x2c3232e0,
    0x2c329372,
    0x2c3332ee,
    0x2c33b300,
    0x2c343314,
    0x2c34b326,
    0x2c353341,
    0x2c35b353,
    0x2c363383,
    0x2c36833a,
    0x2c373390,
    0x2c37b3bc,
    0x2c3833fa,
    0x2c38b411,
    0x2c39342f,
    0x2c39b43f,
    0x2c3a3451,
    0x2c3ab465,
    0x2c3b3476,
    0x2c3bb495,
    0x2c3c1384,
    0x2c3c939a,
    0x2c3d34da,
    0x2c3d93b3,
    0x2c3e3504,
    0x2c3eb512,
    0x2c3f352a,
    0x2c3fb542,
    0x2c40356c,
    0x2c409285,
    0x2c41357d,
    0x2c41b590,
    0x2c42124b,
    0x2c42b5a1,
    0x2c43076d,
    0x2c43b487,
    0x2c4433cf,
    0x2c44b54f,
    0x2c453366,
    0x2c45b3a2,
    0x2c46341f,
    0x2c46b4a9,
    0x2c4734be,
    0x2c47b4f7,
    0x2c4833e1,
    0x30320000,
    0x30328015,
    0x3033001f,
    0x30338038,
    0x30340057,
    0x30348071,
    0x30350078,
    0x30358090,
    0x303600a1,
    0x303680b9,
    0x303700c6,
    0x303780d5,
    0x303800f7,
    0x30388104,
    0x30390117,
    0x30398132,
    0x303a0147,
    0x303a815b,
    0x303b016f,
    0x303b8180,
    0x303c0199,
    0x303c81b6,
    0x303d01c4,
    0x303d81d8,
    0x303e01e8,
    0x303e8201,
    0x303f0211,
    0x303f8224,
    0x30400233,
    0x3040823f,
    0x30410254,
    0x30418264,
    0x3042027b,
    0x30428288,
    0x3043029b,
    0x304382aa,
    0x304402bf,
    0x304482e0,
    0x304502f3,
    0x30458306,
    0x3046031f,
    0x3046833a,
    0x30470372,
    0x30478384,
    0x304803a2,
    0x304883b3,
    0x304903c2,
    0x304983da,
    0x304a03ec,
    0x304a8400,
    0x304b0418,
    0x304b842b,
    0x304c0436,
    0x304c8447,
    0x304d0453,
    0x304d8469,
    0x304e0477,
    0x304e848d,
    0x304f049f,
    0x304f84b1,
    0x305004d4,
    0x305084e7,
    0x305104f8,
    0x30518508,
    0x30520520,
    0x30528535,
    0x3053054d,
    0x30538561,
    0x30540579,
    0x30548592,
    0x305505ab,
    0x305585c8,
    0x305605d3,
    0x305685eb,
    0x305705fb,
    0x3057860c,
    0x3058061f,
    0x30588635,
    0x3059063e,
    0x30598653,
    0x305a0666,
    0x305a8675,
    0x305b0695,
    0x305b86a4,
    0x305c06c5,
    0x305c86e1,
    0x305d06ed,
    0x305d870d,
    0x305e0729,
    0x305e874d,
    0x305f0763,
    0x305f876d,
    0x306004c4,
    0x3060804a,
    0x30610357,
    0x3061873a,
    0x30620392,
    0x34320bb0,
    0x34328bc4,
    0x34330be1,
    0x34338bf4,
    0x34340c03,
    0x34348c5d,
    0x34350c41,
    0x34358c20,
    0x3c320090,
    0x3c328d28,
    0x3c330d41,
    0x3c338d5c,
    0x3c340d79,
    0x3c348da3,
    0x3c350dbe,
    0x3c358de4,
    0x3c360dfd,
    0x3c368e15,
    0x3c370e26,
    0x3c378e34,
    0x3c380e41,
    0x3c388e55,
    0x3c390ceb,
    0x3c398e78,
    0x3c3a0e8c,
    0x3c3a895a,
    0x3c3b0e9c,
    0x3c3b8eb7,
    0x3c3c0ec9,
    0x3c3c8efc,
    0x3c3d0f06,
    0x3c3d8f1a,
    0x3c3e0f28,
    0x3c3e8f4d,
    0x3c3f0d14,
    0x3c3f8f36,
    0x3c4000b9,
    0x3c4080f7,
    0x3c410d94,
    0x3c418dd3,
    0x3c420edf,
    0x3c428e69,
    0x40321a2f,
    0x40329a45,
    0x40331a73,
    0x40339a7d,
    0x40341a94,
    0x40349ab2,
    0x40351ac2,
    0x40359ad4,
    0x40361ae1,
    0x40369aed,
    0x40371b02,
    0x40379b14,
    0x40381b1f,
    0x40389b31,
    0x40390f93,
    0x40399b41,
    0x403a1b54,
    0x403a9b75,
    0x403b1b86,
    0x403b9b96,
    0x403c0071,
    0x403c8090,
    0x403d1bf7,
    0x403d9c0d,
    0x403e1c1c,
    0x403e9c54,
    0x403f1c6e,
    0x403f9c96,
    0x40401cab,
    0x40409cbf,
    0x40411cfa,
    0x40419d15,
    0x40421d2e,
    0x40429d41,
    0x40431d55,
    0x40439d83,
    0x40441d9a,
    0x404480b9,
    0x40451daf,
    0x40459dc1,
    0x40461de5,
    0x40469e05,
    0x40471e13,
    0x40479e3a,
    0x40481eab,
    0x40489f65,
    0x40491f7c,
    0x40499f96,
    0x404a1fad,
    0x404a9fcb,
    0x404b1fe3,
    0x404ba010,
    0x404c2026,
    0x404ca038,
    0x404d2059,
    0x404da092,
    0x404e20a6,
    0x404ea0b3,
    0x404f214d,
    0x404fa1c3,
    0x40502232,
    0x4050a246,
    0x40512279,
    0x40522289,
    0x4052a2ad,
    0x405322c5,
    0x4053a2d8,
    0x405422ed,
    0x4054a310,
    0x4055233b,
    0x4055a378,
    0x4056239d,
    0x4056a3b6,
    0x405723ce,
    0x4057a3e1,
    0x405823f6,
    0x4058a41d,
    0x4059244c,
    0x4059a479,
    0x405a248d,
    0x405aa49d,
    0x405b24b5,
    0x405ba4c6,
    0x405c24d9,
    0x405ca518,
    0x405d2525,
    0x405da54a,
    0x405e2588,
    0x405e8afe,
    0x405f25a9,
    0x405fa5b6,
    0x406025c4,
    0x4060a5e6,
    0x40612647,
    0x4061a67f,
    0x40622696,
    0x4062a6a7,
    0x406326f4,
    0x4063a709,
    0x40642720,
    0x4064a74c,
    0x40652767,
    0x4065a77e,
    0x40662796,
    0x4066a7c0,
    0x406727eb,
    0x4067a830,
    0x40682878,
    0x4068a899,
    0x406928cb,
    0x4069a8f9,
    0x406a291a,
    0x406aa93a,
    0x406b2ac2,
    0x406baae5,
    0x406c2afb,
    0x406cae05,
    0x406d2e34,
    0x406dae5c,
    0x406e2e8a,
    0x406eaed7,
    0x406f2f30,
    0x406faf68,
    0x40702f7b,
    0x4070af98,
    0x4071084d,
    0x4071afaa,
    0x40722fbd,
    0x4072aff3,
    0x4073300b,
    0x4073959c,
    0x4074301f,
    0x4074b039,
    0x4075304a,
    0x4075b05e,
    0x4076306c,
    0x40769348,
    0x40773091,
    0x4077b0d1,
    0x407830ec,
    0x4078b125,
    0x4079313c,
    0x4079b152,
    0x407a317e,
    0x407ab191,
    0x407b31a6,
    0x407bb1b8,
    0x407c31e9,
    0x407cb1f2,
    0x407d28b4,
    0x407da1eb,
    0x407e3101,
    0x407ea42d,
    0x407f1e27,
    0x407f9ffa,
    0x4080215d,
    0x40809e4f,
    0x4081229b,
    0x4081a101,
    0x40822e75,
    0x40829ba2,
    0x40832408,
    0x4083a731,
    0x40841e63,
    0x4084a465,
    0x408524ea,
    0x4085a60e,
    0x4086256a,
    0x4086a205,
    0x40872ebb,
    0x4087a65c,
    0x40881be0,
    0x4088a843,
    0x40891c2f,
    0x40899bbc,
    0x408a2b33,
    0x408a99b4,
    0x408b31cd,
    0x408baf45,
    0x408c24fa,
    0x408c99ec,
    0x408d1f4b,
    0x408d9e95,
    0x408e207b,
    0x408ea358,
    0x408f2857,
    0x408fa62a,
    0x4090280c,
    0x4090a53c,
    0x40912b1b,
    0x40919a12,
    0x40921c7c,
    0x4092aef6,
    0x40932fd6,
    0x4093a216,
    0x40941e77,
    0x4094ab4c,
    0x409526b8,
    0x4095b15e,
    0x40962ea2,
    0x4096a176,
    0x40972261,
    0x4097a0ca,
    0x40981cdc,
    0x4098a6cc,
    0x40992f12,
    0x4099a385,
    0x409a231e,
    0x409a99d0,
    0x409b1ed1,
    0x409b9efc,
    0x409c30b3,
    0x409c9f24,
    0x409d2132,
    0x409da117,
    0x409e1d6d,
    0x409ea1ab,
    0x409f2193,
    0x409f9ec4,
    0x40a021d3,
    0x40a0a0e4,
    0x41f429ed,
    0x41f92a7f,
    0x41fe2972,
    0x41feac28,
    0x41ff2d56,
    0x42032a06,
    0x42082a28,
    0x4208aa64,
    0x42092956,
    0x4209aa9e,
    0x420a29ad,
    0x420aa98d,
    0x420b29cd,
    0x420baa46,
    0x420c2d72,
    0x420cab5c,
    0x420d2c0f,
    0x420dac46,
    0x42122c79,
    0x42172d39,
    0x4217acbb,
    0x421c2cdd,
    0x421f2c98,
    0x42212dea,
    0x42262d1c,
    0x422b2dc8,
    0x422babea,
    0x422c2daa,
    0x422cab9d,
    0x422d2b76,
    0x422dad89,
    0x422e2bc9,
    0x42302cf8,
    0x4230ac60,
    0x44320778,
    0x44328787,
    0x44330793,
    0x443387a1,
    0x443407b4,
    0x443487c5,
    0x443507cc,
    0x443587d6,
    0x443607e9,
    0x443687ff,
    0x44370811,
    0x4437881e,
    0x4438082d,
    0x44388835,
    0x4439084d,
    0x4439885b,
    0x443a086e,
    0x48321372,
    0x48329384,
    0x4833139a,
    0x483393b3,
    0x4c3213f0,
    0x4c329400,
    0x4c331413,
    0x4c339433,
    0x4c3400b9,
    0x4c3480f7,
    0x4c35143f,
    0x4c35944d,
    0x4c361469,
    0x4c36948f,
    0x4c37149e,
    0x4c3794ac,
    0x4c3814c1,
    0x4c3894cd,
    0x4c3914ed,
    0x4c399517,
    0x4c3a1530,
    0x4c3a9549,
    0x4c3b0635,
    0x4c3b9562,
    0x4c3c1574,
    0x4c3c9583,
    0x4c3d159c,
    0x4c3d8cb3,
    0x4c3e1609,
    0x4c3e95ab,
    0x4c3f162b,
    0x4c3f9348,
    0x4c4015c1,
    0x4c4093dc,
    0x4c4115f9,
    0x4c41947c,
    0x4c4215e5,
    0x4c4293c4,
    0x503235b3,
    0x5032b5c2,
    0x503335cd,
    0x5033b5dd,
    0x503435f6,
    0x5034b610,
    0x5035361e,
    0x5035b634,
    0x50363646,
    0x5036b65c,
    0x50373675,
    0x5037b688,
    0x503836a0,
    0x5038b6b1,
    0x503936c6,
    0x5039b6da,
    0x503a36fa,
    0x503ab710,
    0x503b3728,
    0x503bb73a,
    0x503c3756,
    0x503cb76d,
    0x503d3786,
    0x503db79c,
    0x503e37a9,
    0x503eb7bf,
    0x503f37d1,
    0x503f83b3,
    0x504037e4,
    0x5040b7f4,
    0x5041380e,
    0x5041b81d,
    0x50423837,
    0x5042b854,
    0x50433864,
    0x5043b874,
    0x50443891,
    0x50448469,
    0x504538a5,
    0x5045b8c3,
    0x504638d6,
    0x5046b8ec,
    0x504738fe,
    0x5047b913,
    0x50483939,
    0x5048b947,
    0x5049395a,
    0x5049b96f,
    0x504a3985,
    0x504ab995,
    0x504b39b5,
    0x504bb9c8,
    0x504c39eb,
    0x504cba19,
    0x504d3a46,
    0x504dba63,
    0x504e3a7e,
    0x504eba9a,
    0x504f3aac,
    0x504fbac3,
    0x50503ad2,
    0x50508729,
    0x50513ae5,
    0x5051b883,
    0x50523a2b,
    0x58320fd1,
    0x68320f93,
    0x68328ceb,
    0x68330cfe,
    0x68338fa1,
    0x68340fb1,
    0x683480f7,
    0x6835099a,
    0x6c320f59,
    0x6c328ca2,
    0x6c330f64,
    0x6c338f7d,
    0x74320a66,
    0x743280b9,
    0x74330cb3,
    0x783209cb,
    0x783289e0,
    0x783309ec,
    0x78338090,
    0x783409fb,
    0x78348a10,
    0x78350a2f,
    0x78358a51,
    0x78360a66,
    0x78368a7c,
    0x78370a8c,
    0x78378aad,
    0x78380ac0,
    0x78388ad2,
    0x78390adf,
    0x78398afe,
    0x783a0b13,
    0x783a8b21,
    0x783b0b2b,
    0x783b8b3f,
    0x783c0b56,
    0x783c8b6b,
    0x783d0b82,
    0x783d8b97,
    0x783e0aed,
    0x783e8a9f,
    0x7c321261,
    0x8032148f,
    0x80328090,
    0x803332af,
    0x803380b9,
    0x803432be,
    0x8034b226,
    0x80353244,
    0x8035b2d2,
    0x80363286,
    0x8036b235,
    0x80373278,
    0x8037b213,
    0x80383299,
    0x8038b255,
    0x8039326a,
};

const size_t kOpenSSLReasonValuesLen = sizeof(kOpenSSLReasonValues) / sizeof(kOpenSSLReasonValues[0]);

const char kOpenSSLReasonStringData[] =
    "ASN1_LENGTH_MISMATCH\0"
    "AUX_ERROR\0"
    "BAD_GET_ASN1_OBJECT_CALL\0"
    "BAD_OBJECT_HEADER\0"
    "BAD_TEMPLATE\0"
    "BMPSTRING_IS_WRONG_LENGTH\0"
    "BN_LIB\0"
    "BOOLEAN_IS_WRONG_LENGTH\0"
    "BUFFER_TOO_SMALL\0"
    "CONTEXT_NOT_INITIALISED\0"
    "DECODE_ERROR\0"
    "DEPTH_EXCEEDED\0"
    "DIGEST_AND_KEY_TYPE_NOT_SUPPORTED\0"
    "ENCODE_ERROR\0"
    "ERROR_GETTING_TIME\0"
    "EXPECTING_AN_ASN1_SEQUENCE\0"
    "EXPECTING_AN_INTEGER\0"
    "EXPECTING_AN_OBJECT\0"
    "EXPECTING_A_BOOLEAN\0"
    "EXPECTING_A_TIME\0"
    "EXPLICIT_LENGTH_MISMATCH\0"
    "EXPLICIT_TAG_NOT_CONSTRUCTED\0"
    "FIELD_MISSING\0"
    "FIRST_NUM_TOO_LARGE\0"
    "HEADER_TOO_LONG\0"
    "ILLEGAL_BITSTRING_FORMAT\0"
    "ILLEGAL_BOOLEAN\0"
    "ILLEGAL_CHARACTERS\0"
    "ILLEGAL_FORMAT\0"
    "ILLEGAL_HEX\0"
    "ILLEGAL_IMPLICIT_TAG\0"
    "ILLEGAL_INTEGER\0"
    "ILLEGAL_NESTED_TAGGING\0"
    "ILLEGAL_NULL\0"
    "ILLEGAL_NULL_VALUE\0"
    "ILLEGAL_OBJECT\0"
    "ILLEGAL_OPTIONAL_ANY\0"
    "ILLEGAL_OPTIONS_ON_ITEM_TEMPLATE\0"
    "ILLEGAL_TAGGED_ANY\0"
    "ILLEGAL_TIME_VALUE\0"
    "INTEGER_NOT_ASCII_FORMAT\0"
    "INTEGER_TOO_LARGE_FOR_LONG\0"
    "INVALID_BIT_STRING_BITS_LEFT\0"
    "INVALID_BIT_STRING_PADDING\0"
    "INVALID_BMPSTRING\0"
    "INVALID_DIGIT\0"
    "INVALID_INTEGER\0"
    "INVALID_MODIFIER\0"
    "INVALID_NUMBER\0"
    "INVALID_OBJECT_ENCODING\0"
    "INVALID_SEPARATOR\0"
    "INVALID_TIME_FORMAT\0"
    "INVALID_UNIVERSALSTRING\0"
    "INVALID_UTF8STRING\0"
    "LIST_ERROR\0"
    "MISSING_ASN1_EOS\0"
    "MISSING_EOC\0"
    "MISSING_SECOND_NUMBER\0"
    "MISSING_VALUE\0"
    "MSTRING_NOT_UNIVERSAL\0"
    "MSTRING_WRONG_TAG\0"
    "NESTED_ASN1_ERROR\0"
    "NESTED_ASN1_STRING\0"
    "NESTED_TOO_DEEP\0"
    "NON_HEX_CHARACTERS\0"
    "NOT_ASCII_FORMAT\0"
    "NOT_ENOUGH_DATA\0"
    "NO_MATCHING_CHOICE_TYPE\0"
    "NULL_IS_WRONG_LENGTH\0"
    "OBJECT_NOT_ASCII_FORMAT\0"
    "ODD_NUMBER_OF_CHARS\0"
    "SECOND_NUMBER_TOO_LARGE\0"
    "SEQUENCE_LENGTH_MISMATCH\0"
    "SEQUENCE_NOT_CONSTRUCTED\0"
    "SEQUENCE_OR_SET_NEEDS_CONFIG\0"
    "SHORT_LINE\0"
    "STREAMING_NOT_SUPPORTED\0"
    "STRING_TOO_LONG\0"
    "STRING_TOO_SHORT\0"
    "TAG_VALUE_TOO_HIGH\0"
    "TIME_NOT_ASCII_FORMAT\0"
    "TOO_LONG\0"
    "TYPE_NOT_CONSTRUCTED\0"
    "TYPE_NOT_PRIMITIVE\0"
    "UNEXPECTED_EOC\0"
    "UNIVERSALSTRING_IS_WRONG_LENGTH\0"
    "UNKNOWN_FORMAT\0"
    "UNKNOWN_MESSAGE_DIGEST_ALGORITHM\0"
    "UNKNOWN_SIGNATURE_ALGORITHM\0"
    "UNKNOWN_TAG\0"
    "UNSUPPORTED_ANY_DEFINED_BY_TYPE\0"
    "UNSUPPORTED_PUBLIC_KEY_TYPE\0"
    "UNSUPPORTED_TYPE\0"
    "WRONG_INTEGER_TYPE\0"
    "WRONG_PUBLIC_KEY_TYPE\0"
    "WRONG_TAG\0"
    "WRONG_TYPE\0"
    "BAD_FOPEN_MODE\0"
    "BROKEN_PIPE\0"
    "CONNECT_ERROR\0"
    "ERROR_SETTING_NBIO\0"
    "INVALID_ARGUMENT\0"
    "IN_USE\0"
    "KEEPALIVE\0"
    "NBIO_CONNECT_ERROR\0"
    "NO_HOSTNAME_SPECIFIED\0"
    "NO_PORT_SPECIFIED\0"
    "NO_SUCH_FILE\0"
    "NULL_PARAMETER\0"
    "SYS_LIB\0"
    "UNABLE_TO_CREATE_SOCKET\0"
    "UNINITIALIZED\0"
    "UNSUPPORTED_METHOD\0"
    "WRITE_TO_READ_ONLY_BIO\0"
    "ARG2_LT_ARG3\0"
    "BAD_ENCODING\0"
    "BAD_RECIPROCAL\0"
    "BIGNUM_TOO_LONG\0"
    "BITS_TOO_SMALL\0"
    "CALLED_WITH_EVEN_MODULUS\0"
    "DIV_BY_ZERO\0"
    "EXPAND_ON_STATIC_BIGNUM_DATA\0"
    "INPUT_NOT_REDUCED\0"
    "INVALID_INPUT\0"
    "INVALID_RANGE\0"
    "NEGATIVE_NUMBER\0"
    "NOT_A_SQUARE\0"
    "NOT_INITIALIZED\0"
    "NO_INVERSE\0"
    "PRIVATE_KEY_TOO_LARGE\0"
    "P_IS_NOT_PRIME\0"
    "TOO_MANY_ITERATIONS\0"
    "TOO_MANY_TEMPORARY_VARIABLES\0"
    "AES_KEY_SETUP_FAILED\0"
    "BAD_DECRYPT\0"
    "BAD_KEY_LENGTH\0"
    "CTRL_NOT_IMPLEMENTED\0"
    "CTRL_OPERATION_NOT_IMPLEMENTED\0"
    "DATA_NOT_MULTIPLE_OF_BLOCK_LENGTH\0"
    "INITIALIZATION_ERROR\0"
    "INPUT_NOT_INITIALIZED\0"
    "INVALID_AD_SIZE\0"
    "INVALID_KEY_LENGTH\0"
    "INVALID_NONCE\0"
    "INVALID_NONCE_SIZE\0"
    "INVALID_OPERATION\0"
    "IV_TOO_LARGE\0"
    "NO_CIPHER_SET\0"
    "NO_DIRECTION_SET\0"
    "OUTPUT_ALIASES_INPUT\0"
    "TAG_TOO_LARGE\0"
    "TOO_LARGE\0"
    "UNSUPPORTED_AD_SIZE\0"
    "UNSUPPORTED_INPUT_SIZE\0"
    "UNSUPPORTED_KEY_SIZE\0"
    "UNSUPPORTED_NONCE_SIZE\0"
    "UNSUPPORTED_TAG_SIZE\0"
    "WRONG_FINAL_BLOCK_LENGTH\0"
    "LIST_CANNOT_BE_NULL\0"
    "MISSING_CLOSE_SQUARE_BRACKET\0"
    "MISSING_EQUAL_SIGN\0"
    "NO_CLOSE_BRACE\0"
    "UNABLE_TO_CREATE_NEW_SECTION\0"
    "VARIABLE_EXPANSION_NOT_SUPPORTED\0"
    "VARIABLE_EXPANSION_TOO_LONG\0"
    "VARIABLE_HAS_NO_VALUE\0"
    "BAD_GENERATOR\0"
    "INVALID_PUBKEY\0"
    "MODULUS_TOO_LARGE\0"
    "NO_PRIVATE_VALUE\0"
    "UNKNOWN_HASH\0"
    "BAD_Q_VALUE\0"
    "BAD_VERSION\0"
    "INVALID_PARAMETERS\0"
    "MISSING_PARAMETERS\0"
    "NEED_NEW_SETUP_VALUES\0"
    "BIGNUM_OUT_OF_RANGE\0"
    "COORDINATES_OUT_OF_RANGE\0"
    "D2I_ECPKPARAMETERS_FAILURE\0"
    "EC_GROUP_NEW_BY_NAME_FAILURE\0"
    "GROUP2PKPARAMETERS_FAILURE\0"
    "GROUP_MISMATCH\0"
    "I2D_ECPKPARAMETERS_FAILURE\0"
    "INCOMPATIBLE_OBJECTS\0"
    "INVALID_COFACTOR\0"
    "INVALID_COMPRESSED_POINT\0"
    "INVALID_COMPRESSION_BIT\0"
    "INVALID_ENCODING\0"
    "INVALID_FIELD\0"
    "INVALID_FORM\0"
    "INVALID_GROUP_ORDER\0"
    "INVALID_PRIVATE_KEY\0"
    "INVALID_SCALAR\0"
    "MISSING_PRIVATE_KEY\0"
    "NON_NAMED_CURVE\0"
    "PKPARAMETERS2GROUP_FAILURE\0"
    "POINT_AT_INFINITY\0"
    "POINT_IS_NOT_ON_CURVE\0"
    "PUBLIC_KEY_VALIDATION_FAILED\0"
    "SLOT_FULL\0"
    "UNDEFINED_GENERATOR\0"
    "UNKNOWN_GROUP\0"
    "UNKNOWN_ORDER\0"
    "WRONG_CURVE_PARAMETERS\0"
    "WRONG_ORDER\0"
    "KDF_FAILED\0"
    "POINT_ARITHMETIC_FAILURE\0"
    "UNKNOWN_DIGEST_LENGTH\0"
    "BAD_SIGNATURE\0"
    "NOT_IMPLEMENTED\0"
    "RANDOM_NUMBER_GENERATION_FAILED\0"
    "OPERATION_NOT_SUPPORTED\0"
    "COMMAND_NOT_SUPPORTED\0"
    "DIFFERENT_KEY_TYPES\0"
    "DIFFERENT_PARAMETERS\0"
    "EMPTY_PSK\0"
    "EXPECTING_AN_EC_KEY_KEY\0"
    "EXPECTING_AN_RSA_KEY\0"
    "EXPECTING_A_DSA_KEY\0"
    "ILLEGAL_OR_UNSUPPORTED_PADDING_MODE\0"
    "INVALID_BUFFER_SIZE\0"
    "INVALID_DIGEST_LENGTH\0"
    "INVALID_DIGEST_TYPE\0"
    "INVALID_KEYBITS\0"
    "INVALID_MGF1_MD\0"
    "INVALID_PADDING_MODE\0"
    "INVALID_PEER_KEY\0"
    "INVALID_PSS_SALTLEN\0"
    "INVALID_SIGNATURE\0"
    "KEYS_NOT_SET\0"
    "MEMORY_LIMIT_EXCEEDED\0"
    "NOT_A_PRIVATE_KEY\0"
    "NOT_XOF_OR_INVALID_LENGTH\0"
    "NO_DEFAULT_DIGEST\0"
    "NO_KEY_SET\0"
    "NO_MDC2_SUPPORT\0"
    "NO_NID_FOR_CURVE\0"
    "NO_OPERATION_SET\0"
    "NO_PARAMETERS_SET\0"
    "OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE\0"
    "OPERATON_NOT_INITIALIZED\0"
    "UNKNOWN_PUBLIC_KEY_TYPE\0"
    "UNSUPPORTED_ALGORITHM\0"
    "OUTPUT_TOO_LARGE\0"
    "INVALID_OID_STRING\0"
    "UNKNOWN_NID\0"
    "BAD_BASE64_DECODE\0"
    "BAD_END_LINE\0"
    "BAD_IV_CHARS\0"
    "BAD_PASSWORD_READ\0"
    "CIPHER_IS_NULL\0"
    "ERROR_CONVERTING_PRIVATE_KEY\0"
    "NOT_DEK_INFO\0"
    "NOT_ENCRYPTED\0"
    "NOT_PROC_TYPE\0"
    "NO_START_LINE\0"
    "READ_KEY\0"
    "SHORT_HEADER\0"
    "UNSUPPORTED_CIPHER\0"
    "UNSUPPORTED_ENCRYPTION\0"
    "BAD_PKCS7_VERSION\0"
    "NOT_PKCS7_SIGNED_DATA\0"
    "NO_CERTIFICATES_INCLUDED\0"
    "NO_CRLS_INCLUDED\0"
    "AMBIGUOUS_FRIENDLY_NAME\0"
    "BAD_ITERATION_COUNT\0"
    "BAD_PKCS12_DATA\0"
    "BAD_PKCS12_VERSION\0"
    "CIPHER_HAS_NO_OBJECT_IDENTIFIER\0"
    "CRYPT_ERROR\0"
    "ENCRYPT_ERROR\0"
    "ERROR_SETTING_CIPHER_PARAMS\0"
    "INCORRECT_PASSWORD\0"
    "INVALID_CHARACTERS\0"
    "KEYGEN_FAILURE\0"
    "KEY_GEN_ERROR\0"
    "METHOD_NOT_SUPPORTED\0"
    "MISSING_MAC\0"
    "MULTIPLE_PRIVATE_KEYS_IN_PKCS12\0"
    "PKCS12_PUBLIC_KEY_INTEGRITY_NOT_SUPPORTED\0"
    "PKCS12_TOO_DEEPLY_NESTED\0"
    "PRIVATE_KEY_DECODE_ERROR\0"
    "PRIVATE_KEY_ENCODE_ERROR\0"
    "UNKNOWN_ALGORITHM\0"
    "UNKNOWN_CIPHER\0"
    "UNKNOWN_CIPHER_ALGORITHM\0"
    "UNKNOWN_DIGEST\0"
    "UNSUPPORTED_KEYLENGTH\0"
    "UNSUPPORTED_KEY_DERIVATION_FUNCTION\0"
    "UNSUPPORTED_OPTIONS\0"
    "UNSUPPORTED_PRF\0"
    "UNSUPPORTED_PRIVATE_KEY_ALGORITHM\0"
    "UNSUPPORTED_SALT_TYPE\0"
    "BAD_E_VALUE\0"
    "BAD_FIXED_HEADER_DECRYPT\0"
    "BAD_PAD_BYTE_COUNT\0"
    "BAD_RSA_PARAMETERS\0"
    "BLOCK_TYPE_IS_NOT_01\0"
    "BLOCK_TYPE_IS_NOT_02\0"
    "BN_NOT_INITIALIZED\0"
    "CANNOT_RECOVER_MULTI_PRIME_KEY\0"
    "CRT_PARAMS_ALREADY_GIVEN\0"
    "CRT_VALUES_INCORRECT\0"
    "DATA_LEN_NOT_EQUAL_TO_MOD_LEN\0"
    "DATA_TOO_LARGE\0"
    "DATA_TOO_LARGE_FOR_KEY_SIZE\0"
    "DATA_TOO_LARGE_FOR_MODULUS\0"
    "DATA_TOO_SMALL\0"
    "DATA_TOO_SMALL_FOR_KEY_SIZE\0"
    "DIGEST_TOO_BIG_FOR_RSA_KEY\0"
    "D_E_NOT_CONGRUENT_TO_1\0"
    "D_OUT_OF_RANGE\0"
    "EMPTY_PUBLIC_KEY\0"
    "FIRST_OCTET_INVALID\0"
    "INCONSISTENT_SET_OF_CRT_VALUES\0"
    "INTERNAL_ERROR\0"
    "INVALID_MESSAGE_LENGTH\0"
    "KEY_SIZE_TOO_SMALL\0"
    "LAST_OCTET_INVALID\0"
    "MUST_HAVE_AT_LEAST_TWO_PRIMES\0"
    "NO_PUBLIC_EXPONENT\0"
    "NULL_BEFORE_BLOCK_MISSING\0"
    "N_NOT_EQUAL_P_Q\0"
    "OAEP_DECODING_ERROR\0"
    "ONLY_ONE_OF_P_Q_GIVEN\0"
    "OUTPUT_BUFFER_TOO_SMALL\0"
    "PADDING_CHECK_FAILED\0"
    "PKCS_DECODING_ERROR\0"
    "SLEN_CHECK_FAILED\0"
    "SLEN_RECOVERY_FAILED\0"
    "UNKNOWN_ALGORITHM_TYPE\0"
    "UNKNOWN_PADDING_TYPE\0"
    "VALUE_MISSING\0"
    "WRONG_SIGNATURE_LENGTH\0"
    "ALPN_MISMATCH_ON_EARLY_DATA\0"
    "ALPS_MISMATCH_ON_EARLY_DATA\0"
    "APPLICATION_DATA_INSTEAD_OF_HANDSHAKE\0"
    "APPLICATION_DATA_ON_SHUTDOWN\0"
    "APP_DATA_IN_HANDSHAKE\0"
    "ATTEMPT_TO_REUSE_SESSION_IN_DIFFERENT_CONTEXT\0"
    "BAD_ALERT\0"
    "BAD_CHANGE_CIPHER_SPEC\0"
    "BAD_DATA_RETURNED_BY_CALLBACK\0"
    "BAD_DH_P_LENGTH\0"
    "BAD_DIGEST_LENGTH\0"
    "BAD_ECC_CERT\0"
    "BAD_ECPOINT\0"
    "BAD_HANDSHAKE_RECORD\0"
    "BAD_HELLO_REQUEST\0"
    "BAD_LENGTH\0"
    "BAD_PACKET_LENGTH\0"
    "BAD_RSA_ENCRYPT\0"
    "BAD_SRTP_MKI_VALUE\0"
    "BAD_SRTP_PROTECTION_PROFILE_LIST\0"
    "BAD_SSL_FILETYPE\0"
    "BAD_WRITE_RETRY\0"
    "BIO_NOT_SET\0"
    "BLOCK_CIPHER_PAD_IS_WRONG\0"
    "CANNOT_HAVE_BOTH_PRIVKEY_AND_METHOD\0"
    "CANNOT_PARSE_LEAF_CERT\0"
    "CA_DN_LENGTH_MISMATCH\0"
    "CA_DN_TOO_LONG\0"
    "CCS_RECEIVED_EARLY\0"
    "CERTIFICATE_AND_PRIVATE_KEY_MISMATCH\0"
    "CERTIFICATE_VERIFY_FAILED\0"
    "CERT_CB_ERROR\0"
    "CERT_DECOMPRESSION_FAILED\0"
    "CERT_LENGTH_MISMATCH\0"
    "CHANNEL_ID_NOT_P256\0"
    "CHANNEL_ID_SIGNATURE_INVALID\0"
    "CIPHER_MISMATCH_ON_EARLY_DATA\0"
    "CIPHER_OR_HASH_UNAVAILABLE\0"
    "CLIENTHELLO_PARSE_FAILED\0"
    "CLIENTHELLO_TLSEXT\0"
    "CONNECTION_REJECTED\0"
    "CONNECTION_TYPE_NOT_SET\0"
    "COULD_NOT_PARSE_HINTS\0"
    "CUSTOM_EXTENSION_ERROR\0"
    "DATA_LENGTH_TOO_LONG\0"
    "DECRYPTION_FAILED\0"
    "DECRYPTION_FAILED_OR_BAD_RECORD_MAC\0"
    "DH_PUBLIC_VALUE_LENGTH_IS_WRONG\0"
    "DH_P_TOO_LONG\0"
    "DIGEST_CHECK_FAILED\0"
    "DOWNGRADE_DETECTED\0"
    "DTLS_MESSAGE_TOO_BIG\0"
    "DUPLICATE_EXTENSION\0"
    "DUPLICATE_KEY_SHARE\0"
    "DUPLICATE_SIGNATURE_ALGORITHM\0"
    "EARLY_DATA_NOT_IN_USE\0"
    "ECC_CERT_NOT_FOR_SIGNING\0"
    "ECH_REJECTED\0"
    "ECH_SERVER_CONFIG_AND_PRIVATE_KEY_MISMATCH\0"
    "ECH_SERVER_CONFIG_UNSUPPORTED_EXTENSION\0"
    "ECH_SERVER_WOULD_HAVE_NO_RETRY_CONFIGS\0"
    "EMPTY_HELLO_RETRY_REQUEST\0"
    "EMS_STATE_INCONSISTENT\0"
    "ENCRYPTED_LENGTH_TOO_LONG\0"
    "ERROR_ADDING_EXTENSION\0"
    "ERROR_IN_RECEIVED_CIPHER_LIST\0"
    "ERROR_PARSING_EXTENSION\0"
    "EXCESSIVE_MESSAGE_SIZE\0"
    "EXCESS_HANDSHAKE_DATA\0"
    "EXTRA_DATA_IN_MESSAGE\0"
    "FRAGMENT_MISMATCH\0"
    "GOT_NEXT_PROTO_WITHOUT_EXTENSION\0"
    "HANDSHAKE_FAILURE_ON_CLIENT_HELLO\0"
    "HANDSHAKE_NOT_COMPLETE\0"
    "HTTPS_PROXY_REQUEST\0"
    "HTTP_REQUEST\0"
    "INAPPROPRIATE_FALLBACK\0"
    "INCONSISTENT_CLIENT_HELLO\0"
    "INCONSISTENT_ECH_NEGOTIATION\0"
    "INVALID_ALPN_PROTOCOL\0"
    "INVALID_ALPN_PROTOCOL_LIST\0"
    "INVALID_CLIENT_HELLO_INNER\0"
    "INVALID_COMMAND\0"
    "INVALID_COMPRESSION_LIST\0"
    "INVALID_DELEGATED_CREDENTIAL\0"
    "INVALID_ECH_CONFIG_LIST\0"
    "INVALID_ECH_PUBLIC_NAME\0"
    "INVALID_MESSAGE\0"
    "INVALID_OUTER_EXTENSION\0"
    "INVALID_OUTER_RECORD_TYPE\0"
    "INVALID_SCT_LIST\0"
    "INVALID_SIGNATURE_ALGORITHM\0"
    "INVALID_SSL_SESSION\0"
    "INVALID_TICKET_KEYS_LENGTH\0"
    "KEY_USAGE_BIT_INCORRECT\0"
    "LENGTH_MISMATCH\0"
    "MISSING_EXTENSION\0"
    "MISSING_KEY_SHARE\0"
    "MISSING_RSA_CERTIFICATE\0"
    "MISSING_TMP_DH_KEY\0"
    "MISSING_TMP_ECDH_KEY\0"
    "MIXED_SPECIAL_OPERATOR_WITH_GROUPS\0"
    "MTU_TOO_SMALL\0"
    "NEGOTIATED_ALPS_WITHOUT_ALPN\0"
    "NEGOTIATED_BOTH_NPN_AND_ALPN\0"
    "NEGOTIATED_TB_WITHOUT_EMS_OR_RI\0"
    "NESTED_GROUP\0"
    "NO_APPLICATION_PROTOCOL\0"
    "NO_CERTIFICATES_RETURNED\0"
    "NO_CERTIFICATE_ASSIGNED\0"
    "NO_CERTIFICATE_SET\0"
    "NO_CIPHERS_AVAILABLE\0"
    "NO_CIPHERS_PASSED\0"
    "NO_CIPHERS_SPECIFIED\0"
    "NO_CIPHER_MATCH\0"
    "NO_COMMON_SIGNATURE_ALGORITHMS\0"
    "NO_COMPRESSION_SPECIFIED\0"
    "NO_GROUPS_SPECIFIED\0"
    "NO_METHOD_SPECIFIED\0"
    "NO_P256_SUPPORT\0"
    "NO_PRIVATE_KEY_ASSIGNED\0"
    "NO_RENEGOTIATION\0"
    "NO_REQUIRED_DIGEST\0"
    "NO_SHARED_CIPHER\0"
    "NO_SHARED_GROUP\0"
    "NO_SUPPORTED_VERSIONS_ENABLED\0"
    "NULL_SSL_CTX\0"
    "NULL_SSL_METHOD_PASSED\0"
    "OCSP_CB_ERROR\0"
    "OLD_SESSION_CIPHER_NOT_RETURNED\0"
    "OLD_SESSION_PRF_HASH_MISMATCH\0"
    "OLD_SESSION_VERSION_NOT_RETURNED\0"
    "PARSE_TLSEXT\0"
    "PATH_TOO_LONG\0"
    "PEER_DID_NOT_RETURN_A_CERTIFICATE\0"
    "PEER_ERROR_UNSUPPORTED_CERTIFICATE_TYPE\0"
    "PRE_SHARED_KEY_MUST_BE_LAST\0"
    "PRIVATE_KEY_OPERATION_FAILED\0"
    "PROTOCOL_IS_SHUTDOWN\0"
    "PSK_IDENTITY_BINDER_COUNT_MISMATCH\0"
    "PSK_IDENTITY_NOT_FOUND\0"
    "PSK_NO_CLIENT_CB\0"
    "PSK_NO_SERVER_CB\0"
    "QUIC_INTERNAL_ERROR\0"
    "QUIC_TRANSPORT_PARAMETERS_MISCONFIGURED\0"
    "READ_TIMEOUT_EXPIRED\0"
    "RECORD_LENGTH_MISMATCH\0"
    "RECORD_TOO_LARGE\0"
    "RENEGOTIATION_EMS_MISMATCH\0"
    "RENEGOTIATION_ENCODING_ERR\0"
    "RENEGOTIATION_MISMATCH\0"
    "REQUIRED_CIPHER_MISSING\0"
    "RESUMED_EMS_SESSION_WITHOUT_EMS_EXTENSION\0"
    "RESUMED_NON_EMS_SESSION_WITH_EMS_EXTENSION\0"
    "SCSV_RECEIVED_WHEN_RENEGOTIATING\0"
    "SECOND_SERVERHELLO_VERSION_MISMATCH\0"
    "SERVERHELLO_TLSEXT\0"
    "SERVER_CERT_CHANGED\0"
    "SERVER_ECHOED_INVALID_SESSION_ID\0"
    "SESSION_ID_CONTEXT_UNINITIALIZED\0"
    "SESSION_MAY_NOT_BE_CREATED\0"
    "SHUTDOWN_WHILE_IN_INIT\0"
    "SIGNATURE_ALGORITHMS_EXTENSION_SENT_BY_SERVER\0"
    "SRTP_COULD_NOT_ALLOCATE_PROFILES\0"
    "SRTP_UNKNOWN_PROTECTION_PROFILE\0"
    "SSL3_EXT_INVALID_SERVERNAME\0"
    "SSLV3_ALERT_BAD_CERTIFICATE\0"
    "SSLV3_ALERT_BAD_RECORD_MAC\0"
    "SSLV3_ALERT_CERTIFICATE_EXPIRED\0"
    "SSLV3_ALERT_CERTIFICATE_REVOKED\0"
    "SSLV3_ALERT_CERTIFICATE_UNKNOWN\0"
    "SSLV3_ALERT_CLOSE_NOTIFY\0"
    "SSLV3_ALERT_DECOMPRESSION_FAILURE\0"
    "SSLV3_ALERT_HANDSHAKE_FAILURE\0"
    "SSLV3_ALERT_ILLEGAL_PARAMETER\0"
    "SSLV3_ALERT_NO_CERTIFICATE\0"
    "SSLV3_ALERT_UNEXPECTED_MESSAGE\0"
    "SSLV3_ALERT_UNSUPPORTED_CERTIFICATE\0"
    "SSL_CTX_HAS_NO_DEFAULT_SSL_VERSION\0"
    "SSL_HANDSHAKE_FAILURE\0"
    "SSL_SESSION_ID_CONTEXT_TOO_LONG\0"
    "SSL_SESSION_ID_TOO_LONG\0"
    "TICKET_ENCRYPTION_FAILED\0"
    "TLS13_DOWNGRADE\0"
    "TLSV1_ALERT_ACCESS_DENIED\0"
    "TLSV1_ALERT_BAD_CERTIFICATE_HASH_VALUE\0"
    "TLSV1_ALERT_BAD_CERTIFICATE_STATUS_RESPONSE\0"
    "TLSV1_ALERT_CERTIFICATE_REQUIRED\0"
    "TLSV1_ALERT_CERTIFICATE_UNOBTAINABLE\0"
    "TLSV1_ALERT_DECODE_ERROR\0"
    "TLSV1_ALERT_DECRYPTION_FAILED\0"
    "TLSV1_ALERT_DECRYPT_ERROR\0"
    "TLSV1_ALERT_ECH_REQUIRED\0"
    "TLSV1_ALERT_EXPORT_RESTRICTION\0"
    "TLSV1_ALERT_INAPPROPRIATE_FALLBACK\0"
    "TLSV1_ALERT_INSUFFICIENT_SECURITY\0"
    "TLSV1_ALERT_INTERNAL_ERROR\0"
    "TLSV1_ALERT_NO_APPLICATION_PROTOCOL\0"
    "TLSV1_ALERT_NO_RENEGOTIATION\0"
    "TLSV1_ALERT_PROTOCOL_VERSION\0"
    "TLSV1_ALERT_RECORD_OVERFLOW\0"
    "TLSV1_ALERT_UNKNOWN_CA\0"
    "TLSV1_ALERT_UNKNOWN_PSK_IDENTITY\0"
    "TLSV1_ALERT_UNRECOGNIZED_NAME\0"
    "TLSV1_ALERT_UNSUPPORTED_EXTENSION\0"
    "TLSV1_ALERT_USER_CANCELLED\0"
    "TLS_PEER_DID_NOT_RESPOND_WITH_CERTIFICATE_LIST\0"
    "TLS_RSA_ENCRYPTED_VALUE_LENGTH_IS_WRONG\0"
    "TOO_MANY_EMPTY_FRAGMENTS\0"
    "TOO_MANY_KEY_UPDATES\0"
    "TOO_MANY_WARNING_ALERTS\0"
    "TOO_MUCH_READ_EARLY_DATA\0"
    "TOO_MUCH_SKIPPED_EARLY_DATA\0"
    "UNABLE_TO_FIND_ECDH_PARAMETERS\0"
    "UNCOMPRESSED_CERT_TOO_LARGE\0"
    "UNEXPECTED_COMPATIBILITY_MODE\0"
    "UNEXPECTED_EXTENSION\0"
    "UNEXPECTED_EXTENSION_ON_EARLY_DATA\0"
    "UNEXPECTED_MESSAGE\0"
    "UNEXPECTED_OPERATOR_IN_GROUP\0"
    "UNEXPECTED_RECORD\0"
    "UNKNOWN_ALERT_TYPE\0"
    "UNKNOWN_CERTIFICATE_TYPE\0"
    "UNKNOWN_CERT_COMPRESSION_ALG\0"
    "UNKNOWN_CIPHER_RETURNED\0"
    "UNKNOWN_CIPHER_TYPE\0"
    "UNKNOWN_KEY_EXCHANGE_TYPE\0"
    "UNKNOWN_PROTOCOL\0"
    "UNKNOWN_SSL_VERSION\0"
    "UNKNOWN_STATE\0"
    "UNSAFE_LEGACY_RENEGOTIATION_DISABLED\0"
    "UNSUPPORTED_COMPRESSION_ALGORITHM\0"
    "UNSUPPORTED_ECH_SERVER_CONFIG\0"
    "UNSUPPORTED_ELLIPTIC_CURVE\0"
    "UNSUPPORTED_PROTOCOL\0"
    "UNSUPPORTED_PROTOCOL_FOR_CUSTOM_KEY\0"
    "WRONG_CERTIFICATE_TYPE\0"
    "WRONG_CIPHER_RETURNED\0"
    "WRONG_CURVE\0"
    "WRONG_ENCRYPTION_LEVEL_RECEIVED\0"
    "WRONG_MESSAGE_TYPE\0"
    "WRONG_SIGNATURE_TYPE\0"
    "WRONG_SSL_VERSION\0"
    "WRONG_VERSION_NUMBER\0"
    "WRONG_VERSION_ON_EARLY_DATA\0"
    "X509_LIB\0"
    "X509_VERIFICATION_SETUP_PROBLEMS\0"
    "BAD_VALIDITY_CHECK\0"
    "DECODE_FAILURE\0"
    "INVALID_KEY_ID\0"
    "INVALID_METADATA\0"
    "INVALID_METADATA_KEY\0"
    "INVALID_PROOF\0"
    "INVALID_TOKEN\0"
    "NO_KEYS_CONFIGURED\0"
    "NO_SRR_KEY_CONFIGURED\0"
    "OVER_BATCHSIZE\0"
    "SRR_SIGNATURE_ERROR\0"
    "TOO_MANY_KEYS\0"
    "AKID_MISMATCH\0"
    "BAD_X509_FILETYPE\0"
    "BASE64_DECODE_ERROR\0"
    "CANT_CHECK_DH_KEY\0"
    "CERT_ALREADY_IN_HASH_TABLE\0"
    "CRL_ALREADY_DELTA\0"
    "CRL_VERIFY_FAILURE\0"
    "DELTA_CRL_WITHOUT_CRL_NUMBER\0"
    "IDP_MISMATCH\0"
    "INVALID_DIRECTORY\0"
    "INVALID_FIELD_FOR_VERSION\0"
    "INVALID_FIELD_NAME\0"
    "INVALID_PARAMETER\0"
    "INVALID_POLICY_EXTENSION\0"
    "INVALID_PSS_PARAMETERS\0"
    "INVALID_TRUST\0"
    "INVALID_VERSION\0"
    "ISSUER_MISMATCH\0"
    "KEY_TYPE_MISMATCH\0"
    "KEY_VALUES_MISMATCH\0"
    "LOADING_CERT_DIR\0"
    "LOADING_DEFAULTS\0"
    "NAME_TOO_LONG\0"
    "NEWER_CRL_NOT_NEWER\0"
    "NO_CERTIFICATE_FOUND\0"
    "NO_CERTIFICATE_OR_CRL_FOUND\0"
    "NO_CERT_SET_FOR_US_TO_VERIFY\0"
    "NO_CRL_FOUND\0"
    "NO_CRL_NUMBER\0"
    "PUBLIC_KEY_DECODE_ERROR\0"
    "PUBLIC_KEY_ENCODE_ERROR\0"
    "SHOULD_RETRY\0"
    "SIGNATURE_ALGORITHM_MISMATCH\0"
    "UNKNOWN_KEY_TYPE\0"
    "UNKNOWN_PURPOSE_ID\0"
    "UNKNOWN_TRUST_ID\0"
    "WRONG_LOOKUP_TYPE\0"
    "BAD_IP_ADDRESS\0"
    "BAD_OBJECT\0"
    "BN_DEC2BN_ERROR\0"
    "BN_TO_ASN1_INTEGER_ERROR\0"
    "CANNOT_FIND_FREE_FUNCTION\0"
    "DIRNAME_ERROR\0"
    "DISTPOINT_ALREADY_SET\0"
    "DUPLICATE_ZONE_ID\0"
    "ERROR_CONVERTING_ZONE\0"
    "ERROR_CREATING_EXTENSION\0"
    "ERROR_IN_EXTENSION\0"
    "EXPECTED_A_SECTION_NAME\0"
    "EXTENSION_EXISTS\0"
    "EXTENSION_NAME_ERROR\0"
    "EXTENSION_NOT_FOUND\0"
    "EXTENSION_SETTING_NOT_SUPPORTED\0"
    "EXTENSION_VALUE_ERROR\0"
    "ILLEGAL_EMPTY_EXTENSION\0"
    "ILLEGAL_HEX_DIGIT\0"
    "INCORRECT_POLICY_SYNTAX_TAG\0"
    "INVALID_BOOLEAN_STRING\0"
    "INVALID_EXTENSION_STRING\0"
    "INVALID_MULTIPLE_RDNS\0"
    "INVALID_NAME\0"
    "INVALID_NULL_ARGUMENT\0"
    "INVALID_NULL_NAME\0"
    "INVALID_NULL_VALUE\0"
    "INVALID_NUMBERS\0"
    "INVALID_OBJECT_IDENTIFIER\0"
    "INVALID_OPTION\0"
    "INVALID_POLICY_IDENTIFIER\0"
    "INVALID_PROXY_POLICY_SETTING\0"
    "INVALID_PURPOSE\0"
    "INVALID_SECTION\0"
    "INVALID_SYNTAX\0"
    "INVALID_VALUE\0"
    "ISSUER_DECODE_ERROR\0"
    "NEED_ORGANIZATION_AND_NUMBERS\0"
    "NO_CONFIG_DATABASE\0"
    "NO_ISSUER_CERTIFICATE\0"
    "NO_ISSUER_DETAILS\0"
    "NO_POLICY_IDENTIFIER\0"
    "NO_PROXY_CERT_POLICY_LANGUAGE_DEFINED\0"
    "NO_PUBLIC_KEY\0"
    "NO_SUBJECT_DETAILS\0"
    "ODD_NUMBER_OF_DIGITS\0"
    "OPERATION_NOT_DEFINED\0"
    "OTHERNAME_ERROR\0"
    "POLICY_LANGUAGE_ALREADY_DEFINED\0"
    "POLICY_PATH_LENGTH\0"
    "POLICY_PATH_LENGTH_ALREADY_DEFINED\0"
    "POLICY_WHEN_PROXY_LANGUAGE_REQUIRES_NO_POLICY\0"
    "SECTION_NOT_FOUND\0"
    "TRAILING_DATA_IN_EXTENSION\0"
    "UNABLE_TO_GET_ISSUER_DETAILS\0"
    "UNABLE_TO_GET_ISSUER_KEYID\0"
    "UNKNOWN_BIT_STRING_ARGUMENT\0"
    "UNKNOWN_EXTENSION\0"
    "UNKNOWN_EXTENSION_NAME\0"
    "UNKNOWN_OPTION\0"
    "UNSUPPORTED_OPTION\0"
    "USER_TOO_LONG\0"
    "";
