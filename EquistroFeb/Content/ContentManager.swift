//
//  ContentManager.swift
//  EquistroFeb
//
//  Created by Arta Zidele on 05/02/2022.
//

import Foundation
import Firebase
import FirebaseFirestore

class ContentManager {
    
    
    
    static let shared = ContentManager()
    let db = Firestore.firestore()
    
    var valstis = [
        "Latvia",
        "Estonia",
        "Lithuania"
    ]
    var valstisImg = [
        "Screenshot 2022-03-28 at 04.59.58.imageset",
        "Screenshot 2022-03-28 at 05.04.42.imageset",
        "Screenshot 2022-04-04 at 16.23.05.imageset"
    ]
    
    var telefoni = [
        "+37128657357",
        "+37129293797",
        "+37126483202"
    ]
    var epasti = [
        "zideleanda@gmail.com",
        "arta.zidele@gmail.com",
        "zidele.nikola@gmail.com"
    ]
    
    
    var cenaVisi = [
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0,
        50.0
    ]
    
    //visiem
    var visiNames = [
        "B-Carotin",
        "Ipaligo Foal",
        "Respadril Aerosol",
        "Respadril Liquid (250ml)",
        "Respadril Liquid (1000ml)",
        "Secreta Pro Max (800g)",
        "Secreta Pro Max (2400g)",
        "Flexadin with UCII",
        "Chrysanphyton",
        "Artphyton (1500g)",
        "Artphyton (4500g)",
        "Cartiflex",
        "Mega Base (3000g)",
        "Mega Base (10000g)",
        "Mega Base Junior",
        "Mega Base Race",
        "Mega Base Maintenance",
        "Mega Base Fertility",
        "Betamag Forte",
        "Equiliser",
        "Electrolyt 7 (1200g)",
        "Electrolyt 7 (3000g)",
        "Elytaan",
        "Energy Booster",
        "Elimination (1000g)",
        "Elimination (5000g)",
        "Myo Power (1200g)",
        "Myo Power (2300g)",
        "Excell E Liquid (250ml)",
        "Excell E Liquid (1000ml)",
        "Excell E Powder (1000g)",
        "Excell E Powder (3000g)",
        "Triforce (600g)",
        "Triforce (1800g)",
        "Azodine",
        "Kerabol",
        "Kerabol Biotin",
        "Legaphyton",
        "Haemolytan 400 (250ml)",
        "Haemolytan 400 (1000ml)"
    ]
    var visiUrl = [
        "https://www.equistro.com/products/equistror-b-carotin",
        "https://www.equistro.com/products/equistror-ipaligo-foal",
        "https://www.equistro.com/products/equistror-respadril-aerosol",
        "https://www.equistro.com/products/equistror-respadril",
        "https://www.equistro.com/products/equistror-respadril",
        "https://www.equistro.com/products/equistror-secreta-pro-max",
        "https://www.equistro.com/products/equistror-secreta-pro-max",
        "https://www.equistro.com/products/equistror-flexadin",
        "https://www.equistro.com/products/equistror-chrysanphyton",
        "https://www.equistro.com/products/equistror-artphyton",
        "https://www.equistro.com/products/equistror-artphyton",
        "https://www.equistro.com/products/equistror-cartiflex",
        "https://www.equistro.com/products/equistror-mega-base",
        "https://www.equistro.com/products/equistror-mega-base",
        "https://www.equistro.com/products/equistror-mega-base-junior",
        "https://www.equistro.com/products/equistror-mega-base-race",
        "https://www.equistro.com/products/equistror-mega-base-maintenance",
        "https://www.equistro.com/products/equistror-mega-base-fertility",
        "https://www.equistro.com/products/equistror-betamag-forte",
        "https://www.equistro.com/products/equistror-equiliser",
        "https://www.equistro.com/products/equistror-electrolyt-7",
        "https://www.equistro.com/products/equistror-electrolyt-7",
        "https://www.equistro.com/products/equistror-elytaan",
        "https://www.equistro.com/products/equistror-energy-booster",
        "https://www.equistro.com/products/equistror-elimination",
        "https://www.equistro.com/products/equistror-elimination",
        "https://www.equistro.com/products/equistror-myo-power",
        "https://www.equistro.com/products/equistror-myo-power",
        "https://www.equistro.com/products/equistror-excell-e",
        "https://www.equistro.com/products/equistror-excell-e",
        "https://www.equistro.com/products/equistror-excell-e-powder",
        "https://www.equistro.com/products/equistror-excell-e-powder",
        "https://www.equistro.com/products/equistror-triforce",
        "https://www.equistro.com/products/equistror-triforce",
        "https://www.equistro.com/products/equistror-azodine",
        "https://www.equistro.com/products/equistror-kerabol",
        "https://www.equistro.com/products/equistror-kerabol-biotin",
        "https://www.equistro.com/products/equistror-legaphyton",
        "https://www.equistro.com/products/equistror-haemolytan",
        "https://www.equistro.com/products/equistror-haemolytan"
    ]
    
    
    var visiImages = [
        "unnamed-9.imageset",
        "unnamed-22.imageset",
        "unnamed-3.imageset",
        "unnamed-4.imageset",
        "unnamed-4.imageset",
        "unnamed-5.imageset",
        "unnamed-5.imageset",
        "unnamed-20.imageset",
        "unnamed-12.imageset",
        "unnamed-7.imageset",
        "unnamed-7.imageset",
        "unnamed-11.imageset",
        "unnamed-26.imageset",
        "unnamed-26.imageset",
        "unnamed-28.imageset",
        "unnamed-1.imageset",
        "unnamed.imageset",
        "unnamed-27.imageset",
        "unnamed-10.imageset",
        "unnamed-17.imageset",
        "unnamed-13.imageset",
        "unnamed-13.imageset",
        "unnamed-15.imageset",
        "unnamed-16.imageset",
        "unnamed-14.imageset",
        "unnamed-14.imageset",
        "unnamed-2.imageset",
        "unnamed-2.imageset",
        "unnamed-18.imageset",
        "unnamed-18.imageset",
        "unnamed-19.imageset",
        "unnamed-19.imageset",
        "unnamed-6.imageset",
        "unnamed-6.imageset",
        "unnamed-8.imageset",
        "unnamed-23.imageset",
        "unnamed-24.imageset",
        "unnamed-25.imageset",
        "unnamed-21.imageset",
        "unnamed-21.imageset"
    ]
    var visiComposition = [
        "unnamed-40.imageset",
        "unnamed-41.imageset",
        "unnamed-32.imageset",
        "unnamed-30.imageset",
        "unnamed-30.imageset",
        "unnamed-31.imageset",
        "unnamed-31.imageset",
        "unnamed-42.imageset",
        "unnamed-43.imageset",
        "unnamed-44.imageset",
        "unnamed-44.imageset",
        "unnamed-45.imageset",
        "unnamed-51.imageset",
        "unnamed-51.imageset",
        "unnamed-47.imageset",
        "unnamed-50.imageset",
        "unnamed-48.imageset",
        "unnamed-49.imageset",
        "unnamed-38.imageset",
        "unnamed-39.imageset",
        "unnamed-55.imageset",
        "unnamed-55.imageset",
        "unnamed-56.imageset",
        "unnamed-46.imageset",
        "unnamed-52.imageset",
        "unnamed-52.imageset",
        "unnamed-37.imageset",
        "unnamed-37.imageset",
        "unnamed-36.imageset",
        "unnamed-36.imageset",
        "unnamed-35.imageset",
        "unnamed-35.imageset",
        "unnamed-34.imageset",
        "unnamed-34.imageset",
        "unnamed-33.imageset",
        "unnamed-53.imageset",
        "unnamed-54.imageset",
        "unnamed-57.imageset",
        "unnamed-29.imageset",
        "unnamed-29.imageset"
    ]
    var visiApraksts = [
        "Complementary feeding stuff for broodmares and stallions that contains ß-carotene, vitamins A and E, fatty acids and iron. ß-Carotin has been designed to help provide the essential vitamins and vitamin pre-cursors, notably 500 mg ß-carotene per day, which are necessary for optimal reproductive health in the run up period to and during the stud season, particularly during periods when fresh forage is less abundant. i.e. January -May. \nPackaging size: 3000g bucket. \nUse: \nBroodmares: 50g per day; \nStallions: 25-50g per day.",
        "Complementary feeding stuff rich in trace elements, vitamins and essential amino acids, to help meet the needs of the young foal until weaning. Is recommended as a means to help ensure the needs in essential trace elements and vitamins of the foal from birth to weaning are met during this vital period of development. \nPackaging size: 14g x3 oral syringes. \nUse: \nFoals: 1 oral syringe after foal birth; 1-2 oral syringe in next 3 weeks; 1 oral syringe in 2nd-6th month of foal's life.",
        "Essential oils that support the respiratory function (e.g. ammonia). External use only. A specially conceived formulation for aerosol therapy in the horse. Rich in essential oils that support the respiratory function (e.g. ammonia). Acting directly on the lungs in horses affected by respiratory problems. \nPackaging size: 5x 10ml vials. \nUse: \nLiquid for use in conjuctions with a nebuliser.",
        "Liquid complementary feeding stuff for horses with a unique original combination of selected plants and readily assimilated copper (IPALIGO® trace element). Supports the normal function of the respiratory system. The extensively researched plants contained in RESPADRIL are known for their respiratory tract virtues. The aromatic essences and plant extracts can aid respiratory comfort allowing the horse to feed normally. Licorice can support the natural self-cleansing process and mucus formation in the upper and lower respiratory tract. Oregano, Pine and Eucalyptus aid the resistance and natural regeneration of the respiratory tract. Copper is a biological antioxidant and in RESPADRIL it is bound to amino acids, which ensure rapid assimilation. \nPackaging size: 250ml bottle. \nUse: \nHorses: 40ml per day for 5 days; \nSmall horses & Ponies & Foals: 20ml per day for 5 days.",
        "Liquid complementary feeding stuff for horses with a unique original combination of selected plants and readily assimilated copper (IPALIGO® trace element). Supports the normal function of the respiratory system. The extensively researched plants contained in RESPADRIL are known for their respiratory tract virtues. The aromatic essences and plant extracts can aid respiratory comfort allowing the horse to feed normally. Licorice can support the natural self-cleansing process and mucus formation in the upper and lower respiratory tract. Oregano, Pine and Eucalyptus aid the resistance and natural regeneration of the respiratory tract. Copper is a biological antioxidant and in RESPADRIL it is bound to amino acids, which ensure rapid assimilation. \nPackaging size: 1000ml bottle. \nUse: \nHorses: 40ml per day for 5 days; \nSmall horses & Ponies & Foals: 20ml per day for 5 days.",
        "Particularly recommended for horse’s requiring a clear airway and healthy respiratory system to optimize their well-being and performance. Formulation that combines the selection of herbs with the antioxidant Vitamin E in a biological form that supports the respiratory system. \nPackaging size: 800g bucket. \nUse: \nHorses: 10-20g per day; \nSmall horses & Ponies & Foals: 5-10g per day.",
        "Particularly recommended for horse’s requiring a clear airway and healthy respiratory system to optimize their well-being and performance. Formulation that combines the selection of herbs with the antioxidant Vitamin E in a biological form that supports the respiratory system. \nPackaging size: 2400g bucket. \nUse: \nHorses: 10-20g per day; \nSmall horses & Ponies & Foals: 5-10g per day.",
        "The FLEXADIN with UCII® original formula is of particular interest for horses whose joint mechanism is subject to intense effort and regular exertion. Contains patented collagen, MSM and chelated manganese, chosen to support a lasting joint health and mobility. \nPackaging size: 600g bucket. \nUse: \nHorses: 10-15g per day.",
        "Complementary feeding stuff containing CHRYSANTHELLUM AMERICANUM. The horse’s feet are a major element of its locomotion. They are constantly solicited. For normal hooves function, a physiological blood circulation is essential. Some natural elements such as flavonoids present in most plants and especially in CHRYSANTHELLUM AMERICANUM, are known to help maintain a physiological blood circulation thanks to their antioxidative character and their key role as vessel protector. \nPackaging size: 2000g bucket. \nUse: \nHorses: 20g 2x per day.",
        "Pelleted complementary feeding stuff destined to support optimal joint function in horses. For horses, and notably older horses requiring healthy joint mobility and function. \nPackaging size: 1500g bucket. \nUse: \nHorses: 100-150g daily.",
        "Pelleted complementary feeding stuff destined to support optimal joint function in horses. For horses, and notably older horses requiring healthy joint mobility and function. \nPackaging size: 4500g bucket. \nUse: \nHorses: 100-150g daily.",
        "Cartiflex is a synergystic combination of green-lipped mussels, brown seaweed extract, omega-3 fatty acids, an the antioxidants vitamin E and selenium. \nPackaging size: 1000g bucket. \nUse: \nHorses: 15g 2x per day.",
        "Mineral feeding stuff for horses destined to help meet their nutrient requirements. Recommended for active healthy horses receiving a feed ration rich in cereals. MEGA BASE can help cover the basic needs in minerals for all horses, particularly those fed on concentrates (pellets…). By adapting the daily supply, the increasing needs are equally met during rearing or during the breaking-in period. \nPackaging size: 3000g bucket. \nUse: \nHorses: 50g per day; \nSmall horses & Ponies & Foals: 25g per day.",
        "Mineral feeding stuff for horses destined to help meet their nutrient requirements. Recommended for active healthy horses receiving a feed ration rich in cereals. MEGA BASE can help cover the basic needs in minerals for all horses, particularly those fed on concentrates (pellets…). By adapting the daily supply, the increasing needs are equally met during rearing or during the breaking-in period. \nPackaging size: 10000g bucket. \nUse: \nHorses: 50g per day; \nSmall horses & Ponies & Foals: 25g per day.",
        "Specially designed to meet the needs for a healthy musculo-skeletal and locomotor apparatus development. A mineral and vitamin supplement fortified with essential trace elements conceived for an optimal supplementation of the foal from 4 weeks  of age to weaning and beyond. For suckling foals and young horses. It supplies valuable minerals (calcium, phosphorus and magnesium), trace elements (IPALIGO®) and vitamins to meet the requirements pre and post weaning, a critical period for healthy growth and development. \nPackaging size: 1000ml bottle. \nUse: \nBroodmares: 20-40ml per day; \nNursing foals: 4th week of life 20ml 2x a week; 8th week of life 20ml 3x a week; from 12th week of life 20-40ml per day.",
        "Pelleted mineral complementary feeding stuff for race horses destined to help balance their ration. Particularly recommended for race and competition horses being fed a cereal rich diet. \nPackaging size: 5000g bucket. \nUse: \nHorses: 80-100g per day.",
        "Pelleted mineral complementary feeding stuff for horses being fed traditional ration destined to help balance the ration of mares, foals and horses at work. Particularly recommended for horses being fed traditional ration. \nPackaging size: 5000g bucket. \nUse: \nHorses: 80-100g per day.",
        "Pelleted mineral complementary feeding stuff particularly recommended for broodmares in the 3rd trimester of pregnancy and during lactation. MEGA BASE FERTILITY can equally be used in yearlings. \nPackaging size: 5000g bucket. \nUse: \nHorses: 80-100g per day.",
        "BETAMAG Forte helps horses to feel more comfortable in unfamiliar situations and to control unpredictable. Magnesium is known as an important neural factor, and if in sufficient supply, will prevent the release of stress hormones in the body. Similarly like magnesium, zinc also plays an important role in stress, zinc levels dropping in stressful situations. The zinc requirement for horses of all ages is around 50 mg/kg feed. \nPackaging size: 1000g bottle. \nUse: \nHorses: 10ml 1-2x per day; \nPonies & Small horses: 5ml 1-2x per day.",
        "Feeding stuff that contains a readily assimilated organic magnesium, L-Tryptophan, and key B complex vitamins that helps reduce unwanted horse behavior in unusual situations as change in environment, such as travelling or whenerver the animal’s routine is altered. \nPackaging size: 500g bucket. \nUse: \nHorses: 20g per day; \nSmall horses & Ponies: 10g per day.",
        "Dietetic feeding stuff containing a high concentration of electrolytes, vitamin E an readily assimilated vitamin C and zinc. ELECTROLYT 7 is particularly recommended during extreme physical exertion · physical capacity and sporting potential recovery · hot climates. \nPackaging size: 1200g bucket. \nUse: \nHorses: 40-120g per day.",
        "Dietetic feeding stuff containing a high concentration of electrolytes, vitamin E an readily assimilated vitamin C and zinc. ELECTROLYT 7 is particularly recommended during extreme physical exertion · physical capacity and sporting potential recovery · hot climates. \nPackaging size: 3000g bucket. \nUse: \nHorses: 40-120g per day.",
        "Liquid dietetic feeding stuff rich in electrolytes, readily assimilated trace elements (IPALIGO®), B vitamins and essential amino acids for horses. Helps compensate electrolyte loss in cases of heavy sweating following intense physical activity such as training and during competition, as well as aiding during the important recovery period. \nPackaging size: 1000ml bottle. \nUse: \nHorses: 20-40ml per day; \nPonies & Foals: 10-20ml over 1-3 days.",
        "Energy booster is particularly recommended for horses with an increased requirement for rapidly available energy, B vitamins and amino acids in exceptional situations. \nPackaging size: 20g in an oral syringe. \nUse: \nHorses: 0,5-1 oral syringe; \nSmall horses & Ponies & Foals: 0,25 oral syringe.",
        "A feeding stuff containing dandelion, artichoke and orthosiphon especially formulated to help enrich the diet of the horse, and support the nutritional diversity. To use: after exertion, at seasonal changes and particularly during spring, after a medical treatment. \nPackaging size: 1000g bucket. \nUse: \nHorses: 50-100g per day.",
        "A feeding stuff containing dandelion, artichoke and orthosiphon especially formulated to help enrich the diet of the horse, and support the nutritional diversity. To use: after exertion, at seasonal changes and particularly during spring, after a medical treatment. \nPackaging size: 5000g bucket. \nUse: \nHorses: 50-100g per day.",
        "Particularly recommended for young and athletic horses where a healthy muscular development and condition is important. MYO POWER is a complementary feeding stuff for horses destined to support a healthy muscular development and condition. \nPackaging size: 1200g bucket. \nUse: \nHorses: 75g per day for 3 weeks; then 50g per day for 2 weeks; \nSmall horses & Ponies & Foals: 50g per day for 3 weeks; then 25g per day for 2 weeks.",
        "Particularly recommended for young and athletic horses where a healthy muscular development and condition is important. MYO POWER is a complementary feeding stuff for horses destined to support a healthy muscular development and condition. \nPackaging size: 2300g bucket. \nUse: \nHorses: 75g per day for 3 weeks; then 50g per day for 2 weeks; \nSmall horses & Ponies & Foals: 50g per day for 3 weeks; then 25g per day for 2 weeks.",
        "Dietetic complementary feeding stuff for horses that contains a bioavailable complex of Vitamin E, organic selenium, magnesium and L-lysine. Particularly recommended to help maintain a healthy muscle function and integrity and for assisting horses following an increased demand relating to muscular exertion and tension. \nPackaging size: 250ml bottle. \nUse: \nHorses: 10-20ml per day; \nSmall horses & Ponies & Foals: 5-10ml per day.",
        "Dietetic complementary feeding stuff for horses that contains a bioavailable complex of Vitamin E, organic selenium, magnesium and L-lysine. Particularly recommended to help maintain a healthy muscle function and integrity and for assisting horses following an increased demand relating to muscular exertion and tension. \nPackaging size: 1000ml bottle. \nUse: \nHorses: 10-20ml per day; \nSmall horses & Ponies & Foals: 5-10ml per day.",
        "Dietetic complementary feeding stuff for horses that contains a bioavailable complex of Vitamin E, organic selenium, magnesium and L-lysine. Particularly recommended to help maintain a healthy muscle function and integrity and for assisting horses following an increased demand relating to muscular exertion and tension. \nPackaging size: 1000g bucket. \nUse: \nHorses: 50g per day; \nSmall horses & Ponies & Foals: 25g per day.",
        "Dietetic complementary feeding stuff for horses that contains a bioavailable complex of Vitamin E, organic selenium, magnesium and L-lysine. Particularly recommended to help maintain a healthy muscle function and integrity and for assisting horses following an increased demand relating to muscular exertion and tension. \nPackaging size: 3000g bucket. \nUse: \nHorses: 50g per day; \nSmall horses & Ponies & Foals: 25g per day.",
        "Complementary feeding stuff for horses that contains antioxidants, Vitamin C, Vitamin E, organic selenium, essential amino acids, DL-methionine and L-lysine. Particularly recommended for horses requiring a muscular vitality and top performance through regular and uninterrupted intense training and competition. Destined to support performance and vitality in horses in the presence of free radicals associated with intense training and exercise. \nPackaging size: 600g bucket. \nUse: \nHorses: 20g per day; \nSmall horses & Ponies & Foals: 10g per day.",
        "Complementary feeding stuff for horses that contains antioxidants, Vitamin C, Vitamin E, organic selenium, essential amino acids, DL-methionine and L-lysine. Particularly recommended for horses requiring a muscular vitality and top performance through regular and uninterrupted intense training and competition. Destined to support performance and vitality in horses in the presence of free radicals associated with intense training and exercise. \nPackaging size: 1800g bucket. \nUse: \nHorses: 20g per day; \nSmall horses & Ponies & Foals: 10g per day.",
        "A high concentrate of calcium, sodium and chloride electrolytes needed for healthy muscles function. \nPackaging size: 2000g bucket. \nUse: \nHorses: 50g per day; \nSmall horses & Ponies & Foals: 25g per day.",
        "Dietetic complementary feeding stuff containing D-biotin, DL-methionine (organic sulphur source), and readily assimilated zinc, manganese (IPALIGO® trace elements) and selenium, all of which help the formation of healthy hooves and coat in horses. Daily use promotes both a healthy hoof (supple without crumbling or brittleness) as well as a bright shiny coat. \nPackaging size: 1000ml bottle. \nUse: \nHorses: 10ml per day; \nSmall horses & Ponies & Foals: 5ml per day.",
        "Complementary feeding stuff for horses that contains D-biotin, DL-methionine (organic sulphur source), readily assimilated zinc, manganese (IPALIGO® trace elements) and selenium (Selplex®). Destined to contribute to the formation of healthy hooves and coat in horses. Daily use promotes both a healthy hoof (supple without crumbling or brittleness) as well as a bright shiny coat. \nPackaging size: 1000g bucket. \nUse: \nHorses: 15g per day; \nSmall horses & Ponies & Foals: 7,5g per day.",
        "Pelleted dietetic feeding stuff formulated to support the liver function in the case of chronic liver insufficiency in horses. Contains a readily assimilated silibin and phospholipid association and highly digestible carbohydrates (Lucerne, Carob). LEGAPHYTON is particularly recommended for horses suffering from chronic liver insufficiency (horses under intense training, overfed horses and “aged“ horses). \nPackaging size: 900g bucket. \nUse: \nHorses: 30g per day; \nSmall horse & Ponies & Foals: 15g per day.",
        "Complementary feeding stuff for horses enriched with vitamins and trace elements to support vitality, HAEMOLYTAN 400 helps provide the nutriants necessary for recovery during and after periods of effort or during difficult periods. Haemolytan 400 is a complementary feeding stuff for horses enriched with vitamins and trace elements to support vitality. HAEMOLYTAN 400 helps provide the nutriants necessary for recovery during and after periods of effort or during difficult periods. \nPackaging size: 250ml bottle. \nUse: \nHorses: 10-15ml per day; \nSmall horses & Ponies & Foals: 5-10ml per day or 15ml 2-3 times a week.",
        "Complementary feeding stuff for horses enriched with vitamins and trace elements to support vitality, HAEMOLYTAN 400 helps provide the nutriants necessary for recovery during and after periods of effort or during difficult periods. Haemolytan 400 is a complementary feeding stuff for horses enriched with vitamins and trace elements to support vitality. HAEMOLYTAN 400 helps provide the nutriants necessary for recovery during and after periods of effort or during difficult periods. \nPackaging size: 1000ml bottle. \nUse: \nHorses: 10-15ml per day; \nSmall horses & Ponies & Foals: 5-10ml per day or 15ml 2-3 times a week."
    ]
    
    
    
