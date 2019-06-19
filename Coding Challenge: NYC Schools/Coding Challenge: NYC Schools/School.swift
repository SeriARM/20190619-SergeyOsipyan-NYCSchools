//
//  School.swift
//  Coding Challenge: NYC Schools
//
//  Created by Sergey Osipyan on 6/19/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import Foundation

// MARK: - SchoolElement

struct SchoolElement: Codable {
    let dbn, schoolName: String?
    let buildingCode, location, phoneNumber, faxNumber: String?
    let schoolEmail, website, subway: String?
    let bus, totalStudents: String?
    let latitude, longitude: String?
    
    enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case dbn
        case buildingCode = "building_code"
        case location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website, subway, bus
        case totalStudents = "total_students"
        case latitude, longitude
    }
    
}

//
//
//
//struct SchoolElement: Codable {
//    let dbn, schoolName: String?
//    let boro: Boro?
//    let overviewParagraph: String?
//    let school10ThSeats: School10ThSeats?
//    let academicopportunities1, academicopportunities2, ellPrograms, neighborhood: String?
//    let buildingCode, location, phoneNumber, faxNumber: String?
//    let schoolEmail: String?
//    let website: String?
//    let subway, bus: String?
//    let grades2018, finalgrades: Finalgrades?
//    let totalStudents, extracurricularActivities, schoolSports, attendanceRate: String?
//    let pctStuEnoughVariety, pctStuSafe, schoolAccessibilityDescription, directions1: String?
//    let requirement11, requirement21, requirement31, requirement41: String?
//    let requirement51, offerRate1, program1, code1: String?
//    let interest1: Interest1?
//    let method1: Method1?
//    let seats9Ge1: String?
//    let grade9Gefilledflag1: TartuGecko?
//    let grade9Geapplicants1, seats9Swd1: String?
//    let grade9Swdfilledflag1: TartuGecko?
//    let grade9Swdapplicants1, seats101, admissionspriority11, admissionspriority21: String?
//    let admissionspriority31, grade9Geapplicantsperseat1, grade9Swdapplicantsperseat1, primaryAddressLine1: String?
//    let city, zip: String?
//    let stateCode: StateCode?
//    let latitude, longitude, communityBoard, councilDistrict: String?
//    let censusTract, bin, bbl, nta: String?
//    let borough: Borough?
//    let academicopportunities3, languageClasses, addtlInfo1, transfer: String?
//    let eligibility1, academicopportunities4, academicopportunities5, diplomaendorsements: String?
//    let sharedSpace: Seats1010?
//    let startTime, endTime, psalSportsBoys, psalSportsGirls: String?
//    let psalSportsCoed, graduationRate, collegeCareerRate, girls: String?
//    let advancedplacementCourses, campusName, prgdesc1, admissionspriority41: String?
//    let pbat, international, program2, code2: String?
//    let interest2: Interest1?
//    let method2: Method1?
//    let seats9Ge2: String?
//    let grade9Gefilledflag2: TartuGecko?
//    let grade9Geapplicants2, seats9Swd2: String?
//    let grade9Swdfilledflag2: TartuGecko?
//    let grade9Swdapplicants2, seats102, eligibility2, grade9Geapplicantsperseat2: String?
//    let grade9Swdapplicantsperseat2, prgdesc2, prgdesc3, requirement12: String?
//    let requirement22, requirement32, offerRate2, program3: String?
//    let code3: String?
//    let interest3: Interest1?
//    let method3: Method1?
//    let seats9Ge3: String?
//    let grade9Gefilledflag3: TartuGecko?
//    let grade9Geapplicants3, seats9Swd3: String?
//    let grade9Swdfilledflag3: TartuGecko?
//    let grade9Swdapplicants3, seats103, admissionspriority12, admissionspriority13: String?
//    let admissionspriority22, grade9Geapplicantsperseat3, grade9Swdapplicantsperseat3, admissionspriority32: String?
//    let prgdesc4, prgdesc5, prgdesc6, requirement13: String?
//    let requirement14, requirement15, requirement16, requirement23: String?
//    let requirement24, requirement25, requirement26, requirement33: String?
//    let requirement34, requirement35, requirement36: Requirement3?
//    let requirement42, requirement43, requirement44, requirement45: String?
//    let requirement46, program4, program5, program6: String?
//    let code4, code5, code6: String?
//    let interest4, interest5, interest6: Interest1?
//    let method4, method5, method6: Method1?
//    let seats9Ge4, seats9Ge5, seats9Ge6: String?
//    let grade9Gefilledflag4, grade9Gefilledflag5, grade9Gefilledflag6: TartuGecko?
//    let grade9Geapplicants4, grade9Geapplicants5, grade9Geapplicants6, seats9Swd4: String?
//    let seats9Swd5, seats9Swd6: String?
//    let grade9Swdfilledflag4, grade9Swdfilledflag5, grade9Swdfilledflag6: TartuGecko?
//    let grade9Swdapplicants4, grade9Swdapplicants5, grade9Swdapplicants6, seats104: String?
//    let seats105, seats106, admissionspriority14, admissionspriority15: String?
//    let admissionspriority16, auditioninformation1, auditioninformation2, auditioninformation3: String?
//    let auditioninformation4, auditioninformation5, auditioninformation6, grade9Geapplicantsperseat4: String?
//    let grade9Geapplicantsperseat5, grade9Geapplicantsperseat6, grade9Swdapplicantsperseat4, grade9Swdapplicantsperseat5: String?
//    let grade9Swdapplicantsperseat6, earlycollege, admissionspriority51: String?
//    let admissionspriority61: Admissionspriority?
//    let offerRate3, offerRate4, admissionspriority23, admissionspriority24: String?
//    let ptech, offerRate5, offerRate6, program7: String?
//    let code7: String?
//    let interest7: Interest1?
//    let method7: Method1?
//    let seats9Ge7: String?
//    let grade9Gefilledflag7: TartuGecko?
//    let grade9Geapplicants7, seats9Swd7: String?
//    let grade9Swdfilledflag7: TartuGecko?
//    let grade9Swdapplicants7, seats107, admissionspriority17, admissionspriority25: String?
//    let admissionspriority26, admissionspriority34, admissionspriority44, grade9Geapplicantsperseat7: String?
//    let grade9Swdapplicantsperseat7, boys, directions2, requirement52: String?
//    let prgdesc7, directions7, requirement17, program8: String?
//    let code8: String?
//    let interest8: Interest1?
//    let method8: Method1?
//    let seats9Ge8: String?
//    let grade9Gefilledflag8: TartuGecko?
//    let grade9Geapplicants8, seats9Swd8: String?
//    let grade9Swdfilledflag8: TartuGecko?
//    let grade9Swdapplicants8, seats108, admissionspriority18, grade9Geapplicantsperseat8: String?
//    let grade9Swdapplicantsperseat8, commonAudition1, geoeligibility, specialized: String?
//    let seats1Specialized, applicants1Specialized, appperseat1Specialized, admissionspriority42: String?
//    let admissionspriority52: Admissionspriority?
//    let commonAudition4, commonAudition5, requirement53, requirement63: String?
//    let requirement27: String?
//    let requirement37: Requirement3?
//    let admissionspriority71: Admissionspriority?
//    let eligibility3: String?
//    let admissionspriority35: Admissionspriority?
//    let requirement62, requirement54, commonAudition2, directions3: String?
//    let directions4, admissionspriority33, admissionspriority36, admissionspriority46: String?
//    let admissionspriority56: Admissionspriority?
//    let commonAudition3, prgdesc8, admissionspriority27: String?
//    let admissionspriority37: Admissionspriority?
//    let admissionspriority54: String?
//    let admissionspriority64, admissionspriority74: Admissionspriority?
//    let requirement61, eligibility4, requirement47, requirement55: String?
//    let eligibility5, eligibility6, eligibility7, auditioninformation7: String?
//    let commonAudition6, commonAudition7, prgdesc9, prgdesc10: String?
//    let requirement18, requirement28: String?
//    let requirement38: Requirement3?
//    let offerRate7, offerRate8, offerRate9, program9: String?
//    let program10: Interest1?
//    let code9, code10: String?
//    let interest9, interest10: Interest1?
//    let method9, method10: Method1?
//    let seats9Ge9: String?
//    let seats9Ge10, grade9Gefilledflag9, grade9Gefilledflag10: TartuGecko?
//    let grade9Geapplicants9: String?
//    let grade9Geapplicants10: TartuGecko?
//    let seats9Swd9: String?
//    let seats9Swd10, grade9Swdfilledflag9, grade9Swdfilledflag10: TartuGecko?
//    let grade9Swdapplicants9: String?
//    let grade9Swdapplicants10: TartuGecko?
//    let seats109: String?
//    let seats1010: Seats1010?
//    let admissionspriority19, admissionspriority110, admissionspriority28: String?
//    let admissionspriority29: Admissionspriority?
//    let grade9Geapplicantsperseat9: String?
//    let grade9Geapplicantsperseat10: TartuGecko?
//    let grade9Swdapplicantsperseat9: String?
//    let grade9Swdapplicantsperseat10: TartuGecko?
//    let admissionspriority43, directions5, directions6: String?
//    let requirement56: Method1?
//    let seats2Specialized, seats3Specialized, seats4Specialized, seats5Specialized: String?
//    let seats6Specialized, applicants2Specialized, applicants3Specialized, applicants4Specialized: String?
//    let applicants5Specialized, applicants6Specialized, appperseat2Specialized, appperseat3Specialized: String?
//    let appperseat4Specialized, appperseat5Specialized, appperseat6Specialized: String?
//    let admissionspriority53, admissionspriority62, admissionspriority63: Admissionspriority?
//    let requirement57, requirement67: String?
//
//    enum CodingKeys: String, CodingKey {
//        case dbn
//        case schoolName = "school_name"
//        case boro
//        case overviewParagraph = "overview_paragraph"
//        case school10ThSeats = "school_10th_seats"
//        case academicopportunities1, academicopportunities2
//        case ellPrograms = "ell_programs"
//        case neighborhood
//        case buildingCode = "building_code"
//        case location
//        case phoneNumber = "phone_number"
//        case faxNumber = "fax_number"
//        case schoolEmail = "school_email"
//        case website, subway, bus, grades2018, finalgrades
//        case totalStudents = "total_students"
//        case extracurricularActivities = "extracurricular_activities"
//        case schoolSports = "school_sports"
//        case attendanceRate = "attendance_rate"
//        case pctStuEnoughVariety = "pct_stu_enough_variety"
//        case pctStuSafe = "pct_stu_safe"
//        case schoolAccessibilityDescription = "school_accessibility_description"
//        case directions1
//        case requirement11 = "requirement1_1"
//        case requirement21 = "requirement2_1"
//        case requirement31 = "requirement3_1"
//        case requirement41 = "requirement4_1"
//        case requirement51 = "requirement5_1"
//        case offerRate1 = "offer_rate1"
//        case program1, code1, interest1, method1
//        case seats9Ge1 = "seats9ge1"
//        case grade9Gefilledflag1 = "grade9gefilledflag1"
//        case grade9Geapplicants1 = "grade9geapplicants1"
//        case seats9Swd1 = "seats9swd1"
//        case grade9Swdfilledflag1 = "grade9swdfilledflag1"
//        case grade9Swdapplicants1 = "grade9swdapplicants1"
//        case seats101, admissionspriority11, admissionspriority21, admissionspriority31
//        case grade9Geapplicantsperseat1 = "grade9geapplicantsperseat1"
//        case grade9Swdapplicantsperseat1 = "grade9swdapplicantsperseat1"
//        case primaryAddressLine1 = "primary_address_line_1"
//        case city, zip
//        case stateCode = "state_code"
//        case latitude, longitude
//        case communityBoard = "community_board"
//        case councilDistrict = "council_district"
//        case censusTract = "census_tract"
//        case bin, bbl, nta, borough, academicopportunities3
//        case languageClasses = "language_classes"
//        case addtlInfo1 = "addtl_info1"
//        case transfer, eligibility1, academicopportunities4, academicopportunities5, diplomaendorsements
//        case sharedSpace = "shared_space"
//        case startTime = "start_time"
//        case endTime = "end_time"
//        case psalSportsBoys = "psal_sports_boys"
//        case psalSportsGirls = "psal_sports_girls"
//        case psalSportsCoed = "psal_sports_coed"
//        case graduationRate = "graduation_rate"
//        case collegeCareerRate = "college_career_rate"
//        case girls
//        case advancedplacementCourses = "advancedplacement_courses"
//        case campusName = "campus_name"
//        case prgdesc1, admissionspriority41, pbat, international, program2, code2, interest2, method2
//        case seats9Ge2 = "seats9ge2"
//        case grade9Gefilledflag2 = "grade9gefilledflag2"
//        case grade9Geapplicants2 = "grade9geapplicants2"
//        case seats9Swd2 = "seats9swd2"
//        case grade9Swdfilledflag2 = "grade9swdfilledflag2"
//        case grade9Swdapplicants2 = "grade9swdapplicants2"
//        case seats102, eligibility2
//        case grade9Geapplicantsperseat2 = "grade9geapplicantsperseat2"
//        case grade9Swdapplicantsperseat2 = "grade9swdapplicantsperseat2"
//        case prgdesc2, prgdesc3
//        case requirement12 = "requirement1_2"
//        case requirement22 = "requirement2_2"
//        case requirement32 = "requirement3_2"
//        case offerRate2 = "offer_rate2"
//        case program3, code3, interest3, method3
//        case seats9Ge3 = "seats9ge3"
//        case grade9Gefilledflag3 = "grade9gefilledflag3"
//        case grade9Geapplicants3 = "grade9geapplicants3"
//        case seats9Swd3 = "seats9swd3"
//        case grade9Swdfilledflag3 = "grade9swdfilledflag3"
//        case grade9Swdapplicants3 = "grade9swdapplicants3"
//        case seats103, admissionspriority12, admissionspriority13, admissionspriority22
//        case grade9Geapplicantsperseat3 = "grade9geapplicantsperseat3"
//        case grade9Swdapplicantsperseat3 = "grade9swdapplicantsperseat3"
//        case admissionspriority32, prgdesc4, prgdesc5, prgdesc6
//        case requirement13 = "requirement1_3"
//        case requirement14 = "requirement1_4"
//        case requirement15 = "requirement1_5"
//        case requirement16 = "requirement1_6"
//        case requirement23 = "requirement2_3"
//        case requirement24 = "requirement2_4"
//        case requirement25 = "requirement2_5"
//        case requirement26 = "requirement2_6"
//        case requirement33 = "requirement3_3"
//        case requirement34 = "requirement3_4"
//        case requirement35 = "requirement3_5"
//        case requirement36 = "requirement3_6"
//        case requirement42 = "requirement4_2"
//        case requirement43 = "requirement4_3"
//        case requirement44 = "requirement4_4"
//        case requirement45 = "requirement4_5"
//        case requirement46 = "requirement4_6"
//        case program4, program5, program6, code4, code5, code6, interest4, interest5, interest6, method4, method5, method6
//        case seats9Ge4 = "seats9ge4"
//        case seats9Ge5 = "seats9ge5"
//        case seats9Ge6 = "seats9ge6"
//        case grade9Gefilledflag4 = "grade9gefilledflag4"
//        case grade9Gefilledflag5 = "grade9gefilledflag5"
//        case grade9Gefilledflag6 = "grade9gefilledflag6"
//        case grade9Geapplicants4 = "grade9geapplicants4"
//        case grade9Geapplicants5 = "grade9geapplicants5"
//        case grade9Geapplicants6 = "grade9geapplicants6"
//        case seats9Swd4 = "seats9swd4"
//        case seats9Swd5 = "seats9swd5"
//        case seats9Swd6 = "seats9swd6"
//        case grade9Swdfilledflag4 = "grade9swdfilledflag4"
//        case grade9Swdfilledflag5 = "grade9swdfilledflag5"
//        case grade9Swdfilledflag6 = "grade9swdfilledflag6"
//        case grade9Swdapplicants4 = "grade9swdapplicants4"
//        case grade9Swdapplicants5 = "grade9swdapplicants5"
//        case grade9Swdapplicants6 = "grade9swdapplicants6"
//        case seats104, seats105, seats106, admissionspriority14, admissionspriority15, admissionspriority16, auditioninformation1, auditioninformation2, auditioninformation3, auditioninformation4, auditioninformation5, auditioninformation6
//        case grade9Geapplicantsperseat4 = "grade9geapplicantsperseat4"
//        case grade9Geapplicantsperseat5 = "grade9geapplicantsperseat5"
//        case grade9Geapplicantsperseat6 = "grade9geapplicantsperseat6"
//        case grade9Swdapplicantsperseat4 = "grade9swdapplicantsperseat4"
//        case grade9Swdapplicantsperseat5 = "grade9swdapplicantsperseat5"
//        case grade9Swdapplicantsperseat6 = "grade9swdapplicantsperseat6"
//        case earlycollege, admissionspriority51, admissionspriority61
//        case offerRate3 = "offer_rate3"
//        case offerRate4 = "offer_rate4"
//        case admissionspriority23, admissionspriority24, ptech
//        case offerRate5 = "offer_rate5"
//        case offerRate6 = "offer_rate6"
//        case program7, code7, interest7, method7
//        case seats9Ge7 = "seats9ge7"
//        case grade9Gefilledflag7 = "grade9gefilledflag7"
//        case grade9Geapplicants7 = "grade9geapplicants7"
//        case seats9Swd7 = "seats9swd7"
//        case grade9Swdfilledflag7 = "grade9swdfilledflag7"
//        case grade9Swdapplicants7 = "grade9swdapplicants7"
//        case seats107, admissionspriority17, admissionspriority25, admissionspriority26, admissionspriority34, admissionspriority44
//        case grade9Geapplicantsperseat7 = "grade9geapplicantsperseat7"
//        case grade9Swdapplicantsperseat7 = "grade9swdapplicantsperseat7"
//        case boys, directions2
//        case requirement52 = "requirement5_2"
//        case prgdesc7, directions7
//        case requirement17 = "requirement1_7"
//        case program8, code8, interest8, method8
//        case seats9Ge8 = "seats9ge8"
//        case grade9Gefilledflag8 = "grade9gefilledflag8"
//        case grade9Geapplicants8 = "grade9geapplicants8"
//        case seats9Swd8 = "seats9swd8"
//        case grade9Swdfilledflag8 = "grade9swdfilledflag8"
//        case grade9Swdapplicants8 = "grade9swdapplicants8"
//        case seats108, admissionspriority18
//        case grade9Geapplicantsperseat8 = "grade9geapplicantsperseat8"
//        case grade9Swdapplicantsperseat8 = "grade9swdapplicantsperseat8"
//        case commonAudition1 = "common_audition1"
//        case geoeligibility, specialized
//        case seats1Specialized = "seats1specialized"
//        case applicants1Specialized = "applicants1specialized"
//        case appperseat1Specialized = "appperseat1specialized"
//        case admissionspriority42, admissionspriority52
//        case commonAudition4 = "common_audition4"
//        case commonAudition5 = "common_audition5"
//        case requirement53 = "requirement5_3"
//        case requirement63 = "requirement6_3"
//        case requirement27 = "requirement2_7"
//        case requirement37 = "requirement3_7"
//        case admissionspriority71, eligibility3, admissionspriority35
//        case requirement62 = "requirement6_2"
//        case requirement54 = "requirement5_4"
//        case commonAudition2 = "common_audition2"
//        case directions3, directions4, admissionspriority33, admissionspriority36, admissionspriority46, admissionspriority56
//        case commonAudition3 = "common_audition3"
//        case prgdesc8, admissionspriority27, admissionspriority37, admissionspriority54, admissionspriority64, admissionspriority74
//        case requirement61 = "requirement6_1"
//        case eligibility4
//        case requirement47 = "requirement4_7"
//        case requirement55 = "requirement5_5"
//        case eligibility5, eligibility6, eligibility7, auditioninformation7
//        case commonAudition6 = "common_audition6"
//        case commonAudition7 = "common_audition7"
//        case prgdesc9, prgdesc10
//        case requirement18 = "requirement1_8"
//        case requirement28 = "requirement2_8"
//        case requirement38 = "requirement3_8"
//        case offerRate7 = "offer_rate7"
//        case offerRate8 = "offer_rate8"
//        case offerRate9 = "offer_rate9"
//        case program9, program10, code9, code10, interest9, interest10, method9, method10
//        case seats9Ge9 = "seats9ge9"
//        case seats9Ge10 = "seats9ge10"
//        case grade9Gefilledflag9 = "grade9gefilledflag9"
//        case grade9Gefilledflag10 = "grade9gefilledflag10"
//        case grade9Geapplicants9 = "grade9geapplicants9"
//        case grade9Geapplicants10 = "grade9geapplicants10"
//        case seats9Swd9 = "seats9swd9"
//        case seats9Swd10 = "seats9swd10"
//        case grade9Swdfilledflag9 = "grade9swdfilledflag9"
//        case grade9Swdfilledflag10 = "grade9swdfilledflag10"
//        case grade9Swdapplicants9 = "grade9swdapplicants9"
//        case grade9Swdapplicants10 = "grade9swdapplicants10"
//        case seats109, seats1010, admissionspriority19, admissionspriority110, admissionspriority28, admissionspriority29
//        case grade9Geapplicantsperseat9 = "grade9geapplicantsperseat9"
//        case grade9Geapplicantsperseat10 = "grade9geapplicantsperseat10"
//        case grade9Swdapplicantsperseat9 = "grade9swdapplicantsperseat9"
//        case grade9Swdapplicantsperseat10 = "grade9swdapplicantsperseat10"
//        case admissionspriority43, directions5, directions6
//        case requirement56 = "requirement5_6"
//        case seats2Specialized = "seats2specialized"
//        case seats3Specialized = "seats3specialized"
//        case seats4Specialized = "seats4specialized"
//        case seats5Specialized = "seats5specialized"
//        case seats6Specialized = "seats6specialized"
//        case applicants2Specialized = "applicants2specialized"
//        case applicants3Specialized = "applicants3specialized"
//        case applicants4Specialized = "applicants4specialized"
//        case applicants5Specialized = "applicants5specialized"
//        case applicants6Specialized = "applicants6specialized"
//        case appperseat2Specialized = "appperseat2specialized"
//        case appperseat3Specialized = "appperseat3specialized"
//        case appperseat4Specialized = "appperseat4specialized"
//        case appperseat5Specialized = "appperseat5specialized"
//        case appperseat6Specialized = "appperseat6specialized"
//        case admissionspriority53, admissionspriority62, admissionspriority63
//        case requirement57 = "requirement5_7"
//        case requirement67 = "requirement6_7"
//    }
//}
//
//enum Admissionspriority: String, Codable {
//    case thenToBrooklynStudentsOrResidents = "Then to Brooklyn students or residents"
//    case thenToNewYorkCityResidents = "Then to New York City residents"
//    case thenToQueensStudentsOrResidents = "Then to Queens students or residents"
//}
//
//enum Boro: String, Codable {
//    case k = "K"
//    case m = "M"
//    case q = "Q"
//    case r = "R"
//    case x = "X"
//}
//
//enum Borough: String, Codable {
//    case bronx = "BRONX    "
//    case brooklyn = "BROOKLYN "
//    case manhattan = "MANHATTAN"
//    case queens = "QUEENS   "
//    case statenIs = "STATEN IS"
//}
//
//enum Finalgrades: String, Codable {
//    case finalgrades912 = "9-12 "
//    case k12 = "K-12"
//    case pk12 = "PK-12"
//    case pk3612 = "PK-3, 6-12"
//    case schoolIsStructuredOnCreditNeedsNotGradeLevel = "School is structured on credit needs, not grade level"
//    case the610 = "6-10"
//    case the611 = "6-11"
//    case the612 = "6-12"
//    case the712 = "7-12"
//    case the812 = "8-12"
//    case the912 = "9-12"
//    case the914 = "9-14"
//}
//
//enum TartuGecko: String, Codable {
//    case n = "N"
//    case nA = "N/A"
//    case y = "Y"
//}
//
//enum Interest1: String, Codable {
//    case animalScience = "Animal Science"
//    case architecture = "Architecture"
//    case business = "Business"
//    case communications = "Communications"
//    case computerScienceTechnology = "Computer Science & Technology"
//    case cosmetology = "Cosmetology"
//    case culinaryArts = "Culinary Arts"
//    case engineering = "Engineering"
//    case environmentalScience = "Environmental Science"
//    case filmVideo = "Film/Video"
//    case healthProfessions = "Health Professions"
//    case hospitalityTravelAndTourism = "Hospitality, Travel and Tourism"
//    case humanitiesInterdisciplinary = "Humanities & Interdisciplinary"
//    case interest1PerformingArtsVisualArtDesign = "Performing Arts/ Visual Art & Design"
//    case jrotc = "JROTC"
//    case lawGovernment = "Law & Government"
//    case performingArts = "Performing Arts"
//    case performingArtsVisualArtDesign = "Performing Arts/Visual Art & Design"
//    case scienceMath = "Science & Math"
//    case teaching = "Teaching"
//    case visualArtDesign = "Visual Art & Design"
//    case zoned = "Zoned"
//}
//
//enum Method1: String, Codable {
//    case audition = "Audition"
//    case edOpt = "Ed. Opt."
//    case forContinuing8ThGraders = "For Continuing 8th Graders"
//    case limitedUnscreened = "Limited Unscreened"
//    case screened = "Screened"
//    case screenedLanguage = "Screened: Language"
//    case screenedLanguageAcademics = "Screened: Language & Academics"
//    case test = "Test"
//    case unscreened = "Unscreened"
//    case zonedGuarantee = "Zoned Guarantee"
//    case zonedPriority = "Zoned Priority"
//}
//
//enum Requirement3: String, Codable {
//    case artComparision = "Art Comparision"
//    case attendance = "Attendance"
//    case attendanceAndPunctuality = "Attendance and Punctuality"
//    case audition = "Audition"
//}
//
//enum School10ThSeats: Codable {
//    case integer(Int)
//    case string(String)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(Int.self) {
//            self = .integer(x)
//            return
//        }
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        throw DecodingError.typeMismatch(School10ThSeats.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for School10ThSeats"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .integer(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//enum Seats1010: String, Codable {
//    case yes = "Yes"
//}
//
//enum StateCode: String, Codable {
//    case ny = "NY"
//}
//
//typealias School = [SchoolElement]
