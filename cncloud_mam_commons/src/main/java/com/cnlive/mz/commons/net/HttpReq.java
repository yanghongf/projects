package com.cnlive.mz.commons.net;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.UsernamePasswordCredentials;
import org.apache.commons.httpclient.auth.AuthScope;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.log4j.Logger;

/**
 * http 请求类，用于请求各类接口
 * 
 * @author java_developer
 * 
 */
public class HttpReq {
	public static void main(String[] args) {
		//String ids = "1163823,1163824,1163520,1163521,1163512,1163511,1163113,1163112,1163110,1163111,1163107,1163106,1163105,1162614,1162611,1162246,1161705,1161698,1161265,1160431,1160428,1164811,1164523,1164521,1164519,1164517,1164518,1164516,1164514,1154672,1153956,1153955,1153692,1153366,1153365,1153091,1153090,1153089,1153088,1153087,1153086,1152774,1152773,1152772,1152400,1152403,1152399,1152182,1152181,1152180,1152178,1152051,1152050,1152049,1152047,1152048,1151805,1151804,1151794,1151791,1151568,1151565,1151564,1151562,1151569,1151326,1151200,1151199,1151161,1148168,1149603,1149600,1149560,1149479,1149520,1149443,1149509,1149395,1148355,1148684,1148362,1148287,1148255,1148180,1147402,1147364,1147332,1147289,1142669,1142670,1142996,1142222,1142247,1203998,1203541,1203492,1203471,1203273,1203225,1202965,1202645,1202644,1202318,1202208,1202075,1202060,1201960,1201933,1201922,1201877,1201606,1199590,1199589,1199588,1199587,1199586,1199240,1199239,1199238,1199236,1199237,1198831,1198832,1198830,1198829,1198822,1198821,1198818,1198820,1198819,1198828,1197242,1197241,1197240,1197232,1197231,1197230,1197239,1197187,1197186,1197185,1197108,1197102,1197099,1197100,1197105,1195408,1195409,1195305,1195303,1195304,1194186,1194184,1194185,1194183,1193360,1193130,1193129,1192639,1192636,1192637,1192096,1191677,1191391,1191390,1190960,1190959,1190102,1190101,1189791,1189203,1189202,1188833,1188832,1188294,1188293,1188288,1188287,1187931,1187681,1187402,1187403,1187265,1187243,1187240,1187237,1187236,1187235,1187233,1187232,1187231,1186528,1185947,1185948,1185945,1185944,1185943,1185292,1184801,1184800,1184799,1184798,1184797,1184491,1184490,1184489,1184487,1184486,1184485,1184484,1184488,1183257,1183256,1182415,1182414,1182412,1182410,1182281,1182280,1182279,1182278,1182277,1180526,1180524,1180018,1180016,1180013,1179544,1178525,1178523,1178522,1178027,1177767,1177766,1177765,1177763,1177764,1177587,1177586,1177585,1177156,1176404,1176405,1175996,1175552,1175323,1175322,1175320,1175321,1175319,1175318,1175317,1174027,1174026,1173727,1173397,1172837,1172834,1172832,1172833,1172543,1172515,1172514,1172193,1172180,1171785,1171775,1171231,1169878,1169726,1169519,1166966,1166965,1166963,1166964,1166960,1166961,1165825,1165822,1165821,1165820,1165028,1142432,1142074,1142136,1142201,1134561,1134545,1134515,1134442,1134421,1134416,1134410,1134398,1128025,1127173,1127171,1127368,1127370,1127657,1127668,1127747,1127748,1127799,1127800,1128012,1128263,1128286,1128501,1128547,1128761,1128763,1128765,1128883,1128882,1129104,1129106,1129396,1129592,1129807,1130052,1130049,1130096,1130247,1130260,1130283,1130345,1130346,1130373,1130396,1130532,1130680,1130906,1130804,1130887,1130831,1130979,1131035,1131046,1131051,1131240,1131439,1131512,1131692,1131798,1131846,1131902,1132799,1132814,1132878,1132964,1135525,1135771,1135825,1135874,1135875,1135882,1137838,1137844,1137872,1138121,1138147,1138187,1138254,1140156,1140093,1140109,1140120,1140174,1140185,1140203,1204045,1204267,1204269,1204327,1204580,1204725,1204726,1204831,1205037,1205038,1205089,1205530,1205539,1205671,1205672,1205757,1205969,1206117,1206189,1206190,1206191,1206192,1206748,1206749,1206750,1206755,1206824,1206825,1206864,1206865,1207068,1207069,1207070,1207071,1207072,1207375,1207399,1207376,1207377,1207378,1208301,1208302,1208303,1208304,1208305,1209938,1209940,1209617,1209618,1210343,1210364,1210698,1211068,1211069,1211070,1211071,1211072,1211088,1211208,1211209,1211210,1211211,1160455,1157845,1156523,1154017,1152319,1150837,1150816,1150424,1150186,1147396,1143678,1142789,1202672,1202045,1201740,1201656,1200214,1197743,1197097,1194696,1189102,1187892,1185270,1183216,1181755,1179574,1170809,1141480,1135229,1135226,1134073,1127236,1127364,1128638,1128669,1129644,1129977,1130576,1131747,1132414,1132900,1136019,1138537,1140241,1204089,1205846,1208011,1209488,1212119,1163839,1163485,1163109,1163108,1162613,1162612,1162245,1162244,1162243,1161659,1164873,1161264,1164868,1160997,1160987,1160958,1160805,1160429,1160137,1160136,1160003,1159991,1159892,1159891,1159890,1159851,1159849,1159830,1159784,1159756,1159755,1159677,1159678,1159676,1159675,1159659,1159658,1159657,1164810,1159595,1164802,1164778,1164776,1164769,1164749,1164669,1164654,1164648,1164647,1164645,1164634,1158133,1158078,1158052,1158053,1158046,1164520,1164515,1157775,1157774,1157717,1157700,1157692,1157685,1157647,1157600,1157533,1157525,1157452,1156515,1156514,1156516,1157444,1156451,1156430,1156431,1156396,1156342,1156098,1155975,1155974,1154673,1154249,1154205,1154021,1154090,1153961,1153962,1153960,1153958,1153821,1153774,1153767,1153755,1153745,1153513,1153512,1153489,1153487,1153092,1153420,1153419,1153415,1153413,1153378,1153396,1153380,1153312,1153227,1153226,1153195,1153174,1153165,1153140,1152933,1152912,1152910,1152903,1152890,1152401,1152402,1152179,1151889,1151784,1151702,1151696,1151678,1151661,1151593,1151567,1151566,1151563,1151201,1150963,1150869,1150736,1150593,1150592,1150591,1150590,1150589,1150487,1150485,1150478,1150477,1150475,1150303,1150278,1150236,1150225,1150223,1150219,1149879,1153481,1147644,1147242,1147243,1147200,1147116,1147096,1147095,1147088,1146979,1145934,1145894,1145784,1145584,1145558,1145549,1145540,1145542,1145453,1145449,1145446,1145257,1145573,1145609,1144956,1144880,1144843,1144842,1144805,1144804,1144754,1144753,1144752,1144751,1144743,1144744,1144722,1144728,1144707,1145610,1145619,1145617,1145616,1144330,1144329,1144282,1144270,1144269,1144267,1144266,1144242,1144233,1144232,1144189,1144057,1144016,1144017,1144001,1144000,1143999,1143998,1143997,1143480,1143144,1142906,1203914,1203913,1203912,1203911,1203910,1203909,1203908,1202624,1202623,1202571,1202250,1200753,1200752,1200751,1200749,1200748,1200747,1200620,1200580,1200434,1200195,1198803,1198802,1198800,1198801,1198126,1198127,1198124,1198125,1198128,1198129,1196285,1196284,1196282,1196277,1196276,1196274,1196275,1196273,1196261,1196147,1196148,1196146,1196145,1196144,1193378,1192638,1192097,1191386,1191329,1191328,1189916,1189915,1189914,1189209,1189210,1189205,1188993,1188292,1188291,1188289,1187934,1187933,1187932,1187682,1187400,1187398,1187238,1187239,1187234,1185946,1185293,1184802,1184493,1184492,1183581,1183580,1183579,1183578,1182444,1182413,1182411,1182234,1182233,1182232,1181947,1181936,1181935,1180525,1180523,1180522,1180017,1180015,1180010,1180011,1180008,1179543,1179542,1178143,1178026,1177157,1177158,1177155,1177154,1176406,1175995,1175900,1175883,1175878,1175863,1175551,1175534,1175533,1175530,1175529,1175528,1175527,1175250,1175251,1175249,1175248,1175247,1175219,1175216,1175215,1175161,1175159,1175157,1175150,1175148,1175145,1175140,1175138,1175133,1175122,1175121,1175114,1175113,1175028,1175029,1174668,1174589,1174521,1174519,1174520,1174518,1173998,1173997,1173996,1173995,1173993,1173994,1173992,1173990,1173989,1173988,1173872,1173873,1173874,1173875,1173792,1173726,1173701,1173698,1173659,1173658,1173657,1173398,1172831,1172585,1172584,1172582,1172583,1172578,1172577,1172576,1172575,1172574,1172257,1172253,1172252,1172251,1172179,1172034,1171699,1171232,1170676,1170321,1169732,1169731,1169728,1169517,1169355,1169350,1169334,1169113,1169112,1169111,1168972,1168970,1168971,1168975,1168976,1168977,1168810,1168808,1168809,1168659,1168491,1168490,1168489,1168370,1168173,1168172,1168171,1167627,1167626,1167624,1167540,1167537,1167231,1167230,1167229,1167135,1167136,1167131,1167130,1167129,1167128,1167127,1167115,1166962,1166748,1166749,1166683,1166682,1166681,1166680,1166675,1166674,1166673,1166669,1166643,1166642,1166641,1166638,1166579,1166571,1166456,1165824,1165174,1135106,1140657,1140944,1140942,1142072,1133858,1134532,1134224,1133902,1133817,1133834,1133752,1134897,1128047,1127065,1127288,1127312,1127651,1127669,1127713,1127766,1127833,1127843,1127855,1127863,1127932,1128008,1128242,1128478,1128747,1128811,1129087,1129409,1129331,1129384,1129382,1129388,1129449,1129462,1129542,1129792,1129897,1129906,1130053,1130089,1130090,1130167,1130176,1130177,1130178,1130179,1130180,1130182,1130183,1130258,1130308,1130319,1130438,1130577,1130592,1130591,1130593,1130716,1130799,1130800,1130886,1130881,1130976,1131234,1131235,1131289,1131297,1131307,1131315,1131316,1131317,1131449,1131460,1131495,1131505,1131508,1131510,1131515,1131539,1131544,1131559,1131564,1131577,1131582,1131592,1131625,1131628,1131630,1131676,1131706,1131730,1131741,1131766,1131799,1131804,1131829,1131843,1131847,1131849,1131934,1131943,1131948,1132038,1132056,1132084,1132275,1132375,1132428,1132446,1132485,1132636,1132729,1132779,1132801,1132839,1132849,1132847,1132860,1132977,1132989,1132996,1132998,1133033,1133045,1133073,1133378,1133395,1133502,1133516,1133565,1133697,1133692,1133696,1135421,1135467,1135475,1135880,1135898,1136410,1136608,1136774,1137582,1138140,1138809,1139079,1139491,1139943,1139944,1140054,1140055,1140056,1140057,1140064,1140065,1140091,1204196,1205157,1205158,1205159,1205160,1205266,1205267,1205264,1205265,1205268,1205825,1205826,1205827,1205828,1205829,1205830,1206267,1208529,1208544,1208672,1208673,1208715,1208768,1208801,1208802,1208803,1208847,1208856,1208942,1208997,1208998,1208999,1209000,1209021,1209050,1209051,1209052,1210925,1209576,1209973,1210011,1210012,1210107,1210108,1210290,1210292,1210440,1210434,1210468,1210557,1210723,1210745,1210802,1210804,1210722,1210754,1210807,1210853,1210941,1210993,1210991,1211153,1211155,1211156,1211160,1211403,1211404,1212190,1212451,1212692,1212777,1212839,1212838,1212840,1212841,1212842,1212843,1212870,1212868,1212871,1212915,1212916,1212917,1212918,1163559,1161818,1161735,1161707,1160846,1159768,1156506,1156167,1156105,1153069,1152857,1152518,1152100,1151738,1151480,1148829,1143625,1143435,1143012,1142961,1142788,1203591,1203359,1202927,1202627,1202626,1202572,1202217,1201978,1201543,1201542,1201003,1200581,1200395,1200093,1200071,1199769,1199580,1199579,1198990,1198989,1198988,1197517,1197018,1197017,1196435,1196208,1195553,1195412,1195221,1191563,1190601,1187976,1187699,1187273,1187151,1185117,1183751,1183714,1183547,1183325,1182011,1181834,1181709,1181471,1180854,1165205,1164933,1142483,1141596,1140978,1142143,1134736,1134901,1127246,1127234,1127247,1127248,1127250,1127251,1127252,1127253,1128190,1129030,1129208,1129228,1129245,1129693,1129803,1129904,1129973,1129987,1130330,1130771,1132071,1132098,1133054,1133096,1133441,1133499,1133562,1136224,1136393,1138826,1138992,1204260,1204694,1204785,1205703,1206184,1206418,1207017,1207121,1208434,1208646,1208700,1208903,1209719,1211485,1211731,1212191,1212574,1212573,1161621,1156492,1155759,1155539,1154993,1149599,1149515,1183268,1182863,1182702,1182015,1178142,1178141,1177817,1176857,1141639,1128921,1129017,1129029,1130366,1130522,1135593,1135720,1135748,1135827,1138629,1139381,1140335,1162682,1162642,1162643,1161793,1161714,1161629,1161002,1160896,1160893,1160810,1159721,1158633,1158071,1159747,1159767,1154351,1154182,1154149,1154078,1154067,1152296,1152220,1152188,1152183,1151594,1151062,1150647,1150371,1150263,1149773,1149691,1147649,1143475,1143287,1143263,1143209,1142974,1203942,1203895,1203112,1202959,1202958,1202957,1202237,1202236,1202235,1202234,1202232,1202033,1201821,1201747,1201012,1200990,1200989,1200428,1200427,1200379,1200378,1200377,1200114,1200075,1200072,1200070,1200066,1199775,1199760,1199759,1199757,1199758,1199756,1199751,1199558,1199538,1199518,1199423,1199376,1199026,1198992,1198625,1198576,1198575,1198559,1198554,1198533,1198523,1198391,1198357,1197918,1197891,1197890,1197889,1197888,1197863,1197722,1197720,1196977,1196951,1198583,1196852,1196683,1196644,1196499,1196402,1196283,1196207,1196206,1196204,1195563,1195555,1195556,1195554,1194982,1194950,1194921,1194872,1194706,1194705,1194249,1194203,1194147,1194124,1193379,1193368,1193361,1192696,1192692,1192163,1192145,1192128,1191698,1191697,1191696,1191325,1190689,1190703,1190604,1190522,1190520,1189628,1188981,1188938,1188937,1188931,1187401,1187399,1187394,1186625,1186621,1186605,1186566,1186547,1185186,1185185,1184532,1184517,1184525,1183801,1183799,1183673,1183617,1182836,1182802,1182801,1182427,1182472,1182013,1181748,1181747,1180846,1180817,1180784,1180806,1180735,1180708,1178370,1178254,1178136,1178135,1178106,1177773,1177737,1177733,1176750,1176744,1176706,1171321,1171320,1171298,1171047,1170190,1170171,1170170,1170169,1170115,1170114,1170113,1170112,1169969,1169968,1169967,1169966,1169965,1169964,1169904,1169903,1169902,1169851,1169849,1169850,1169750,1169749,1169748,1169575,1169574,1169573,1169358,1169357,1169356,1169077,1169076,1168890,1168760,1168759,1168695,1142539,1134623,1134626,1134634,1133812,1133835,1133839,1127083,1127093,1127462,1127471,1127479,1128167,1128187,1128249,1128656,1128647,1128820,1129264,1129273,1130475,1130510,1130526,1131736,1131212,1131214,1131274,1131232,1131567,1131573,1131619,1132086,1132094,1132297,1132842,1132844,1132859,1135576,1135586,1135592,1136488,1136530,1137639,1137829,1137816,1138506,1138842,1140326,1140336,1140355,1140432,1204144,1204384,1204385,1204386,1204933,1204938,1205391,1205510,1205511,1205592,1205628,1205701,1207891,1207975,1208050,1208065,1208074,1208081,1208146,1209304,1209346,1209629,1209630,1209631,1209686,1211694,1163583,1161367,1160816,1160845,1160755,1159007,1158634,1158717,1156099,1156019,1156017,1155938,1155444,1155268,1155220,1155186,1155001,1154952,1152881,1152868,1152840,1152789,1152782,1152619,1152142,1151937,1151925,1151898,1151750,1151689,1151271,1151234,1151207,1151132,1151096,1151095,1150187,1150176,1150133,1150041,1148203,1149972,1149805,1148882,1148830,1148769,1148356,1148103,1142993,1142799,1142250,1142251,1203537,1203393,1203328,1203428,1202246,1202024,1201932,1201959,1201526,1201019,1200480,1200457,1199716,1199600,1199595,1199594,1199591,1198334,1198333,1198264,1198241,1197803,1197596,1196287,1196278,1195389,1195261,1195325,1194690,1194623,1191767,1191765,1191558,1191465,1189568,1189529,1187165,1187139,1184780,1184365,1183677,1183396,1183066,1183036,1182772,1182715,1182471,1182442,1182407,1181672,1181476,1180609,1180506,1177391,1177389,1171014,1170908,1142401,1141410,1141519,1135116,1140672,1140751,1141026,1140728,1140740,1141061,1141091,1142159,1142164,1142203,1134084,1134070,1133735,1133738,1134758,1134859,1134814,1135018,1134989,1134926,1127051,1127138,1127274,1127954,1127978,1128192,1128301,1128323,1129517,1129614,1129630,1129705,1129711,1129857,1131135,1131170,1131206,1131213,1131269,1131288,1131848,1131958,1131991,1132097,1132110,1132291,1132341,1132424,1132443,1133522,1133698,1136364,1136424,1136497,1136506,1136526,1136622,1136628,1138988,1138827,1139109,1139195,1139355,1139409,1139411,1139592,1139678,1204686,1204784,1204940,1206125,1206149,1206171,1206223,1206243,1206244,1207267,1207334,1207341,1208393,1208443,1208699,1208945,1208985,1210538,1210862,1210881,1212172,1212293,1212438,1212602,1212611,1161370,1161369,1161257,1161256,1160503,1160266,1160208,1160150,1160114,1159321,1159323,1159320,1159318,1159319,1159042,1159043,1159041,1159039,1159040,1158664,1158663,1158662,1158661,1158665,1158666,1157518,1157517,1157516,1157515,1156375,1156351,1156349,1156348,1155962,1155961,1155960,1155959,1154789,1155265,1155264,1155263,1155262,1154862,1154793,1154764,1154321,1154266,1154265,1154264,1153319,1153318,1153317,1153316,1153179,1153178,1153177,1153176,1152787,1152785,1152786,1152784,1152454,1152455,1152456,1152457,1152298,1152156,1152155,1152154,1151066,1151067,1151823,1151821,1151822,1151818,1151819,1151820,1151065,1150929,1150928,1150927,1150679,1150678,1150677,1150259,1150076,1150067,1150066,1149880,1149642,1149320,1148602,1148078,1146978,1145291,1144809,1145681,1144328,1144327,1144050,1144048,1143484,1143482,1143481,1143145,1143134,1142914,1203401,1203400,1203427,1203163,1203085,1203002,1202818,1202817,1202816,1202764,1202762,1202291,1202266,1202034,1202032,1202071,1201819,1201820,1201618,1201619,1201617,1201616,1201171,1201170,1201109,1201108,1201107,1201027,1201009,1200973,1200563,1200562,1200561,1200479,1200478,1200477,1200329,1200326,1200321,1200175,1200174,1200176,1199787,1199774,1199419,1199392,1199201,1199167,1199109,1199104,1199153,1199152,1198956,1198954,1198642,1198416,1198362,1198234,1198233,1198235,1198118,1197915,1197859,1197821,1197699,1197691,1197607,1197605,1197603,1197514,1197505,1197453,1197334,1197025,1196955,1196494,1196474,1196405,1196403,1196080,1196079,1196022,1195989,1195983,1195873,1195874,1195391,1195212,1195211,1195210,1195324,1195390,1195070,1195035,1195036,1194988,1194983,1194894,1194893,1194891,1194699,1194698,1194271,1194220,1194166,1194137,1193961,1193788,1193787,1192657,1192118,1192095,1191141,1191140,1190498,1189869,1189847,1189841,1189823,1189819,1189575,1189570,1189548,1189547,1189407,1189275,1189235,1189164,1189163,1189058,1189018,1188967,1188900,1187977,1187803,1187802,1187786,1187785,1187784,1187783,1187698,1187416,1186665,1186614,1185330,1184824,1184538,1184536,1183658,1183657,1183017,1183018,1180605,1180604,1180603,1180602,1180601,1180533,1180532,1180531,1180183,1180182,1177854,1177853,1177849,1177846,1177844,1177841,1177687,1177397,1177396,1177395,1177394,1177393,1176782,1176781,1176627,1176626,1171466,1171465,1171261,1171259,1171260,1170675,1170674,1170673,1170672,1170320,1170319,1170318,1170316,1170317,1170130,1170129,1170040,1169879,1169877,1169876,1169875,1169857,1169832,1169833,1169834,1169835,1169733,1169730,1169729,1169727,1169518,1169516,1169514,1169515,1169269,1169268,1169267,1169266,1169078,1168891,1168889,1168663,1168662,1168661,1168660,1142488,1142487,1141414,1141417,1135109,1140941,1142067,1142068,1134693,1134530,1134343,1134340,1134339,1134312,1134310,1133966,1134896,1127069,1127287,1127648,1127655,1127712,1127745,1127768,1127996,1128239,1128248,1128473,1128748,1128760,1128796,1129076,1129339,1129597,1129667,1129689,1129800,1129879,1130040,1130103,1130256,1130454,1130455,1130713,1130712,1130749,1130755,1130977,1131142,1131238,1131440,1131694,1131889,1132215,1132635,1132726,1132755,1132758,1132990,1133369,1133685,1135464,1135465,1135466,1135468,1135714,1136002,1136226,1136230,1136408,1137516,1137513,1137514,1138154,1138648,1139082,1140564,1140565,1140077,1140092,1140304,1204006,1204077,1204078,1204079,1204797,1204799,1205473,1205477,1205480,1205501,1205505,1205727,1205748,1205749,1205837,1205965,1206021,1206623,1206622,1207029,1206998,1207115,1207932,1207933,1207934,1207936,1207938,1208046,1208047,1208049,1208147,1208148,1208149,1208150,1208151,1208243,1208281,1208314,1208329,1208330,1208556,1208448,1208450,1208705,1208706,1209318,1209343,1209363,1209361,1209444,1209445,1209446,1209447,1210336,1210338,1210339,1211341,1211342,1211343,1211700,1211695,1211696,1211699,1212467,1212463,1212461,1212462,1212465,1212468,1212469,1212609,1212691";
		//String  ids="1163671,1163476,1163387,1162349,1161960,1161959,1161958,1161957,1161956,1161955,1161952,1161953,1161951,1161950,1161949,1161904,1161903,1161902,1161901,1161900,1161899,1161898,1161897,1161896,1161894,1161893,1161892,1161846,1161688,1161354,1161954,1164444,1164443,1164442,1164441,1164440,1164439,1164378,1164377,1164376,1164374,1164375,1164262,1164261,1164260,1164258,1164259,1164257,1164256,1164255,1164253,1164252,1164251,1164249,1164250,1157426,1157425,1157424,1157422,1157423,1157421,1156763,1156762,1156761,1156760,1156759,1156758,1156757,1156756,1156724,1156573,1156559,1156547,1156546,1156126,1153271,1153270,1153269,1153268,1153267,1153266,1153265,1153264,1152730,1152009,1152008,1152007,1152006,1152005,1152004,1151964,1151962,1151961,1151526,1164028,1164027,1149156,1149155,1149154,1149153,1149151,1149152,1148992,1148991,1148846,1148820,1144074,1143909,1143894,1143895,1143892,1143893,1143891,1143878,1143817,1143804,1143462,1143339,1165211,1148608,1134235,1134234,1134233,1134223,1134222,1134219,1134218,1134216,1134217,1134100,1134071,1134069,1135331,1135332,1135333,1135420,1135422,1135425,1135426,1135427,1135428,328795,328802,328816,328879,328959,328994,329046,1169065,1169044,1167233,420477,421171,429497,439555,447424,1060601,1060602,1205255,1161908,1161895,1161774,1158693,1157722,1156781,1156764,1152026,1149299,1149236,1146016,1145553,1134470,1134267,1135414,1135415,1135416,1135417,1135463,1135470,1157524,1157450,1151963,1148640,1133864,1134215,1134214,1134212,1134213,1134211,1134210,1134209,1134208,1134207,1134206,1134205,1134203,1134202,1134201,1134200,1133901,1133892,1134122,1134121,1134120,1134118,1134119,1134116,1134115,1134114,1134112,1134113,1134002,1133991,1133842";
		//String url = "http://mz.cnlive.com/dow";
		//String urla = HttpReq.postRequestWidthResult(url, new NameValuePair[] { new NameValuePair("ids", ids) });
		//System.out.println(urla);
		String url1 = "https://mobile.cnlive.com/CnliveMobile/hd/applyChatRoomId.action?mediaId=1=&title=聊天&sid=11111";
		String urlaa = HttpReq.getRequestWidthResult(url1);
		System.out.println(urlaa);
	}