    //METABOLISM
    var fmetCena = [
        50.0,
        50.0
    ]
    var fmetNames = [
        "Haemolytan 400 (250ml)",
        "Haemolytan 400 (1000ml)"
    ]
    var fmetUrl = [
        "https://www.equistro.com/products/equistror-haemolytan",
        "https://www.equistro.com/products/equistror-haemolytan"
    ]
    var fmetImages = [
        "unnamed-21.imageset",
        "unnamed-21.imageset"
    ]
    var categorijasNumuriMet = [
        "3",
        "3"
    ]
    var fmetApraksts = [
        "Complementary feeding stuff for horses enriched with vitamins and trace elements to support vitality, HAEMOLYTAN 400 helps provide the nutriants necessary for recovery during and after periods of effort or during difficult periods. Haemolytan 400 is a complementary feeding stuff for horses enriched with vitamins and trace elements to support vitality. HAEMOLYTAN 400 helps provide the nutriants necessary for recovery during and after periods of effort or during difficult periods. \nPackaging size: 250ml bottle. \nUse: \nHorses: 10-15ml per day; \nSmall horses & Ponies & Foals: 5-10ml per day or 15ml 2-3 times a week.",
        "Complementary feeding stuff for horses enriched with vitamins and trace elements to support vitality, HAEMOLYTAN 400 helps provide the nutriants necessary for recovery during and after periods of effort or during difficult periods. Haemolytan 400 is a complementary feeding stuff for horses enriched with vitamins and trace elements to support vitality. HAEMOLYTAN 400 helps provide the nutriants necessary for recovery during and after periods of effort or during difficult periods. \nPackaging size: 1000ml bottle. \nUse: \nHorses: 10-15ml per day; \nSmall horses & Ponies & Foals: 5-10ml per day or 15ml 2-3 times a week."
    ]
    var fmetComposition = [
        "unnamed-29.imageset",
        "unnamed-29.imageset"
    ]
    
    
    //DIGESTIVE SYSTEM
    var fdsCena = [
        50.0
    ]
    var fdsNames = [
        "Legaphyton"
    ]
    var fdsUrl = [
        "https://www.equistro.com/products/equistror-legaphyton"
    ]
    var fdsImages = [
        "unnamed-25.imageset"
    ]
    var categorijasNumuriDigest = [
        "6"
    ]
    var fdsApraksts = [
        "Pelleted dietetic feeding stuff formulated to support the liver function in the case of chronic liver insufficiency in horses. Contains a readily assimilated silibin and phospholipid association and highly digestible carbohydrates (Lucerne, Carob). LEGAPHYTON is particularly recommended for horses suffering from chronic liver insufficiency (horses under intense training, overfed horses and “aged“ horses). \nPackaging size: 900g bucket. \nUse: \nHorses: 30g per day; \nSmall horse & Ponies & Foals: 15g per day."
    ]
    var fdsComposition = [
        "unnamed-57.imageset"
    ]
    
