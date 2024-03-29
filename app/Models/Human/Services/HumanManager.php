<?php


namespace App\Models\Human\Services;


use App\Models\Human;
use App\Models\User;
use TCG\Voyager\Models\Role;

class HumanManager
{
    private $humanFactory;
    private $userManager;
    private $userFactory;

    public function __construct(HumanFactory $humanFactory,
                                User\Services\UserFactory $userFactory,
                                User\Services\UserManager $userManager)
    {
        $this->humanFactory = $humanFactory;
        $this->userFactory = $userFactory;
        $this->userManager = $userManager;
    }

    public function updateFields(Human $human, array $data): void
    {
        if (isset($data['birthday'])) { $human->birthday = $data['birthday']; }
        if (isset($data['gender'])) { $human->gender = $data['gender']; }
        if (isset($data['first_name'])) { $human->first_name = $data['first_name']; }
        if (isset($data['last_name'])) { $human->last_name = $data['last_name']; }
        if (isset($data['middle_name'])) { $human->middle_name = $data['middle_name']; }
        if (isset($data['nation'])) { $human->nation = $data['nation']; }
        if (isset($data['state'])) { $human->state = $data['state']; }
        if (isset($data['region'])) { $human->region = $data['region']; }
        $human->save();
    }

    public function handleParents(array $data, Human $baby): void
    {
        $baby->mother()->associate($this->handleParent($data['mother']));
        $baby->father()->associate($this->handleParent($data['father']));
        $baby->save();
    }

    public function handleParent(array $data): ?Human
    {
        $parent = null;
        if (!isset($data['passport']) && !isset($data['first_name'])) return null;
        if (isset($data['id'])) $parent = Human::find($data['id']);
        else $parent = $this->humanFactory->create($data, Human::STATUS_PARENT);
        $this->updateFields($parent, $data);
        if (isset($data['is_account'])) {
            if (isset($data['email'])) {
                $userData = [
                    'email' => $data['email'],
                    'role' => Role::firstOrNew(['name' => User::ROLE_PARENT])
                ];
                if (!$parent->user) {
                    $user = $this->userFactory->create($userData, $parent);
                } else {
                    $user = $parent->user;
                    $this->userManager->updateFields($user, $userData);
                }
                $this->userManager->sendCreds($user);
            }
        }
        return $parent;
    }