	private static  Logger log = Logger.getLogger("httpreq");
	private static void xLog(String... str) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < str.length; i++) {
			sb.append(str[i]);
			sb.append("|");
		}
		log.info(sb.toString());
	}
	private static int TIMEOUT = 22000;

	public static boolean downloadFile(String url, File file) {
		HttpClient client = new HttpClient();
		client.getHttpConnectionManager().getParams().setConnectionTimeout(22000);
		client.getHttpConnectionManager().getParams().setSoTimeout(30000);
		GetMethod httpGet = new GetMethod(url);
		boolean flag = false;
		try {
			int code = client.executeMethod(httpGet);
			if (code == 404 || code == 500) {
				System.out.println("404_" + url);
			} else {
				InputStream in = httpGet.getResponseBodyAsStream();
				FileOutputStream out = new FileOutputStream(file);
				byte[] b = new byte[1024];
				int len = 0;
				while ((len = in.read(b)) != -1) {
					out.write(b, 0, len);
				}
				in.close();
				out.close();
				flag = true;
			}
		} catch (HttpException e) {
			e.printStackTrace();
			xLog(url,e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			xLog(url,e.getMessage());
		} finally {
			httpGet.releaseConnection();
		}
		return flag;
	}
	
	
	public static String getRequestWidthResult(String url) {
		String response = "";
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT);
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(TIMEOUT);
		GetMethod get = new GetMethod(url);
		try {
			int code = httpClient.executeMethod(get);
			response = get.getResponseBodyAsString();
			return response;
		} catch (HttpException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
			return "";
		} catch (IOException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
			return "";
		}
	}

	public static int getRequest(String url) {
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT);
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(TIMEOUT);
		GetMethod get = new GetMethod(url);
		try {
			int code = httpClient.executeMethod(get);
			return code;
		} catch (HttpException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
			return 500;
		} catch (IOException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
			return 500;
		}
	}

	public static int postRequest(String url, NameValuePair[] param) {
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT);
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(TIMEOUT);
		PostMethod method = new PostMethod(url);
		method.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=gbk");
		// NameValuePair[] param = { new NameValuePair("age", "11"), new
		// NameValuePair("name", "jay"), };
		method.setRequestBody(param);
		int statusCode = 0;
		try {
			statusCode = httpClient.executeMethod(method);
			method.releaseConnection();
			return statusCode;
		} catch (HttpException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
			return 500;
		} catch (IOException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
			return 500;
		}
	}

	public static String postRequestWidthResult(String url, NameValuePair[] param) {
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT);
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(TIMEOUT);
		PostMethod method = new PostMethod(url);
		method.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
		method.setRequestBody(param);
		String response = "-1";
		try {
			int statusCode = httpClient.executeMethod(method);
			System.out.println("statusCode:"+statusCode);
			response = method.getResponseBodyAsString();
			method.releaseConnection();
		} catch (HttpException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

	public static String postRequestWidthResult(String url, String paramName, String json) {
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT);
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(TIMEOUT);
		PostMethod method = new PostMethod(url);
		NameValuePair[] param = { new NameValuePair(paramName, json) };
		method.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
		method.setRequestBody(param);
		String response = "-1";
		try {
			int statusCode = httpClient.executeMethod(method);
			response = method.getResponseBodyAsString();
			System.out.println("执行结果：" + response);
			method.releaseConnection();
		} catch (HttpException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
		}
		return response;
	}

	public static String postJsonWidthResult(String url, String jsonObj) {
		String resStr = null;
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT);
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(TIMEOUT);
		PostMethod postMethod = new PostMethod(url);
		postMethod.addRequestHeader("Content-Type", "application/json");
		postMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
		postMethod.setRequestBody(jsonObj);
		try {
			int statusCode = httpClient.executeMethod(postMethod);
			if (statusCode != HttpStatus.SC_OK) {
				// post和put不能自动处理转发 301：永久重定向，告诉客户端以后应从新地址访问 302：Moved
				if (statusCode == HttpStatus.SC_MOVED_PERMANENTLY || statusCode == HttpStatus.SC_MOVED_TEMPORARILY) {
					Header locationHeader = postMethod.getResponseHeader("location");
					String location = null;
					if (locationHeader != null) {
						location = locationHeader.getValue();
						System.out.println("执行结果：The page was redirected to :" + location);
					} else {
						System.out.println("执行结果：Location field value is null");
					}
				} else {
					System.out.println("执行结果：Method failed: " + postMethod.getStatusLine());
				}
				return resStr;
			}
			byte[] responseBody = postMethod.getResponseBody();
			resStr = new String(responseBody, "UTF-8");
		} catch (Exception e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
		} finally {
			postMethod.releaseConnection();
		}
		return resStr;
	}

	public static String urlPostMethod(String url, String params) {
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT);
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(TIMEOUT);
		PostMethod method = new PostMethod(url);
		try {
			if (params != null && !params.trim().equals("")) {
				RequestEntity requestEntity = new StringRequestEntity(params, "application/json", "UTF-8");
				method.setRequestEntity(requestEntity);
			}
			method.releaseConnection();
			httpClient.executeMethod(method);
			String responses = method.getResponseBodyAsString();
			System.out.println(responses);
			return responses;
		} catch (HttpException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	// get http status with authentication
	public static Object[] getStatusAndResponseWithAuth(String host, int port, String realm, String username,
			String password, String url) {
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(TIMEOUT);
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(TIMEOUT);
		Object[] rs = new Object[2];
		httpClient.getState().setCredentials(new AuthScope(host, port, realm),
				new UsernamePasswordCredentials(username, password));
		GetMethod get = new GetMethod(url);
		get.setDoAuthentication(true);
		try {
			int status = httpClient.executeMethod(get);
			rs[0] = status;
			rs[1] = get.getResponseBodyAsString();
			return rs;
		} catch (HttpException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			xLog(url,e.getMessage());
			e.printStackTrace();
		} finally {
			get.releaseConnection();
		}
		return null;
	}

}