    //SKIN, COAT AND HOOVES
    var fschCena = [
        50.0,
        50.0
    ]
    var fschNames = [
        "Kerabol",
        "Kerabol Biotin"
    ]
    var fschUrl = [
        "https://www.equistro.com/products/equistror-kerabol",
        "https://www.equistro.com/products/equistror-kerabol-biotin"
    ]
    var fschImages = [
        "unnamed-23.imageset",
        "unnamed-24.imageset"
    ]
    var categorijasNumuriSkin = [
        "2",
        "2"
    ]
    var fschApraksts = [
        "Dietetic complementary feeding stuff containing D-biotin, DL-methionine (organic sulphur source), and readily assimilated zinc, manganese (IPALIGO® trace elements) and selenium, all of which help the formation of healthy hooves and coat in horses. Daily use promotes both a healthy hoof (supple without crumbling or brittleness) as well as a bright shiny coat. \nPackaging size: 1000ml bottle. \nUse: \nHorses: 10ml per day; \nSmall horses & Ponies & Foals: 5ml per day.",
        "Complementary feeding stuff for horses that contains D-biotin, DL-methionine (organic sulphur source), readily assimilated zinc, manganese (IPALIGO® trace elements) and selenium (Selplex®). Destined to contribute to the formation of healthy hooves and coat in horses. Daily use promotes both a healthy hoof (supple without crumbling or brittleness) as well as a bright shiny coat. \nPackaging size: 1000g bucket. \nUse: \nHorses: 15g per day; \nSmall horses & Ponies & Foals: 7,5g per day."
    ]
    var fschComposition = [
        "unnamed-53.imageset",
        "unnamed-54.imageset"
    ]
    