    public static function countries(): array
    {
        return [
            "AF" => "Owganystan",
            "AL" => "Albaniýa",
            "DZ" => "Alžir",
            "AS" => "Amerikan Samoasy (Gündogar)",
            "AD" => "Andorra",
            "AO" => "Angola",
            "AG" => "Antigua we Barbuda",
            "AZ" => "Azerbaýjan",
            "AR" => "Argentina",
            "AU" => "Awstraliýa",
            "AT" => "Awstriýa",
            "BS" => "Bagam Adalary",
            "BH" => "Bahreýn",
            "BD" => "Bangladeş",
            "AM" => "Ermenistan",
            "BB" => "Barbados",
            "BE" => "Belgiýa",
            "BM" => "Bermud Adalary (Brit.)",
            "BT" => "Butan",
            "BO" => "Boliwiýa",
            "BA" => "Bosniýa we Gersegowina",
            "BW" => "Botswana",
            "BR" => "Braziliýa",
            "BZ" => "Beliz",
            "SB" => "Solomonowlar Adalary",
            "VG" => "Wirgin Adalary (Brit.)",
            "BN" => "Bruneý – Darussalam",
            "BG" => "Bolgariýa",
            "MM" => "Mýanma",
            "BI" => "Burundi",
            "BY" => "Belorus",
            "KH" => "Kamboja",
            "CM" => "Kamerun",
            "CA" => "Kanada",
            "CV" => "Kabo-Werde",
            "KY" => "Kaýman Adalary (Brit.)",
            "CF" => "Merkeziafrika Respublikasy",
            "LK" => "Şri-Lanka",
            "TD" => "Çad",
            "CL" => "Çili",
            "CN" => "Hytaý",
            "TW" => "Taýwan (Hytaýyň prowinsiýasy)",
            "CO" => "Kolumbiýa",
            "KM" => "Komor Adalary",
            "YT" => "Maýotta",
            "CG" => "Kongo Respublikasy",
            "CD" => "Kongo Demokratik Respublikasy",
            "CK" => "Kuka Adalary (T.Zel.)",
            "CR" => "Kosta-Rika",
            "HR" => "Horwatiýa",
            "CU" => "Kuba",
            "CY" => "Kipr",
            "CZ" => "Çehiýa Respublikasy",
            "BJ" => "Benin",
            "DK" => "Daniýa",
            "DM" => "Dominika",
            "DO" => "Dominikan Respublikasy",
            "EC" => "Ekwador",
            "SV" => "Salwador",
            "GQ" => "Ekwatorial Gwineýa",
            "ET" => "Efiopiýa",
            "ER" => "Eritreýa",
            "EE" => "Estoniýa",
            "FO" => "Farer adalary",
            "FK" => "Folklend (Malwin) adalary",
            "FJ" => "Fijler",
            "FI" => "Finlýandiýa",
            "AX" => "Aland Adalary",
            "FR" => "Fransiýa",
            "GF" => "Fransuz Gwianasy",
            "PF" => "Fransuz Polineziýasy",
            "DJ" => "Jibuti",
            "GA" => "Gabon",
            "GE" => "Gruziýa",
            "GM" => "Gambiýa",
            "PS" => "Palestina awtonomiýasy",
            "DE" => "Germaniýa",
            "GH" => "Gana",
            "GI" => "Gibraltar (Brit.)",
            "KI" => "Kiribati",
            "GR" => "Gresiýa",
            "GL" => "Grenlandiýa",
            "GD" => "Grenada",
            "GP" => "Gwadelupa (Fr.)",
            "GU" => "Guam (ABŞ)",
            "GT" => "Gwatemala",
            "GN" => "Gwineýa",
            "GY" => "Gaýana",
            "HT" => "Gaiti",
            "VA" => "Watikan, Döwlet-Şäher",
            "HN" => "Gonduras",
            "HK" => "Sýangan (Gonkong), Hytaýyň ýörite dolandyryş etraby",
            "HU" => "Wengriýa",
            "IS" => "Islandiýa",
            "IN" => "Hindistan",
            "ID" => "Indoneziýa",
            "IR" => "Eýran (Yslam Respublikasy)",
            "IQ" => "Yrak",
            "IE" => "Irlandiýa",
            "IL" => "Ysraýyl",
            "IT" => "Italiýa",
            "CI" => "Kot-d’Iwuar",
            "JM" => "Ýamaýka",
            "JP" => "Ýaponiýa",
            "KZ" => "Gazagystan",
            "JO" => "Iordaniýa",
            "KE" => "Keniýa",
            "KP" => "Koreýa Halk-Demokratik Respublikasy",
            "KR" => "Koreýa Respublikasy",
            "KW" => "Kuweýt",
            "KG" => "Gyrgyzystan",
            "LA" => "Laos Halk-Demokratik Resublikasy",
            "LB" => "Liwan",
            "LS" => "Lesoto",
            "LV" => "Latwiýa",
            "LR" => "Liberiýa",
            "LY" => "Liwiýa Arap Jemhuryýeti",
            "LI" => "Lihtenşteýn",
            "LT" => "Litwa",
            "LU" => "Lýuksemburg",
            "MO" => "Makao, Hytaýyň ýörite administratiw raýony",
            "MG" => "Madagaskar",
            "MW" => "Malawi",
            "MY" => "Malaýziýa",
            "MV" => "Maldiw",
            "ML" => "Mali",
            "MT" => "Malta",
            "MQ" => "Martinika (Fr.)",
            "MR" => "Mawritaniýa",
            "MU" => "Mawrikiý",
            "MX" => "Meksika",
            "MC" => "Monako",
            "MN" => "Mongoliýa",
            "MD" => "Moldowa Respublikasy",
            "ME" => "Montenegro (Çernogoriýa)",
            "MS" => "Montserrat (Brit.)",
            "MA" => "Marokko",
            "MZ" => "Mozambik",
            "OM" => "Oman",
            "NA" => "Namibiýa",
            "NR" => "Nauru",
            "NP" => "Nepal",
            "NL" => "Niderlandlar",
            "AN" => "Antil Adalary (Nid.)",
            "AW" => "Aruba",
            "NC" => "Täze Kaledoniýa (Fr.)",
            "VU" => "Wanuatu",
            "NZ" => "Täze Zelandiýa",
            "NI" => "Nikaragua",
            "NE" => "Niger",
            "NG" => "Nigeriýa",
            "NU" => "Niue (T. Zel.)",
            "NF" => "Norfolk Adasy (Awstral.)",
            "NO" => "Norwegiýa",
            "MP" => "Demirgazyk Marian Adalary (ABŞ)",
            "FM" => "Mikroneziýa (Federatiw Ştatlary)",
            "MH" => "Marşallowa Adalary",
            "PW" => "Palau",
            "PK" => "Pakistan",
            "PA" => "Panama",
            "PG" => "Papua-Täze Gwineýa",
            "PY" => "Paragwaý",
            "PE" => "Peru",
            "PH" => "Filippinler",
            "PN" => "Pitkern (Brit.)",
            "PL" => "Polşa",
            "PT" => "Portugaliýa",
            "GW" => "Gwineýa-Bisau",
            "TL" => "Timor-Leste",
            "PR" => "Puerto-Riko (ABŞ)",
            "QA" => "Katar",
            "RE" => "Reýunon (Fr.)",
            "RO" => "Rumyniýa",
            "RU" => "Russiýa Federasiýasy",
            "RW" => "Ruanda",
            "BL" => "Sen-Bartelmi",
            "SH" => "Mukaddes Ýelena Adasy (Brit.)",
            "KN" => "Sent-Kits we Newis",
            "AI" => "Angilýa (Brit.)",
            "LC" => "Sent-Lýusiýa",
            "MF" => "Mukaddes Martin Adalary (Fr.)",
            "PM" => "Sen-Per we Mikelon (Fr.)",
            "VC" => "Sent-Winsent we Grenadin",
            "SM" => "San-Marino",
            "ST" => "San-Tome we Prinsipi",
            "SA" => "Saud Arabystany",
            "SN" => "Senegal",
            "RS" => "Serbiýa",
            "SC" => "Seýşel adalary",
            "SL" => "Serra-Leone",
            "SG" => "Singapur",
            "SK" => "Slowakiýa",
            "VN" => "Wýetnam",
            "SI" => "Sloweniýa",
            "SO" => "Somali",
            "ZA" => "Günorta Afrika",
            "ZW" => "Zimbabwe",
            "ES" => "Ispaniýa",
            "EH" => "Günbatar Sahara",
            "SD" => "Sudan",
            "SR" => "Surinam",
            "SJ" => "Şpisbergen we Ýan-Maýen Adalary",
            "SZ" => "Swazilend",
            "SE" => "Şwesiýa",
            "CH" => "Şweýsariýa",
            "SY" => "Siriýa Arap Respublikasy",
            "TJ" => "Täjigistan",
            "TH" => "Tailand",
            "TG" => "Togo",
            "TK" => "Tokelau (Ýunion) (T.Zel.)",
            "TO" => "Tonga",
            "TT" => "Trinidad we Tobago",
            "AE" => "Birleşen Arap Emirlikleri",
            "TN" => "Tunis",
            "TR" => "Türkiýe",
            "TM" => "Türkmenistan",
            "TC" => "Terks we Kaýkos Adalary (Brit.)",
            "TV" => "Tuwalu",
            "UG" => "Uganda",
            "UA" => "Ukraina",
            "MK" => "Makedoniýa Respublikasy",
            "EG" => "Müsür",
            "GB" => "Birleşen patyşalyk",
            "GG" => "Gernsi",
            "JE" => "Jersi",
            "IM" => "Men Adasy",
            "TZ" => "Tanzaniýa Birleşen Respublikasy",
            "US" => "Amerika Birleşen Ştatlary",
            "VI" => "Wirgin Adalary (ABŞ)",
            "BF" => "Burkina Faso",
            "UY" => "Urugwaý",
            "UZ" => "Özbegistan",
            "VE" => "Wenesuela, Boliwariýan Respublikasy",
            "WF" => "Uollis we Futuna Adalary (Fr.)",
            "WS" => "Samoa",
            "YE" => "Ýemen",
            "ZM" => "Zambiýa",
        ];
    }

