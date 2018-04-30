DROP DATABASE IF EXISTS IEM_WBB;

CREATE DATABASE IEM_WBB;

\c iem_wbb

CREATE EXTENSION pgcrypto;

CREATE TABLE users(id SERIAL UNIQUE, name TEXT, username TEXT PRIMARY KEY NOT NULL, password TEXT NOT NULL, email TEXT, is_adm BOOLEAN);
CREATE TABLE pacients(id SERIAL PRIMARY KEY, name TEXT, sex VARCHAR(10), age SMALLINT, height REAL, weight REAL, imc REAL);
CREATE TABLE exams(id SERIAL PRIMARY KEY, APs REAL[], MLs REAL[], DATE TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(), pac_id INT REFERENCES pacients(id), usr_id INT REFERENCES users(id));
CREATE TABLE devices(id SERIAL PRIMARY KEY, name VARCHAR(50), mac MACADDR, calibrations REAL[][],  is_default BOOLEAN);

BEGIN;
INSERT INTO users (name, username, password, email, is_adm)  VALUES ('Raí Sales Pereira Bizerra', 'rspbizerra', crypt('rspbizerra', gen_salt('md5')), 'raispbizerra@gmail.com', TRUE);
INSERT INTO users (name, username, password, email, is_adm)  VALUES ('Tulio Campos Silva', 'tulio', crypt('tulio123', gen_salt('md5')), 'tuliocampossilva@gmail.com', TRUE);
INSERT INTO devices (name, mac, calibrations, is_default) VALUES ('WBB_ESBEL', '00:26:59:DD:0A:6F', '{{2319.0,4249.2863977227562,6123.3200972029945},{3005.0,4932.535439819314,6894.5571308433591},{4161.0,6082.8245392950312,7974.3120731868639},{4039.0,6051.2591790830556,8075.457648501033}}', TRUE);
INSERT INTO devices (name, mac, calibrations, is_default) VALUES ('WBB_DEV', '00:22:4C:56:D3:F4', '{{5129.0, 7000.2527202635247, 8673.753146324183}, {19824.0, 21776.951434339429, 23546.832586428671}, {2371.0, 4268.7978532247189, 5983.5125723310794}, {17340.0, 19136.878015404596, 20761.645463499703}}', FALSE);
INSERT INTO devices (name, mac, calibrations, is_default) VALUES ('WBB_MARCILIO', '00:27:09:AC:29:22', '{{2102.0, 4173.1762879192102, 6065.9466094891877}, {17636.0, 19646.752585149894, 21507.435263858712}, {3489.0, 5645.9277938923897, 7557.2111156541741}, {5117.0, 7131.6583850439183, 8917.499063485433}}', FALSE);
INSERT INTO pacients (name, sex, age, height) VALUES ('Raí Bizerra', 'Masculino', '23', '1.86');
INSERT INTO exams (APS, MLS, DATE, PAC_ID, USR_ID) VALUES ('{-0.817746540060671,-0.561589930373829,-0.535569893975268,-0.535345511851997,-0.537444659421712,-0.533181685472251,-0.521887436603772,-0.514220156199652,-0.493145961055323,-0.474873602684841,-0.456185508372563,-0.433541920838501,-0.421709653844238,-0.412413202543177,-0.405156563368552,-0.398545715491685,-0.377943130650482,-0.360562401942755,-0.335231873007057,-0.330097336626347,-0.305382898053503,-0.280545684056964,-0.230243123181910,-0.230922328467745,-0.249386018359686,-0.266183799842718,-0.269631128716678,-0.282474524640657,-0.294188040555155,-0.326268742999492,-0.348810229562834,-0.363758416405867,-0.374258460983005,-0.383027762406165,-0.379158132222173,-0.377813763788244,-0.375508562958033,-0.373252749177432,-0.373388755777888,-0.370446869314712,-0.367386553058659,-0.367070991009015,-0.366952278216298,-0.365096397228868,-0.362163702594840,-0.355440776647424,-0.354304647639945,-0.349635793875702,-0.344879991070691,-0.334900032741579,-0.321137461308598,-0.313600437666742,-0.298922050746525,-0.287492628523450,-0.275756735501050,-0.269376792027952,-0.258224470661161,-0.253687752156398,-0.244933874125031,-0.243469453770326,-0.241696837795682,-0.239883088755147,-0.240651462942022,-0.236643601904384,-0.231541553786817,-0.233777373984421,-0.233282634314769,-0.232317739515452,-0.232448353392182,-0.230747796816310,-0.224265383453273,-0.221650966871192,-0.211545210901440,-0.194293799070393,-0.181931441082463,-0.159084968703561,-0.137093668748829,-0.099873719540046,-0.077760378220422,-0.053533783764385,-0.047336443648082,-0.033222760491533,-0.023895160611565,-0.025251567830182,-0.029155425757288,-0.034269861743170,-0.037533096829378,-0.037224954871856,-0.031996292547867,-0.031526148069906,-0.027575969363100,-0.025959301337917,-0.023021309905272,-0.026108630996254,-0.027848027472731,-0.032546764603662,-0.035018075725360,-0.048570241780002,-0.058520741087315,-0.069620002633767,-0.077852497833626,-0.092875265977938,-0.098767023206122,-0.106938847935278,-0.110126671855562,-0.115876245057961,-0.124544293366378,-0.129530261142744,-0.133226230341660,-0.133600751736631,-0.130312010520597,-0.132957167489758,-0.134311093776800,-0.139864517724316,-0.147594938088438,-0.155144435547764,-0.160587719621061,-0.158357457339748,-0.157209388734403,-0.149640276556796,-0.145656648719580,-0.145684705909286,-0.143922808146613,-0.144726561345393,-0.148399274421301,-0.155471725134916,-0.158973095506259,-0.173221023049836,-0.185764116811786,-0.194217851330863,-0.209850338945377,-0.208820225363672,-0.216453398598956,-0.221340782213989,-0.225191099606412,-0.219644296984186,-0.186130922158625,-0.113368929092101,0.019102308374184,0.127453657819021,0.216688796244948,0.332521071315769,0.380941854951424,0.435438265852810,0.469512882840868,0.485579708464817,0.482556048247918,0.418534733862421,0.316580250196437,0.209556389182776,0.095109047889265,0.059805320003342,-0.119557266613455,-0.178135923768678,-0.223828867669672,-0.253732999651399,-0.292433006460831,-0.303850462792070,-0.310291950910126,-0.306794045137380,-0.306929776861553,-0.312258181772011,-0.297426416812286,-0.309618096401386,-0.320465462400537,-0.316556974188346,-0.312383390806698,-0.303928590379426,-0.256499965386786,-0.251296159910127,-0.234081791722685,-0.205508961271827,-0.199728119972056,-0.193533776687914,-0.190555281153702,-0.189127801018418,-0.177208352999825,-0.160609658159926,-0.143052455575294,-0.134396620996966,-0.118985226223593,-0.114133088502548,-0.103455385589377,-0.099557992763695,-0.098301986892032,-0.100413373565458,-0.105612899637512,-0.101108631883210,-0.101943039055665,-0.101849726716592,-0.104984654597154,-0.103772736560324,-0.109418175053621,-0.115690115194823,-0.125503489562121,-0.150408896660098,-0.178107080643502,-0.219011697142951,-0.228271973394018,-0.264023386126421,-0.275375154042009,-0.277241182923345,-0.270880217261153,-0.265332759214773,-0.249233066229953,-0.235667410332234,-0.212705161344943,-0.191715111889512,-0.166865602764528,-0.152817884637889,-0.140207260438022,-0.134524905275929,-0.132767461120146,-0.128676229155286,-0.130007903215551,-0.124853329144658,-0.130487990891817,-0.131444632184681,-0.130684870618207,-0.135355461279008,-0.137757286412073,-0.145498479312510,-0.150600992556733,-0.156800724585793,-0.154427685511151,-0.156582796067642,-0.154677214028797,-0.157418979340718,-0.160128764526373,-0.158675557276721,-0.154227569670119,-0.152201692417877,-0.149025034093356,-0.142725838798320,-0.142319487317787,-0.140513918124519,-0.139100300760963,-0.136259753853486,-0.137632121051434,-0.135312657486876,-0.133305482842339,-0.135281481858532,-0.137042241861798,-0.133903299891651,-0.129829897536509,-0.129767433216909,-0.130570321548188,-0.132203238652383,-0.134238265224991,-0.144443970340694,-0.150501399529933,-0.147674929309217,-0.144613177950891,-0.150501310450950,-0.148185304042271,-0.149285228523725,-0.146112325201054,-0.148392417181794,-0.145840744152780,-0.142739595788390,-0.140503904782377,-0.143578614058160,-0.141727757468815,-0.140312780030118,-0.139704301171928,-0.138839005078610,-0.137813725615417,-0.136247174284380,-0.131525749708011,-0.131554674462694,-0.130564345839971,-0.129892577504496,-0.130323093724617,-0.130202015610901,-0.132641926385915,-0.128631690437587,-0.131444296593951,-0.129079964733982,-0.124465624568006,-0.125656364475664,-0.129176549867712,-0.129246717169291,-0.130790310914646,-0.128310557720567,-0.132700183721747,-0.136899321819498,-0.141502853799115,-0.144427172925254,-0.150289128077577,-0.155251101003452,-0.160950140629437,-0.164369362164761,-0.169720234487043,-0.176054256912565,-0.175277362284834,-0.177982766289324,-0.181349307373584,-0.181890676526351,-0.182087678686018,-0.184810370195786,-0.187269669502538,-0.189831790790488,-0.195928771603405,-0.195255898451341,-0.203418252645672,-0.206482870765298,-0.212830253017096,-0.214989334110880,-0.214341446280123,-0.210903884688031,-0.210217895572285,-0.214082308313204,-0.212287736769294,-0.209365164907529,-0.205889201059107,-0.199814284133389,-0.197703997797867,-0.194862338834112,-0.189758064174722,-0.188958452105185,-0.186568566401651,-0.180989757928512,-0.180383396529000,-0.180319648460012,-0.173980946997210,-0.166234925969936,-0.164731213617390,-0.163202329882423,-0.162218536640065,-0.157253120009579,-0.157390173910852,-0.156599404628201,-0.149682693911688,-0.146795837743527,-0.147274510118039,-0.142654910742539,-0.144695442129551,-0.144788700325359,-0.142396128189727,-0.140676765500826,-0.140568404340675,-0.139045065567122,-0.141422138430105,-0.144993819556161,-0.141463076699858,-0.145016075027748,-0.144594421942704,-0.142120012118596,-0.141275284681319,-0.143778434807407,-0.143215689093808,-0.144456066085390,-0.147255218850765,-0.148184598783727,-0.144709502214897,-0.150610308627296,-0.151089875744792,-0.151915379647475,-0.155016123384604,-0.154467152172902,-0.158820665391734,-0.157399976410170,-0.160892596296627,-0.161297719460685,-0.165663482359476,-0.167103294890407,-0.168915738814778,-0.171348252443700,-0.171770774398053,-0.168631543518438,-0.169248406727432,-0.170379351638258,-0.171106756932641,-0.168901317666217,-0.167618786921874,-0.171221689165239,-0.169793741610911,-0.168365664926446,-0.167424509598061,-0.170389082364465,-0.172525862493213,-0.172483257539102,-0.174604561521999,-0.172196404949274,-0.172443574035903,-0.172968216213026,-0.175720152559039,-0.177602127750265,-0.181818344673778,-0.182119075344926,-0.183633830892140,-0.185523837847997,-0.186665893418162,-0.185230535803050,-0.183976899807646,-0.182127722716239,-0.178277402557085,-0.178287395775330,-0.172590196983722,-0.171801659904037,-0.171929008088294,-0.171071655110071,-0.170292837163297,-0.173724665849953,-0.171272570486188,-0.166786412944651,-0.166975244706834,-0.169238478522081,-0.163272201796567,-0.160599044233686,-0.160135125377570,-0.160349768539910,-0.159566418762746,-0.152631201756973,-0.152958389872804,-0.148892144512196,-0.147888818208484,-0.147838455607739,-0.145850628866148,-0.141694018051976,-0.139395964183697,-0.137556862206041,-0.136027560676706,-0.134413759571196,-0.135376570216642,-0.132603241533137,-0.129587547764553,-0.127529145422861,-0.126190205937471,-0.123664015168897,-0.124325249225003,-0.121168855125465,-0.120586079322627,-0.117881051232519,-0.121638635824860,-0.117915683662595,-0.115006793659927,-0.114562428922194,-0.116101780859889,-0.115855129220429,-0.119325849758312,-0.116825204956391,-0.125364608697493,-0.122037115668776,-0.120929304782487,-0.123173628152640,-0.123884258649418,-0.126921522835936,-0.134700471496807,-0.137796280565739,-0.142392307204665,-0.144134358298807,-0.142761309569367,-0.145992101964365,-0.148832549224598,-0.147496056157619,-0.152086380709877,-0.151113384543391,-0.156215025058554,-0.159860245050217,-0.164218178677294,-0.164655296820274,-0.167850144583972,-0.166833271079852,-0.166834731045199,-0.161453840120637,-0.159823816163146,-0.157492840846926,-0.156403174172481,-0.154978155333576,-0.153637681944896,-0.148079519610094,-0.149898136820474,-0.142522205559992,-0.142880464162837,-0.142392441828490,-0.145008457670807,-0.144353375249309,-0.150869798888930,-0.148700251200513,-0.149871643820442,-0.151676446407975,-0.148563973650654,-0.146576208878568,-0.145227329935822,-0.145349530297788,-0.144451605873805,-0.139998683736304,-0.142008976866586,-0.142835268363108,-0.142000694892481,-0.141912194976982,-0.141054832066031,-0.140083929700184,-0.141558111785441,-0.142681327307921,-0.142874559632093,-0.142308792346947,-0.141091731544966,-0.141743483606449,-0.140176600494156,-0.140139114401998,-0.146778173206345,-0.148024483919315,-0.150481887816916,-0.152654207763737,-0.156573505594175,-0.160775907005358,-0.160569522686418,-0.157381204748211,-0.162834415554850,-0.168671105982578,-0.170695146069275,-0.170302080349586,-0.168055628073236,-0.171624011876373,-0.180187221664544,-0.181856072554108,-0.184369782560994,-0.180366499619049,-0.183721033328922,-0.181892118387761,-0.186073686624805,-0.186175450531345,-0.178241886182299,-0.173211806318877,-0.167992223193575,-0.173049668036738,-0.176278023158783,-0.185438416771187,-0.191346628643604,-0.187475334389327,-0.185744417664419,-0.185348303032880,-0.183509287336069,-0.178290549653878,-0.179142017461200,-0.183116643197485,-0.187681447797912,-0.186621628442236,-0.189372897606113,-0.193877837127723,-0.196008770048591,-0.201568352243158,-0.206806500364600,-0.217320913016610,-0.218848216518345,-0.219581580475357,-0.219319364017311,-0.217408780954489,-0.212891112223681,-0.217666181937523,-0.217803482383909,-0.214442827287698,-0.218786546741778,-0.219030264596476,-0.219934497883403,-0.216769728913406,-0.218962416136805,-0.223742567008493,-0.229296545361403,-0.228765204418775,-0.226882957310952,-0.221051454005873,-0.213844431040709,-0.210091475109327,-0.206796282938135,-0.198856342704358,-0.193023265398380,-0.192922791079921,-0.195160144062980,-0.191179446856383,-0.191063350203927,-0.194885206736423,-0.191647553539490,-0.187856467681016,-0.182664896871401,-0.176659590083416,-0.188989951499022,-0.194283064379847,-0.196700995089794,-0.195283209286136,-0.187439662854244,-0.184561702854204,-0.183026927428268,-0.182412871279552,-0.176743294857607,-0.172454367373432,-0.165947843044468,-0.165834942921882,-0.161046822855875,-0.157209714328238,-0.145105763614179,-0.139215212284423,-0.132653420711693,-0.134953615320735,-0.145901535453159,-0.148942197593897,-0.152783236870498,-0.151610665279226,-0.142054097550812,-0.129322808450784,-0.122009103562221,-0.130152696654253,-0.138778803110895,-0.144146405593668,-0.142742620229668,-0.142220196619724,-0.139162884650351,-0.136357060581405,-0.137931897019876,-0.149015265853918,-0.159561382568963,-0.164168506705606,-0.171608043212338,-0.181844275234736,-0.179522433431567,-0.178318691105296,-0.176287139504465,-0.180580385755931,-0.184434462314690,-0.183600074721986,-0.182852951505697,-0.183856250813267,-0.180809977876446,-0.178899644613489,-0.181354503580704,-0.180942489357985,-0.184133946467126,-0.181958879774556,-0.184406804471197,-0.187631582881301,-0.184680067610615,-0.181487198377070,-0.182924450946907,-0.176847146706553,-0.174848924624854,-0.167096211339015,-0.165243010784472,-0.163548857365282,-0.162049126631341,-0.163126773431028,-0.164380956229806,-0.159697555279334,-0.158826299770866,-0.159774699892557,-0.158939757854775,-0.156861231171726,-0.154015681894636,-0.152371967091565,-0.153392164287053,-0.154869344264866,-0.154300121858806,-0.153126061405525,-0.157270384015768,-0.154152748024736,-0.158570155285856,-0.161177248613295,-0.162070739068033,-0.162684318698078,-0.167436455999990,-0.166902538569249,-0.167106767160312,-0.166497786702099,-0.165674193790195,-0.167371129004380,-0.169118642657913,-0.171236450796605,-0.172925992177956,-0.173875258789466,-0.172430334871084,-0.168066023251616,-0.169191137297978,-0.166512944217668,-0.161134322409130,-0.159567679770654,-0.157346952749824,-0.153350600645256,-0.150025355458245,-0.146706011970716,-0.148941770384068,-0.145218397431650,-0.149347818023165,-0.149504561030588,-0.147639445629801,-0.150211626966685,-0.149065305830317,-0.150099558596692,-0.152512227116143,-0.153659719321967,-0.156177383322024,-0.158916279409696,-0.162085360464542,-0.172337997689058,-0.172086553629845,-0.173719606369940,-0.175696534476538,-0.175373268643620,-0.180785858995735,-0.181862103090887,-0.186523479482183,-0.190016381999490,-0.189811049111990,-0.190676489279143,-0.190688261746899,-0.192290344911057,-0.190335013280173,-0.189297738714501,-0.186240189009548,-0.185824604976377,-0.186258156754685,-0.180166439328314,-0.178823204510814,-0.172208364291712,-0.171675231088191,-0.164758045352462,-0.161957309003637,-0.156688578151658,-0.155773415557663,-0.154185282083240,-0.150370515342692,-0.146570517945849,-0.149504431475873,-0.145645506375586,-0.148294891314810,-0.148060114980122,-0.147836798621667,-0.153206446288844,-0.149412759799779,-0.148677350135182,-0.148233082544720,-0.150624748051252,-0.152001560107240,-0.154473532103698,-0.159725145695895,-0.164887244447559,-0.166877688658090,-0.172399276841247,-0.173542623017708,-0.174882484390640,-0.176707797459103}', '{0.350561566797465,0.362610365650347,0.269044756901774,0.252727013987209,0.248492008961753,0.242259058784468,0.232039751895937,0.228771550826098,0.215864041096071,0.212754695047099,0.215244486016072,0.215750246203427,0.222175508192690,0.237343634837337,0.248366551405002,0.258006703682180,0.270180181429256,0.279757217145946,0.298337458970767,0.305323030547024,0.340849247663260,0.368437035072419,0.384709472315986,0.376211619343958,0.380275897829529,0.364823313613166,0.357707319301978,0.355715589835915,0.359728520579637,0.366111092805803,0.373452745178517,0.377270868676980,0.377571975171572,0.369785510065822,0.362806659604114,0.361434737025652,0.361305319279717,0.363271986535164,0.364707637453115,0.373495061624831,0.383983985062216,0.398129012842225,0.409503916341601,0.409669599457427,0.414611747921812,0.419421685692089,0.421593152905575,0.421935409072997,0.421128100414622,0.418634903506073,0.400649031109631,0.390592142359617,0.376602185139410,0.366716345900654,0.348139103291093,0.338964890913388,0.336962277829981,0.333837706823883,0.326508877545628,0.322756266471271,0.314645859619806,0.310140634462106,0.314225560764825,0.319151107325605,0.328540189309611,0.346435559534107,0.355524285555397,0.362170591120176,0.364150261595379,0.369965043633734,0.380828060768717,0.383043472901256,0.388433552744701,0.398471326700311,0.405504626846130,0.416900794257297,0.419568732350354,0.408227357545680,0.403428535326563,0.393951612687028,0.393750637442584,0.395662866623651,0.392030371585608,0.389061230234211,0.389088352103396,0.395536350993126,0.398845512100418,0.397753444224718,0.400486160253641,0.400707803460236,0.392502434218359,0.388715911524356,0.382114379088402,0.381700038365795,0.382224191005896,0.385750919675590,0.387906905538788,0.390665533062478,0.396816609035320,0.406217707284977,0.410530850550091,0.418308370391915,0.415061554117080,0.414104732912306,0.414202440293605,0.413072074287313,0.412477620898663,0.404464430686109,0.398985064789482,0.389613981556642,0.385155301946753,0.374264571697091,0.368881676778151,0.362267026872305,0.360911416255007,0.364341604128676,0.369784197957820,0.380753499954064,0.386803404778546,0.393118152842095,0.395490527314840,0.403904703822959,0.417362925605147,0.421270719081757,0.429719565444526,0.438909939312142,0.442165124322739,0.447750881925928,0.447654484756119,0.451044148744241,0.450190833374894,0.451791870413416,0.455710851116178,0.456587398139663,0.451736082297640,0.446994825428862,0.418698786803042,0.404469260643629,0.376945041989282,0.346463461280462,0.344828384013050,0.334425544986424,0.314572825695106,0.296206534125662,0.275852789873676,0.267864922857780,0.273506415745599,0.327540917802217,0.331119402622731,0.327567979797156,0.324645101236332,0.322068563608300,0.316685952338554,0.307899132044559,0.285919793846838,0.294782583095626,0.294788806137561,0.290975544108015,0.296420611907841,0.305111579748318,0.319668740380007,0.331420267973373,0.369016300666856,0.387284205258973,0.399026620938393,0.410893512793411,0.422597437703226,0.428129909118305,0.448204686740879,0.450257685333617,0.450743277084116,0.458573411416460,0.447042170609909,0.450201551391327,0.455482454332105,0.451740661198579,0.450438514850196,0.441100544555513,0.413459202635993,0.390535035105798,0.363325155313397,0.351329347001167,0.340754972886112,0.331033890751076,0.319883135701925,0.317703905323221,0.325891273506578,0.327797420825957,0.328890811820277,0.334339272334903,0.337391953652116,0.345772908712529,0.362557200109954,0.372666205025242,0.375944986555786,0.383454097447858,0.381760579893271,0.366966255781043,0.360626589942852,0.351481360156760,0.345591861735757,0.339847452157109,0.325532303201708,0.320352897334836,0.311983792025158,0.308528431568088,0.306759334516567,0.307734897855287,0.307931760308355,0.308487961979115,0.303104188867764,0.302420968541160,0.298423215569513,0.297794920487817,0.296176221946499,0.297844183820202,0.298654838420390,0.296322483218645,0.291197974136031,0.287307611500344,0.285830709421972,0.285269008961603,0.287924640831492,0.289946994162129,0.288538151539863,0.293080511935281,0.295244129729857,0.297999524648714,0.303349873041323,0.313636499902827,0.319136307493013,0.324322277240159,0.328949984756978,0.333245518492115,0.331317125592992,0.330742870206280,0.330987718167925,0.327827052779313,0.326552346100755,0.322674403270888,0.314883077647643,0.313846901050434,0.312675278570731,0.310687999317404,0.309809266518443,0.306267922368593,0.308072994229004,0.309932522492827,0.306682873280510,0.311867760264035,0.308570536580283,0.302344274113503,0.298389503950367,0.289057145165696,0.288277942433556,0.272489960895245,0.264529501355549,0.258827511961975,0.251160864179790,0.237213442411495,0.225942059349554,0.210951829500453,0.200829966826397,0.188464638034753,0.180345629711216,0.174891568517149,0.170647227687392,0.166796795667835,0.168385239539319,0.170594191043372,0.177161282242778,0.191067982289738,0.202906884763879,0.216010770038765,0.225094005218389,0.237905068074504,0.247077637623540,0.256774337105121,0.262732494463519,0.265597601485786,0.268800156514978,0.264387279601814,0.268630752712409,0.277853838948732,0.280727465911453,0.278156741504854,0.276835355144438,0.269286198469392,0.270361460963477,0.276849123211756,0.285301389231778,0.286448906180914,0.281688988756454,0.278790542390668,0.279979119779287,0.274912527881603,0.279896665566216,0.279930551133839,0.269869555484052,0.262429967159561,0.256060453667378,0.247165462322331,0.221311537652850,0.212969529482722,0.207647393035618,0.200848633158724,0.189482701695097,0.184095012217117,0.181439152359000,0.184754257887706,0.187217715078132,0.187655858786280,0.187846708898009,0.193588661651558,0.195168978743462,0.199358529907389,0.201980258998207,0.207808853662160,0.205097595860342,0.204301347790738,0.197224975739242,0.190819324422606,0.186391830199151,0.183456361531308,0.175528442043277,0.170893636999095,0.167301437941414,0.164567654880066,0.160706610539598,0.157347857163220,0.157138110880268,0.156407648870838,0.158483887853061,0.162615418472993,0.167550648003567,0.171638525305170,0.178149655329613,0.180662305002027,0.179162730863202,0.178303267400002,0.179717972613109,0.177323903329022,0.177787115155419,0.179629078734463,0.178797450566992,0.181365346082274,0.186356522186875,0.187183107887147,0.190264898802857,0.190532616894041,0.190940003555974,0.193453278275001,0.193346768785968,0.196239569167030,0.194334853021371,0.192736653577866,0.196219179556320,0.199319707628525,0.203075347378707,0.201861537546849,0.202905830989591,0.203522465903754,0.208639720822330,0.211316044805116,0.207431610838205,0.207098693717528,0.204976195256625,0.211669600091701,0.210431176980766,0.208713177335609,0.206593538823867,0.200610523023402,0.195462405254003,0.191337766597767,0.191207918225591,0.191157128968048,0.190520249234336,0.185137207425088,0.185034396777163,0.178207544844061,0.175553260288766,0.175095800560935,0.175171666155879,0.176417917679593,0.173395755980071,0.178679383438476,0.171441814284089,0.171298806514216,0.174339236565292,0.176182951365178,0.173293147191260,0.171181579134053,0.171939230750772,0.170878451209541,0.172039818707682,0.174219465711832,0.174874564854769,0.176097829207189,0.173281715917013,0.183075923290833,0.182249709488459,0.185423857509263,0.186708787601353,0.186500040901048,0.180348870110553,0.180690238379454,0.173548686027268,0.164152669511670,0.149062049954014,0.143728561640593,0.131890078967263,0.116259235992435,0.110665266545511,0.105160003608556,0.105470628883096,0.099375059211423,0.097479093631770,0.100917589466780,0.095264070470465,0.094503982630433,0.093036401112895,0.088025769500157,0.086845240607542,0.089201043809717,0.088419998635641,0.092199740943882,0.093896967609160,0.099141330562869,0.108309377717267,0.129870478106332,0.143582284294247,0.161410579809298,0.165183253911235,0.177499360543821,0.187235914150210,0.197319112076936,0.200647272148151,0.209623558475352,0.213877244114547,0.223123147649228,0.223045757792337,0.223774207577010,0.222498618250406,0.225502372790351,0.223124165116594,0.223586181101599,0.227639893779651,0.229095332122896,0.225089375170279,0.222925901705370,0.223122248089953,0.224474665676291,0.226913032442326,0.227761225565068,0.230775237377872,0.233306599378678,0.245776267455794,0.250457039018110,0.251285894953264,0.252768832640602,0.250338672173472,0.248153116261419,0.243970241985290,0.238464994962260,0.236826441832976,0.233683953258530,0.233946272227458,0.233878543231907,0.228356560186276,0.221680063210833,0.222713636275237,0.226140116851535,0.237769001804795,0.233951325142415,0.236308999323907,0.240390496388546,0.246674464741382,0.254362865292068,0.254657383356994,0.255348144314971,0.257955960769954,0.258517309087272,0.260313534664872,0.262554234258098,0.262015953354763,0.262348520700541,0.263676817709872,0.267834494800405,0.259331752309692,0.260299849249187,0.264302605058611,0.260173140596408,0.261218699817621,0.253570988048584,0.254391416237760,0.254934237333339,0.254057262089854,0.252249766585609,0.255561504709023,0.257229064371084,0.254301368603595,0.258859599778546,0.256520442143760,0.254342749309813,0.252322715375181,0.253314048182510,0.248835803018720,0.239222589971019,0.231852482322662,0.219042551524737,0.219605890805448,0.222015728496348,0.216881242918027,0.217499616264405,0.216763987192361,0.213652211706553,0.206513738401397,0.203048852173662,0.206068364615727,0.193427492862015,0.191391321596687,0.190091753711939,0.187934452418468,0.194292764905110,0.206173370322653,0.240668284103009,0.266534566076763,0.290956840535732,0.324611344795392,0.343246805477945,0.341838382363398,0.341598746432166,0.349747195463656,0.353568129195309,0.360047047397131,0.388327570179175,0.398636684200221,0.413426658620134,0.431296688780991,0.435875493960872,0.441480273385060,0.445909454005149,0.446458110601768,0.444696222269097,0.447490521982078,0.442838090438285,0.442185697600918,0.440098650219257,0.436931333144606,0.435410684932921,0.434870065051596,0.432324704171004,0.430969130260019,0.430186155311863,0.431528039785004,0.441843147227125,0.449404925863178,0.455458023284686,0.457296569139032,0.458824172666731,0.458728574978844,0.456675979638220,0.452677475069224,0.444391939612816,0.432421880192241,0.425458164842763,0.422057156642932,0.420870252327664,0.406729712671618,0.395957751324469,0.374148955194604,0.362450326212774,0.349258744087870,0.343839424656033,0.340061224912456,0.331950639258163,0.327182283341395,0.333485030450067,0.343508089955721,0.351251450219000,0.354812578189460,0.357441020708201,0.358264039372713,0.348400609302119,0.349887756170287,0.360828059978859,0.368158944611132,0.368327829546916,0.370770705173244,0.367932458526919,0.370643816116151,0.374163307180211,0.368933117319925,0.364209176313574,0.367519718273818,0.364347913412755,0.351719622711151,0.343123801705285,0.337734377541376,0.337040342085824,0.344336189981918,0.351060228457760,0.350256014054501,0.353859551762568,0.351011735630482,0.347214943722589,0.352930653131005,0.345790262069090,0.348276597730634,0.348768589247900,0.346986047820411,0.346418895679458,0.354011791170827,0.362021644855475,0.362914005851493,0.359927446526004,0.360317737659149,0.364492935709031,0.364253416001070,0.358247213457994,0.357294965051184,0.352351785299962,0.356500288927017,0.362815192622826,0.369928015321195,0.373665013278882,0.382568425606290,0.393700950542938,0.402674055604300,0.410444717093200,0.412510032934382,0.409184485456631,0.404299216745187,0.403547963867358,0.398335033386991,0.399678571134425,0.401666658672809,0.396233833433831,0.390260539530256,0.387742354183178,0.379979160521454,0.366622925132355,0.357438008764297,0.350257793929945,0.340927929207470,0.331889336828160,0.328291345816045,0.331208362900651,0.327233756356216,0.322794992464129,0.322537685381942,0.321427223028135,0.328615472887657,0.333677658964212,0.340534043167606,0.342425732284691,0.341376213687140,0.345401194529886,0.344040139855401,0.340558975160217,0.329383328308678,0.326366804040182,0.332239898682207,0.340195220586480,0.350949706750154,0.357257171470741,0.367968318747248,0.379150466059208,0.380271791825097,0.380731640013887,0.390723950391871,0.392322641513732,0.387366074305085,0.377071566216235,0.369457327596946,0.361025395145329,0.356507598462496,0.345900480380747,0.339372544350156,0.335284026546652,0.332080777689629,0.328445127264189,0.323894436294688,0.321696586451329,0.323183848071509,0.321991936606291,0.316321682831545,0.310502129661100,0.306221108337037,0.304596584067249,0.303301467374963,0.298790832241984,0.296450622845938,0.287494820261693,0.279835515452221,0.278417273461855,0.267801023464746,0.262946403144528,0.253761301233625,0.249803709470298,0.239318415366163,0.242068094972261,0.239065965481493,0.230098636083461,0.218107426717890,0.212261604425883,0.204029754219681,0.198251175218238,0.192332094743298,0.186457896713169,0.179146914395117,0.174992082044853,0.174761009852944,0.181147588605911,0.180701226894725,0.184685624117603,0.192734452883304,0.198772619292003,0.206323877341611,0.216352074251892,0.217594860902937,0.218523200254138,0.220480248386859,0.217539981357321,0.214900297260292,0.215655972996610,0.216344794295227,0.217302781054995,0.214273720909359,0.213589506010707,0.209611227628780,0.198731388272321,0.195641649021848,0.192375741064781,0.197012984692509,0.195486779080764,0.192938299587484,0.192139957145178,0.186341024506582,0.182972235225371,0.175128111893916}', '2017-11-12 14:36:15.557021-03', 1, 1);
COMMIT;