    //MUSCLES - tikai vēl cenu!!!
    var fmuscCena = [
        50.0,
        50.0,
        4.0,
        4.0,
        4.0,
        4.0,
        4.0,
        4.0,
        4.0
    ]
    var fmuscNames = [
        "Myo Power (1200g)",
        "Myo Power (2300g)",
        "Excell E Liquid (250ml)",
        "Excell E Liquid (1000ml)",
        "Excell E Powder (1000g)",
        "Excell E Powder (3000g)",
        "Triforce (600g)",
        "Triforce (1800g)",
        "Azodine"
    ]
    var fmuscUrl = [
        "https://www.equistro.com/products/equistror-myo-power",
        "https://www.equistro.com/products/equistror-myo-power",
        "https://www.equistro.com/products/equistror-excell-e",
        "https://www.equistro.com/products/equistror-excell-e",
        "https://www.equistro.com/products/equistror-excell-e-powder",
        "https://www.equistro.com/products/equistror-excell-e-powder",
        "https://www.equistro.com/products/equistror-triforce",
        "https://www.equistro.com/products/equistror-triforce",
        "https://www.equistro.com/products/equistror-azodine"
    ]
    var fmuscComposition = [
        "unnamed-37.imageset",
        "unnamed-37.imageset",
        "unnamed-36.imageset",
        "unnamed-36.imageset",
        "unnamed-35.imageset",
        "unnamed-35.imageset",
        "unnamed-34.imageset",
        "unnamed-34.imageset",
        "unnamed-33.imageset"
    ]
    var fmuscImages = [
        "unnamed-2.imageset",
        "unnamed-2.imageset",
        "unnamed-18.imageset",
        "unnamed-18.imageset",
        "unnamed-19.imageset",
        "unnamed-19.imageset",
        "unnamed-6.imageset",
        "unnamed-6.imageset",
        "unnamed-8.imageset"
    ]
    var fmuscApraksts = [
        "Particularly recommended for young and athletic horses where a healthy muscular development and condition is important. MYO POWER is a complementary feeding stuff for horses destined to support a healthy muscular development and condition. \nPackaging size: 1200g bucket. \nUse: \nHorses: 75g per day for 3 weeks; then 50g per day for 2 weeks; \nSmall horses & Ponies & Foals: 50g per day for 3 weeks; then 25g per day for 2 weeks.",
        "Particularly recommended for young and athletic horses where a healthy muscular development and condition is important. MYO POWER is a complementary feeding stuff for horses destined to support a healthy muscular development and condition. \nPackaging size: 2300g bucket. \nUse: \nHorses: 75g per day for 3 weeks; then 50g per day for 2 weeks; \nSmall horses & Ponies & Foals: 50g per day for 3 weeks; then 25g per day for 2 weeks.",
        "Dietetic complementary feeding stuff for horses that contains a bioavailable complex of Vitamin E, organic selenium, magnesium and L-lysine. Particularly recommended to help maintain a healthy muscle function and integrity and for assisting horses following an increased demand relating to muscular exertion and tension. \nPackaging size: 250ml bottle. \nUse: \nHorses: 10-20ml per day; \nSmall horses & Ponies & Foals: 5-10ml per day.",
        "Dietetic complementary feeding stuff for horses that contains a bioavailable complex of Vitamin E, organic selenium, magnesium and L-lysine. Particularly recommended to help maintain a healthy muscle function and integrity and for assisting horses following an increased demand relating to muscular exertion and tension. \nPackaging size: 1000ml bottle. \nUse: \nHorses: 10-20ml per day; \nSmall horses & Ponies & Foals: 5-10ml per day.",
        "Dietetic complementary feeding stuff for horses that contains a bioavailable complex of Vitamin E, organic selenium, magnesium and L-lysine. Particularly recommended to help maintain a healthy muscle function and integrity and for assisting horses following an increased demand relating to muscular exertion and tension. \nPackaging size: 1000g bucket. \nUse: \nHorses: 50g per day; \nSmall horses & Ponies & Foals: 25g per day.",
        "Dietetic complementary feeding stuff for horses that contains a bioavailable complex of Vitamin E, organic selenium, magnesium and L-lysine. Particularly recommended to help maintain a healthy muscle function and integrity and for assisting horses following an increased demand relating to muscular exertion and tension. \nPackaging size: 3000g bucket. \nUse: \nHorses: 50g per day; \nSmall horses & Ponies & Foals: 25g per day.",
        "Complementary feeding stuff for horses that contains antioxidants, Vitamin C, Vitamin E, organic selenium, essential amino acids, DL-methionine and L-lysine. Particularly recommended for horses requiring a muscular vitality and top performance through regular and uninterrupted intense training and competition. Destined to support performance and vitality in horses in the presence of free radicals associated with intense training and exercise. \nPackaging size: 600g bucket. \nUse: \nHorses: 20g per day; \nSmall horses & Ponies & Foals: 10g per day.",
        "Complementary feeding stuff for horses that contains antioxidants, Vitamin C, Vitamin E, organic selenium, essential amino acids, DL-methionine and L-lysine. Particularly recommended for horses requiring a muscular vitality and top performance through regular and uninterrupted intense training and competition. Destined to support performance and vitality in horses in the presence of free radicals associated with intense training and exercise. \nPackaging size: 1800g bucket. \nUse: \nHorses: 20g per day; \nSmall horses & Ponies & Foals: 10g per day.",
        "A high concentrate of calcium, sodium and chloride electrolytes needed for healthy muscles function. \nPackaging size: 2000g bucket. \nUse: \nHorses: 50g per day; \nSmall horses & Ponies & Foals: 25g per day."
    ]
    