    public static function regions(): array
    {
        return [
            "Aşgabat" => [
                'Bagtyýarlyk etraby',
                'Büzmeýin etraby',
                'Köpetdag etraby',
                'Berkararlyk etraby',
            ],
            "Ahal" => [
                'Tejen şäheri',
                'Ak bugdaý etraby',
                'Bäherden etraby',
                'Gökdepe etraby',
                'Kaka etraby',
                'Kaka şäheri',
                'Sarahs etraby',
                'Tejen etraby',
                'Babadaýhan etraby',
            ],
            "Balkan" => [
                'Balkanabat şäheri',
                'Serdar şäheri',
                'Türkmenbaşy şäheri',
                'Gumdag şäheri',
                'Hazar şäheri',
                'Esenguly etraby',
                'Bereket etraby',
                'Magtymguly etraby',
                'Serdar etraby',
                'Etrek etraby',
                'Türkmenbaşy etraby',
            ],
            "Daşoguz" => [
                'Daşoguz şäher',
                'Köneürgenç şäheri',
                'Gurbansoltan eje. ad. etraby',
                'Boldumsaz etraby',
                'Köneürgenç etraby',
                'Akdepe etraby',
                'S.Türkmenbaşy ad. etraby',
                'Görogly etraby',
                'S.A.Nyýazow ad etraby',
                'Gubadag etraby',
                'Ruhubelent etraby',
            ],
            "Lebap" => [
                'Türkmenabat şäheri',
                'Darganata etraby',
                'Dänew etraby',
                'Kerki etraby',
                'Saýat etraby',
                'Farap etraby',
                'Halaç etraby',
                'Hojambaz etraby',
                'Çärjew etraby',
                'Köýtendag etraby',
                'Döwletli etraby',
            ],
            "Mary" => [
                'Mary şäheri',
                'Baýramaly şäheri',
                'Baýramaly etraby',
                'Wekilbazar etraby',
                'Ýolöten etraby',
                'Garagum etraby',
                'Serhetabat etraby',
                'Mary etraby',
                'Murgap etraby',
                'Oguzhan etraby',
                'Sakarçäge etraby',
                'Tagtabazar etraby',
                'Türkmengala etraby',
            ]
        ];
    }
}