    var categorijasNumuriMusculi = [
        "0",
        "0",
        "0",
        "0",
        "0",
        "0",
        "0",
        "0",
        "0"
    ]
    
    
    
    //HIGH PERFORMANCE - tikai vēl cena
    var fhpCena = [
        50.0,
        50.0,
        4,
        4,
        4,
        4.0
    ]
    var fhpNames = [
        "Electrolyt 7 (1200g)",
        "Electrolyt 7 (3000g)",
        "Elytaan",
        "Energy Booster",
        "Elimination (1000g)",
        "Elimination (5000g)"
    ]
    var fhpUrl = [
        "https://www.equistro.com/products/equistror-electrolyt-7",
        "https://www.equistro.com/products/equistror-electrolyt-7",
        "https://www.equistro.com/products/equistror-elytaan",
        "https://www.equistro.com/products/equistror-energy-booster",
        "https://www.equistro.com/products/equistror-elimination",
        "https://www.equistro.com/products/equistror-elimination"
    ]
    var fhpImages = [
        "unnamed-13.imageset",
        "unnamed-13.imageset",
        "unnamed-15.imageset",
        "unnamed-16.imageset",
        "unnamed-14.imageset",
        "unnamed-14.imageset"
    ]
    var categorijasNumuriPerf = [
        "8",
        "8",
        "8",
        "8",
        "8",
        "8"
    ]
    var fhpApraksts = [
        "Dietetic feeding stuff containing a high concentration of electrolytes, vitamin E an readily assimilated vitamin C and zinc. ELECTROLYT 7 is particularly recommended during extreme physical exertion · physical capacity and sporting potential recovery · hot climates. \nPackaging size: 1200g bucket. \nUse: \nHorses: 40-120g per day.",
        "Dietetic feeding stuff containing a high concentration of electrolytes, vitamin E an readily assimilated vitamin C and zinc. ELECTROLYT 7 is particularly recommended during extreme physical exertion · physical capacity and sporting potential recovery · hot climates. \nPackaging size: 3000g bucket. \nUse: \nHorses: 40-120g per day.",
        "Liquid dietetic feeding stuff rich in electrolytes, readily assimilated trace elements (IPALIGO®), B vitamins and essential amino acids for horses. Helps compensate electrolyte loss in cases of heavy sweating following intense physical activity such as training and during competition, as well as aiding during the important recovery period. \nPackaging size: 1000ml bottle. \nUse: \nHorses: 20-40ml per day; \nPonies & Foals: 10-20ml over 1-3 days.",
        "Energy booster is particularly recommended for horses with an increased requirement for rapidly available energy, B vitamins and amino acids in exceptional situations. \nPackaging size: 20g in an oral syringe. \nUse: \nHorses: 0,5-1 oral syringe; \nSmall horses & Ponies & Foals: 0,25 oral syringe.",
        "A feeding stuff containing dandelion, artichoke and orthosiphon especially formulated to help enrich the diet of the horse, and support the nutritional diversity. To use: after exertion, at seasonal changes and particularly during spring, after a medical treatment. \nPackaging size: 1000g bucket. \nUse: \nHorses: 50-100g per day.",
        "A feeding stuff containing dandelion, artichoke and orthosiphon especially formulated to help enrich the diet of the horse, and support the nutritional diversity. To use: after exertion, at seasonal changes and particularly during spring, after a medical treatment. \nPackaging size: 5000g bucket. \nUse: \nHorses: 50-100g per day."
    ]
    var fhpComposition = [
        "unnamed-55.imageset",
        "unnamed-55.imageset",
        "unnamed-56.imageset",
        "unnamed-46.imageset",
        "unnamed-52.imageset",
        "unnamed-52.imageset"
    ]
    
    
    
    //NERVOUS SYSTEM - tikai vēl cena
    var fnsCena = [
        50.0,
        50.0
    ]
    var fnsNames = [
        "Betamag Forte",
        "Equiliser"
    ]
    var fnsUrl = [
        "https://www.equistro.com/products/equistror-betamag-forte",
        "https://www.equistro.com/products/equistror-equiliser"
    ]
    var fnsImages = [
        "unnamed-10.imageset",
        "unnamed-17.imageset"
    ]
    var categorijasNumuriNervo = [
        "7",
        "7"
    ]
    var fnsApraksts = [
        "BETAMAG Forte helps horses to feel more comfortable in unfamiliar situations and to control unpredictable. Magnesium is known as an important neural factor, and if in sufficient supply, will prevent the release of stress hormones in the body. Similarly like magnesium, zinc also plays an important role in stress, zinc levels dropping in stressful situations. The zinc requirement for horses of all ages is around 50 mg/kg feed. \nPackaging size: 1000g bottle. \nUse: \nHorses: 10ml 1-2x per day; \nPonies & Small horses: 5ml 1-2x per day.",
        "Feeding stuff that contains a readily assimilated organic magnesium, L-Tryptophan, and key B complex vitamins that helps reduce unwanted horse behavior in unusual situations as change in environment, such as travelling or whenerver the animal’s routine is altered. \nPackaging size: 500g bucket. \nUse: \nHorses: 20g per day; \nSmall horses & Ponies: 10g per day."
    ]
    var fnsComposition = [
        "unnamed-38.imageset",
        "unnamed-39.imageset"
    ]
    
    
    //VITAMINS AND MINERALS
    var vmCena = [
        50.0,
        50.0,
        4,
        4,
        4,
        4
    ]
    var vmNames = [
        "Mega Base (3000g)",
        "Mega Base (10000g)",
        "Mega Base Junior",
        "Mega Base Race",
        "Mega Base Maintenance",
        "Mega Base Fertility"
    ]
    var vmUrl = [
        "https://www.equistro.com/products/equistror-mega-base",
        "https://www.equistro.com/products/equistror-mega-base",
        "https://www.equistro.com/products/equistror-mega-base-junior",
        "https://www.equistro.com/products/equistror-mega-base-race",
        "https://www.equistro.com/products/equistror-mega-base-maintenance",
        "https://www.equistro.com/products/equistror-mega-base-fertility"
    ]
    
    var vmImages = [
        "unnamed-26.imageset",
        "unnamed-26.imageset",
        "unnamed-28.imageset",
        "unnamed-1.imageset",
        "unnamed.imageset",
        "unnamed-27.imageset"
    ]
    var categorijasNumuriVitMin = [
        "9",
        "9",
        "9",
        "9",
        "9",
        "9"
    ]
    var vmApraksts = [
        "Mineral feeding stuff for horses destined to help meet their nutrient requirements. Recommended for active healthy horses receiving a feed ration rich in cereals. MEGA BASE can help cover the basic needs in minerals for all horses, particularly those fed on concentrates (pellets…). By adapting the daily supply, the increasing needs are equally met during rearing or during the breaking-in period. \nPackaging size: 3000g bucket. \nUse: \nHorses: 50g per day; \nSmall horses & Ponies & Foals: 25g per day.",
        "Mineral feeding stuff for horses destined to help meet their nutrient requirements. Recommended for active healthy horses receiving a feed ration rich in cereals. MEGA BASE can help cover the basic needs in minerals for all horses, particularly those fed on concentrates (pellets…). By adapting the daily supply, the increasing needs are equally met during rearing or during the breaking-in period. \nPackaging size: 10000g bucket. \nUse: \nHorses: 50g per day; \nSmall horses & Ponies & Foals: 25g per day.",
        "Specially designed to meet the needs for a healthy musculo-skeletal and locomotor apparatus development. A mineral and vitamin supplement fortified with essential trace elements conceived for an optimal supplementation of the foal from 4 weeks  of age to weaning and beyond. For suckling foals and young horses. It supplies valuable minerals (calcium, phosphorus and magnesium), trace elements (IPALIGO®) and vitamins to meet the requirements pre and post weaning, a critical period for healthy growth and development. \nPackaging size: 1000ml bottle. \nUse: \nBroodmares: 20-40ml per day; \nNursing foals: 4th week of life 20ml 2x a week; 8th week of life 20ml 3x a week; from 12th week of life 20-40ml per day.",
        "Pelleted mineral complementary feeding stuff for race horses destined to help balance their ration. Particularly recommended for race and competition horses being fed a cereal rich diet. \nPackaging size: 5000g bucket. \nUse: \nHorses: 80-100g per day.",
        "Pelleted mineral complementary feeding stuff for horses being fed traditional ration destined to help balance the ration of mares, foals and horses at work. Particularly recommended for horses being fed traditional ration. \nPackaging size: 5000g bucket. \nUse: \nHorses: 80-100g per day.",
        "Pelleted mineral complementary feeding stuff particularly recommended for broodmares in the 3rd trimester of pregnancy and during lactation. MEGA BASE FERTILITY can equally be used in yearlings. \nPackaging size: 5000g bucket. \nUse: \nHorses: 80-100g per day."
    ]
    var vmComposition = [
        "unnamed-51.imageset",
        "unnamed-51.imageset",
        "unnamed-47.imageset",
        "unnamed-50.imageset",
        "unnamed-48.imageset",
        "unnamed-49.imageset"
    ]
    
    
    
    //MUSCULOSKELETAL SYSTEM - sis Ir!!! tikai cena vēl!!!
    var fmsCena = [
        50.0,
        50.0,
        4,
        4,
        4
    ]
    var fmsNames = [
        "Flexadin with UCII",
        "Chrysanphyton",
        "Artphyton (1500g)",
        "Artphyton (4500g)",
        "Cartiflex"
    ]
    var fmsUrl = [
        "https://www.equistro.com/products/equistror-flexadin",
        "https://www.equistro.com/products/equistror-chrysanphyton",
        "https://www.equistro.com/products/equistror-artphyton",
        "https://www.equistro.com/products/equistror-artphyton",
        "https://www.equistro.com/products/equistror-cartiflex"
    ]
    var fmsComposition = [
        "unnamed-42.imageset",
        "unnamed-43.imageset",
        "unnamed-44.imageset",
        "unnamed-44.imageset",
        "unnamed-45.imageset"
    ]
    var fmsImages = [
        "unnamed-20.imageset",
        "unnamed-12.imageset",
        "unnamed-7.imageset",
        "unnamed-7.imageset",
        "unnamed-11.imageset"
    ]
    var categorijasNumuriMusSystem = [
        "1",
        "1",
        "1",
        "1",
        "1"
    ]
    var fmsApraksts = [
        "The FLEXADIN with UCII® original formula is of particular interest for horses whose joint mechanism is subject to intense effort and regular exertion. Contains patented collagen, MSM and chelated manganese, chosen to support a lasting joint health and mobility. \nPackaging size: 600g bucket. \nUse: \nHorses: 10-15g per day.",
        "Complementary feeding stuff containing CHRYSANTHELLUM AMERICANUM. The horse’s feet are a major element of its locomotion. They are constantly solicited. For normal hooves function, a physiological blood circulation is essential. Some natural elements such as flavonoids present in most plants and especially in CHRYSANTHELLUM AMERICANUM, are known to help maintain a physiological blood circulation thanks to their antioxidative character and their key role as vessel protector. \nPackaging size: 2000g bucket. \nUse: \nHorses: 20g 2x per day.",
        "Pelleted complementary feeding stuff destined to support optimal joint function in horses. For horses, and notably older horses requiring healthy joint mobility and function. \nPackaging size: 1500g bucket. \nUse: \nHorses: 100-150g daily.",
        "Pelleted complementary feeding stuff destined to support optimal joint function in horses. For horses, and notably older horses requiring healthy joint mobility and function. \nPackaging size: 4500g bucket. \nUse: \nHorses: 100-150g daily.",
        "Cartiflex is a synergystic combination of green-lipped mussels, brown seaweed extract, omega-3 fatty acids, an the antioxidants vitamin E and selenium. \nPackaging size: 1000g bucket. \nUse: \nHorses: 15g 2x per day."
    ]
    
    
    //RESPIRATORY TRACK
    var frtCena = [
        50.0,
        50.0,
        4,
        4,
        4.0
    ]
    var frtNames = [
        "Respadril Aerosol",
        "Respadril Liquid (250ml)",
        "Respadril Liquid (1000ml)",
        "Secreta Pro Max (800g)",
        "Secreta Pro Max (2400g)"
    ]
    var frtUrl = [
        "https://www.equistro.com/products/equistror-respadril-aerosol",
        "https://www.equistro.com/products/equistror-respadril",
        "https://www.equistro.com/products/equistror-respadril",
        "https://www.equistro.com/products/equistror-secreta-pro-max",
        "https://www.equistro.com/products/equistror-secreta-pro-max"
    ]
    var frtComposition = [
        "unnamed-32.imageset",
        "unnamed-30.imageset",
        "unnamed-30.imageset",
        "unnamed-31.imageset",
        "unnamed-31.imageset"
    ]
    var frtImages = [
        "unnamed-3.imageset",
        "unnamed-4.imageset",
        "unnamed-4.imageset",
        "unnamed-5.imageset",
        "unnamed-5.imageset"
    ]
    var frtApraksts = [
        "Essential oils that support the respiratory function (e.g. ammonia). External use only. A specially conceived formulation for aerosol therapy in the horse. Rich in essential oils that support the respiratory function (e.g. ammonia). Acting directly on the lungs in horses affected by respiratory problems. \nPackaging size: 5x 10ml vials. \nUse: \nLiquid for use in conjuctions with a nebuliser.",
        "Liquid complementary feeding stuff for horses with a unique original combination of selected plants and readily assimilated copper (IPALIGO® trace element). Supports the normal function of the respiratory system. The extensively researched plants contained in RESPADRIL are known for their respiratory tract virtues. The aromatic essences and plant extracts can aid respiratory comfort allowing the horse to feed normally. Licorice can support the natural self-cleansing process and mucus formation in the upper and lower respiratory tract. Oregano, Pine and Eucalyptus aid the resistance and natural regeneration of the respiratory tract. Copper is a biological antioxidant and in RESPADRIL it is bound to amino acids, which ensure rapid assimilation. \nPackaging size: 250ml bottle. \nUse: \nHorses: 40ml per day for 5 days; \nSmall horses & Ponies & Foals: 20ml per day for 5 days.",
        "Liquid complementary feeding stuff for horses with a unique original combination of selected plants and readily assimilated copper (IPALIGO® trace element). Supports the normal function of the respiratory system. The extensively researched plants contained in RESPADRIL are known for their respiratory tract virtues. The aromatic essences and plant extracts can aid respiratory comfort allowing the horse to feed normally. Licorice can support the natural self-cleansing process and mucus formation in the upper and lower respiratory tract. Oregano, Pine and Eucalyptus aid the resistance and natural regeneration of the respiratory tract. Copper is a biological antioxidant and in RESPADRIL it is bound to amino acids, which ensure rapid assimilation. \nPackaging size: 1000ml bottle. \nUse: \nHorses: 40ml per day for 5 days; \nSmall horses & Ponies & Foals: 20ml per day for 5 days.",
        "Particularly recommended for horse’s requiring a clear airway and healthy respiratory system to optimize their well-being and performance. Formulation that combines the selection of herbs with the antioxidant Vitamin E in a biological form that supports the respiratory system. \nPackaging size: 800g bucket. \nUse: \nHorses: 10-20g per day; \nSmall horses & Ponies & Foals: 5-10g per day.",
        "Particularly recommended for horse’s requiring a clear airway and healthy respiratory system to optimize their well-being and performance. Formulation that combines the selection of herbs with the antioxidant Vitamin E in a biological form that supports the respiratory system. \nPackaging size: 2400g bucket. \nUse: \nHorses: 10-20g per day; \nSmall horses & Ponies & Foals: 5-10g per day."
    ]
    var categorijasNumuriResp = [
        "5",
        "5",
        "5",
        "5",
        "5"
    ]
    
    
    
    
    //BREEDING - tikai vēl cena
    var fbCena = [
        50.0,
        50.0
    ]
    var fbNames = [
        "B-Carotin",
        "Ipaligo Foal"
    ]
    var fbUrl = [
        "https://www.equistro.com/products/equistror-b-carotin",
        "https://www.equistro.com/products/equistror-ipaligo-foal"
    ]
    var fbImages = [
        "unnamed-9.imageset",
        "unnamed-22.imageset"
    ]
    var categorijasNumuriBreed = [
        "4",
        "4"
    ]
    var fbApraksts = [
        "Complementary feeding stuff for broodmares and stallions that contains ß-carotene, vitamins A and E, fatty acids and iron. ß-Carotin has been designed to help provide the essential vitamins and vitamin pre-cursors, notably 500 mg ß-carotene per day, which are necessary for optimal reproductive health in the run up period to and during the stud season, particularly during periods when fresh forage is less abundant. i.e. January -May. \nPackaging size: 3000g bucket. \nUse: \nBroodmares: 50g per day; \nStallions: 25-50g per day.",
        "Complementary feeding stuff rich in trace elements, vitamins and essential amino acids, to help meet the needs of the young foal until weaning. Is recommended as a means to help ensure the needs in essential trace elements and vitamins of the foal from birth to weaning are met during this vital period of development. \nPackaging size: 14g x3 oral syringes. \nUse: \nFoals: 1 oral syringe after foal birth; 1-2 oral syringe in next 3 weeks; 1 oral syringe in 2nd-6th month of foal's life."
    ]
    var fbComposition = [
        "unnamed-40.imageset",
        "unnamed-41.imageset"
    ]
    

    
    
    
    
    
}
