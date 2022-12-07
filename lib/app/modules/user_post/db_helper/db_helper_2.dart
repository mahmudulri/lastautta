// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:umoja/Floor%20database/sqfdbmodels/addclientsqfmodel.dart';
// import 'package:umoja/Floor%20database/sqfdbmodels/addgroupsqfmodel.dart';
// import 'package:umoja/Group/PendingGroup.dart';
// import 'package:umoja/model/Loan.dart';
//
// import '../model/AllMemberListModel.dart';
// import '../model/ClientListForLoan.dart';
// import '../model/CollectionGroupDetailsModel.dart';
// import '../model/DraftLoanAmortizationGroupModel.dart';
// import '../model/DurationListModel.dart';
// import '../model/GroupListForClientAdd.dart';
// import '../model/GroupListForClientAddMini.dart';
// import '../model/LoanAmortizationGroupModel.dart';
// import '../model/LoanApplyForSqfModel.dart';
// import '../model/LoanInfoForLoanApplicationModel.dart';
// import '../model/LoanSchemeModel.dart';
// import '../model/NonCollectionDataModel.dart';
// import '../model/NonCollectionModel.dart';
// import '../model/Occupations.dart';
// import '../model/PendingGroupList.dart';
//
// class DatabaseHelper {
//   static DatabaseHelper? _databaseHelper;
//   static Database? _database;
//
//   var tableAddMember = "TableAddMember";
//   var allLoanTypeTable = "AllLoanTypeTable";
//   var clientListForLoanTable = "clientListForLoanTable";
//   var groupListForMemberAdmissionTable = "GroupListForMemberAdmissionTable";
//   var occupationsListTable = "OccupationsListTable";
//   var approvedGroupListTable = "ApprovedGroupListTable";
//   var dayGroupListByUserNameTable = "DayGroupListByUserNameTable";
//   var loanCollectionDetailsTable = "LoanCollectionDetailsTable";
//   var loanAmortizationByGroupTable = "LoanAmortizationByGroupTable";
//   var draftDayGroupListByUserNameTable = "DraftDayGroupListByUserNameTable";
//   var draftLoanAmortizationByGroupTable = "DraftLoanAmortizationByGroupTable";
//   var draftLoanCollectionDetailsTable = "DraftLoanCollectionDetailsTable";
//   var allMemberListTable = "AllMemberListTable";
//   var allDurationListTable = "AllDurationListTable";
//   var allLoanSchemeTable = "AllLoanSchemeTable";
//   var allLoanInformation = "AllLoanInformation";
//   var draftLoanApplicationTable = "DraftLoanApplicationTable";
//   var draftNonCollectionTable = "DraftNonCollectionTable";
//   var draftAdvanceCollectionTable = "DraftAdvanceCollectionTable";
//   var nonCollectionDataListTable = "NonCollectionDataListTable";
//   var advanceCollectionDataListTable = "AdvanceCollectionDataListTable";
//
//
//   DatabaseHelper._createInstance();
//
//   factory DatabaseHelper() {
//     if (_databaseHelper == null) {
//       _databaseHelper = DatabaseHelper._createInstance();
//     }
//     return _databaseHelper!;
//   }
//
//   Future<Database?> get database async {
//     if (_database != null) {
//       return _database;
//     }
//     _database = await initializeDatabase();
//     return _database;
//   }
//
//   Future<Database> initializeDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + "sqfdatabase.db";
//
//     var sqfDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
//
//     return sqfDatabase;
//   }
//
//   void _createDb(Database db, int newVersion) async {
//     final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     final boolType = 'BOOLEAN NOT NULL';
//     final textType = 'TEXT';
//     final intType = 'INTEGER';
//     final doubleType = 'REAL';
//
//     await db.execute('''
//     CREATE TABLE tableAddGroups (
//     id $idType,
//     groupName $textType,
//     username $textType,
//     branchId $intType,
//     groupCode $textType,
//     branch $textType,
//     days $textType,
//     frequency $textType,
//     location $textType,
//     startTime $textType,
//     loanTypeId $intType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $tableAddMember (
//     aiId $idType,
//     Id $intType,
//     groupId $intType,
//     loanTypeId $intType,
//     newClientCode $textType,
//     firstName $textType,
//     lastName $textType,
//     mobileNo $textType,
//     mobileNo2 $textType,
//     occupationId $intType,
//     passbookFee $doubleType,
//     dateOfBirth $textType,
//     NIDNoC $textType,
//     gender $textType,
//     email $textType,
//     Identifier $textType,
//     maritalStatus $textType,
//     spouseName $textType,
//     spouseMobileNo $textType,
//     fatherName $textType,
//     fatherMobileNo $textType,
//     motherName $textType,
//     motherMobileNo $textType,
//     loEmpId $intType,
//     residenceCounty $textType,
//     residenceSubcounty $textType,
//     residenceDivision $textType,
//     residenceDistrict $textType,
//     residenceVillage $textType,
//     residenceNotes $textType,
//     workCounty $textType,
//     workSubcounty $textType,
//     workDivision $textType,
//     workDistrict $textType,
//     workVillage $textType,
//     workNotes $textType,
//     Refname $textType,
//     organization $textType,
//     contact $textType,
//     emailreference $textType,
//     relationshipId $intType,
//     designationreference $textType,
//     sourceCat $textType,
//     sourceCategoryId $textType,
//     sourceAmount $textType,
//     gsource $textType,
//     branchId $intType,
//     grelationId $intType,
//     gname $textType,
//     gmobile $textType,
//     gemail $textType,
//     gnid  $textType,
//     gvillage1 $textType,
//     gsubcounty1 $textType,
//     gcounty1 $textType,
//     gdivision1 $textType,
//     gnote1 $textType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $groupListForMemberAdmissionTable  (
//     aiId $idType,
//     groupName $textType,
//     Id $intType,
//     loanTypeId $intType,
//     loanType $textType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $occupationsListTable  (
//     aiId $idType,
//     name $textType,
//     shortName $textType,
//     status $intType,
//     Id $intType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $allLoanTypeTable  (
//     aiId $idType,
//     name $textType,
//     Id $intType,
//     admissionFee $doubleType,
//     passbookFee $doubleType
//     )
//     ''');
//
//     // int? aiId;
//     // int? Id;
//     // int? groupId;
//     // String? clientName;
//     // String? clientCode;
//     // String? gender;
//     // String? NIDNo;
//     // String? loanType;
//
//     await db.execute('''
//     CREATE TABLE $clientListForLoanTable  (
//     aiId $idType,
//     Id $intType,
//     groupId $intType,
//     clientName $textType,
//     clientCode $textType,
//     gender $textType,
//     NIDNo $textType,
//     loanType $textType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $approvedGroupListTable  (
//     aiId $idType,
//     Id $intType,
//     groupCode $textType,
//     groupName $textType,
//     dayName $textType,
//     meetingTime $textType,
//     frequency $textType,
//     meetingAddress $textType,
//     branchName $textType,
//     status $textType,
//     firstName $textType,
//     lastName $textType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $dayGroupListByUserNameTable  (
//     aiId $idType,
//     Id $intType,
//     groupCode $textType,
//     groupName $textType,
//     dayName $textType,
//     meetingTime $textType,
//     frequency $textType,
//     meetingAddress $textType,
//     branchName $textType,
//     status $textType,
//     firstName $textType,
//     lastName $textType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $draftDayGroupListByUserNameTable  (
//     aiId $idType,
//     Id $intType,
//     groupCode $textType,
//     groupName $textType,
//     dayName $textType,
//     meetingTime $textType,
//     frequency $textType,
//     meetingAddress $textType,
//     branchName $textType,
//     status $textType,
//     firstName $textType,
//     lastName $textType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $loanCollectionDetailsTable  (
//     aiId $idType,
//     groupId $intType,
//     todayCollection $doubleType,
//     PreviousOverdue $doubleType,
//     todayTarget $doubleType,
//     todaysrealization $doubleType,
//     todayDate $textType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $draftLoanCollectionDetailsTable  (
//     aiId $idType,
//     groupId $intType,
//     todayCollection $doubleType,
//     PreviousOverdue $doubleType,
//     todayTarget $doubleType,
//     todaysrealization $doubleType,
//     todayDate $textType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $loanAmortizationByGroupTable  (
//     aiId $idType,
//     Id $intType,
//     clientId $intType,
//     clientCode $textType,
//     firstName $textType,
//     lastName $textType,
//     branchId $intType,
//     branchUnitName $textType,
//     groupInfoId $intType,
//     groupName $textType,
//     loanManagementId $intType,
//     effectiveDate $textType,
//     PI $intType,
//     PPMT $doubleType,
//     IPMT $doubleType,
//     PMT $doubleType,
//     collection $doubleType,
//     Overdue $doubleType,
//     Total_Target $doubleType,
//     isCollected $intType,
//     cycle $intType,
//     loanNo $textType,
//     loanOfficerId $intType,
//     loanOfficerName $textType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $draftLoanAmortizationByGroupTable  (
//     aiId $idType,
//     Id $intType,
//     clientId $intType,
//     clientCode $textType,
//     firstName $textType,
//     lastName $textType,
//     branchId $intType,
//     branchUnitName $textType,
//     groupInfoId $intType,
//     groupName $textType,
//     loanManagementId $intType,
//     effectiveDate $textType,
//     PI $intType,
//     PPMT $doubleType,
//     IPMT $doubleType,
//     PMT $doubleType,
//     collection $doubleType,
//     Overdue $doubleType,
//     Total_Target $doubleType,
//     isCollected $intType,
//     cycle $intType,
//     loanNo $textType,
//     loanOfficerId $intType,
//     loanOfficerName $textType
//     )
//     ''');
//
//
//     await db.execute('''
//     CREATE TABLE $allMemberListTable  (
//     aiId $idType,
//     clientCode $textType,
//     firstName $textType,
//     lastName $textType,
//     occupationId $intType,
//     occupation $textType,
//     dateOfBirth $textType,
//     gender $textType,
//     mobileNo $textType,
//     mobile1varified $intType,
//     mobileNo2 $textType,
//     mobile2varified $intType,
//     email $textType,
//     emailvarified $intType,
//     NIDNo $textType,
//     Identifier $textType,
//     fatherName $textType,
//     fatherMobileNo $textType,
//     motherName $textType,
//     motherMobileNo $textType,
//     maritalStatus $textType,
//     spouseName $textType,
//     spouseMobileNo $textType,
//     ClientPhoto $textType,
//     NIDPhoto $textType,
//     signatureUrl $textType,
//     yearlyIncome $doubleType,
//     groupInfoId $intType,
//     groupInfo $textType,
//     branchId $intType,
//     branch $textType,
//     loanOfficerId $intType,
//     loanOfficer $textType,
//     loanOfficername $textType,
//     loanTypeId $intType,
//     lastUpdated $textType,
//     securityBalance $doubleType,
//     passbookFee $doubleType,
//     addmissionFee $doubleType,
//     admissionDate $textType,
//     clientType $textType,
//     status $intType,
//     isBanned $intType,
//     bannedRemarks $textType,
//     Id $intType,
//     isDelete $intType
//     )
//     ''');
//
//
//
//     await db.execute('''
//     CREATE TABLE $allDurationListTable  (
//     aiId $idType,
//     loanTypeId $intType,
//     duration $intType,
//     durationCategoryId $intType,
//     durationCategory $textType,
//     percentage $doubleType,
//     serviceCharge $doubleType,
//     installment $doubleType,
//     PerAmount $doubleType,
//     interestPerDay $doubleType,
//     status $intType,
//     Id $intType,
//     isDelete $intType
//     )
//     ''');
//
//
//     await db.execute('''
//     CREATE TABLE $allLoanSchemeTable  (
//     aiId $idType,
//     SchemeName $textType,
//     SchemeCode $intType,
//     schemedate $textType,
//     LoanSectorId $intType,
//     status $intType,
//     Id $intType,
//     isDelete $intType,
//     createdAt $textType,
//     updatedAt $textType,
//     createdBy $textType,
//     updatedBy $textType
//     )
//     ''');
//
//
//     await db.execute('''
//     CREATE TABLE $allLoanInformation  (
//     aiId $idType,
//     loanNo $textType,
//     clientInfoId $intType,
//     clientInfo $textType,
//     branchId $intType,
//     branch $textType,
//     groupInfoId $intType,
//     groupInfo $textType,
//     loanPurpose $textType,
//     newOfferComment $textType,
//     loanTypeId $intType,
//     loanType $textType,
//     loanTypeDetailsId $intType,
//     loanTypeDetails $textType,
//     interestRate $doubleType,
//     cycle $intType,
//     loanAmount $doubleType,
//     isConsent $intType,
//     loanOfficerId $intType,
//     loanOfficer $textType,
//     approveStatus $intType,
//     applicationDate $textType,
//     firstInstallmentDate $textType,
//     disbursementDate $textType,
//     disbursementBy $textType,
//     loanSchemeId $intType,
//     loanScheme $textType,
//     installmentAmount $doubleType,
//     installmentPeriod $intType,
//     note $textType,
//     expectedSettlementDate $textType,
//     expectedDate $textType,
//     isActive $intType,
//     InterestTotal $doubleType,
//     TotalPayment $doubleType,
//     LoanProcessingFee $doubleType,
//     LoanInsuranceFee $doubleType,
//     MemberPassbookfee $doubleType,
//     photoLoan $textType,
//     signatureLoan $textType,
//     securityAmount $doubleType,
//     securityReturnStatus $intType,
//     securityReturnDate $textType,
//     SettlementDate $textType,
//     IsSettled $intType,
//     Id $intType,
//     isDelete $intType
//     )
//     ''');
//
//
//
//     await db.execute('''
//     CREATE TABLE $draftLoanApplicationTable  (
//     aiId $idType,
//     username $textType,
//     personName $textType,
//     clientInfoId $intType,
//     loanNo $textType,
//     loanAmount $doubleType,
//     cycle $intType,
//     interestRate $doubleType,
//     loanTypeId $intType,
//     loanDurationId $intType,
//     loanPurpose $textType,
//     isConsent $intType,
//     loanSchemeId $intType,
//     installmentPeriod $intType
//     )
//     ''');
//
//
//     await db.execute('''
//     CREATE TABLE $draftNonCollectionTable  (
//     aiId $idType,
//     name $textType,
//     loanId $intType,
//     businessDate $textType,
//     collectionAmount $doubleType,
//     collectedBy $textType
//     )
//     ''');
//
//
//     await db.execute('''
//     CREATE TABLE $draftAdvanceCollectionTable  (
//     aiId $idType,
//     name $textType,
//     loanId $intType,
//     businessDate $textType,
//     collectionAmount $doubleType,
//     collectedBy $textType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $nonCollectionDataListTable  (
//     aiId $idType,
//     clientId $intType,
//     CollectionAmount $doubleType,
//     Overdue $doubleType,
//     totalOutstanding $doubleType
//     )
//     ''');
//
//     await db.execute('''
//     CREATE TABLE $advanceCollectionDataListTable  (
//     aiId $idType,
//     clientId $intType,
//     CollectionAmount $doubleType,
//     Overdue $doubleType,
//     totalOutstanding $doubleType
//     )
//     ''');
//
//   }
//
//   ///read
//
//   //read all draft group
//   Future<List<DatumAddGroupForSqf>> readAllDraftGroup() async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query("tableAddGroups", orderBy: orderByq);
//     return result.map((json) => DatumAddGroupForSqf.fromJson(json)).toList();
//   }
//
//   //read all draft client
//   Future<List<DatumAddClientForSqf>> readAllDraftClient() async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query(tableAddMember, orderBy: orderByq);
//     return result.map((json) => DatumAddClientForSqf.fromJson(json)).toList();
//   }
//
//   //read all group list fot add member
//   Future<List<GroupListForClientAddMiniModel>>
//   readAllGroupListForMemberAdmission() async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query(groupListForMemberAdmissionTable);
//     return result
//         .map((json) => GroupListForClientAddMiniModel.fromJson(json))
//         .toList();
//   }
//
//   //read all occupation
//   Future<List<Occupations>> readAllOccupation() async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query(occupationsListTable);
//     return result.map((json) => Occupations.fromJson(json)).toList();
//   }
//
//   //read all loan type
//   Future<List<Loan>> readAllLoanType() async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query(allLoanTypeTable);
//     return result.map((json) => Loan.fromJson(json)).toList();
//   }
//
//   Future<List<Loan>> readSpecificLoanType(loanTypeId) async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query(allLoanTypeTable, where: 'Id = ?', whereArgs: [loanTypeId]);
//     return result.map((json) => Loan.fromJson(json)).toList();
//   }
//
//   //read client for load admission for groupId
//   Future<List<ClientListForLoan>> readSpecificClientsForAGroup(groupId) async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query(clientListForLoanTable,
//         where: 'groupId = ?', whereArgs: [groupId]);
//     return result.map((json) => ClientListForLoan.fromJson(json)).toList();
//   }
//
//   //read all DayGroupListByUserName
//   Future<List<PendingGroupList>> readAllGetDayGroupListByUserName() async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query(dayGroupListByUserNameTable);
//     return result.map((json) => PendingGroupList.fromJson(json)).toList();
//   }
//
//   //read all Approved Group  List
//   Future<List<PendingGroupList>> readAllApprovedGroupList() async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query(approvedGroupListTable);
//     return result.map((json) => PendingGroupList.fromJson(json)).toList();
//   }
//
//   //read specific DayGroupListByUserName
//   Future<List<PendingGroupList>> readSpecificGetDayGroupListByUserName(
//       groupId) async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query(dayGroupListByUserNameTable,
//         where: 'Id = ?', whereArgs: [groupId]);
//     return result.map((json) => PendingGroupList.fromJson(json)).toList();
//   }
//
//
//   //read all draft DayGroupListByUserName
//   Future<List<PendingGroupList>> readAllDraftGetDayGroupListByUserName() async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     // final rawqresult = await db.rawQuery('SELECT * FROM $tableFavorites ORDER BY $orderByq');
//     final result = await db!.query(draftDayGroupListByUserNameTable);
//     return result.map((json) => PendingGroupList.fromJson(json)).toList();
//   }
//
//   //read group collection details
//   Future<List<CollectionGroupDetailsModel>> readAllLoanCollectionDetailsTable(
//       groupId) async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     final result = await db!.query(loanCollectionDetailsTable,
//         where: 'groupId = ?', whereArgs: [groupId]);
//     // print("3---------> "+result.toString());
//     return result
//         .map((json) => CollectionGroupDetailsModel.fromJson(json))
//         .toList();
//   }
//
//   //read group collection details
//   Future<List<CollectionGroupDetailsModel>> readAllLoanCollectionDetailsTableDashboard() async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     final result = await db!.query(loanCollectionDetailsTable);
//     // print("3---------> "+result.toString());
//     return result
//         .map((json) => CollectionGroupDetailsModel.fromJson(json))
//         .toList();
//   }
//
//   //read group collection details draft page
//   Future<List<CollectionGroupDetailsModel>> readAllLoanCollectionDetailsTableDraftPage() async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     final result = await db!.query(draftLoanCollectionDetailsTable);
//     // print("3---------> "+result.toString());
//     return result
//         .map((json) => CollectionGroupDetailsModel.fromJson(json))
//         .toList();
//   }
//
//   //read draft group collection details
//   Future<List<CollectionGroupDetailsModel>>
//   readAllDraftLoanCollectionDetailsTable(groupId) async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//     final result = await db!.query(draftLoanCollectionDetailsTable,
//         where: 'groupId = ?', whereArgs: [groupId]);
//     // print("3---------> "+result.toString());
//     return result
//         .map((json) => CollectionGroupDetailsModel.fromJson(json))
//         .toList();
//   }
//
//   //read Loan Amortization By Group
//   Future<List<LoanAmortizationByGroupModel>>
//   readAllLoanAmortizationByGroupTable(groupId) async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//
//     final result = await db!.query(loanAmortizationByGroupTable,
//         where: 'groupInfoId = ?', whereArgs: [groupId]);
//
//     // print("3---------> "+result.toString());
//
//     return result
//         .map((json) => LoanAmortizationByGroupModel.fromJson(json))
//         .toList();
//   }
//
//   //read draft Loan Amortization By Group
//   Future<List<DraftLoanAmortizationByGroupModel>>
//   readAllDraftLoanAmortizationByGroupTable(groupId) async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//
//     final result = await db!.query(draftLoanAmortizationByGroupTable,
//         where: 'groupInfoId = ?', whereArgs: [groupId]);
//     // print("3---------> "+result.toString());
//     return result
//         .map((json) => DraftLoanAmortizationByGroupModel.fromJson(json))
//         .toList();
//   }
//
//
//   //read member list for loan application by group id
//   Future<List<AllMemberListModel>>
//   readMemberListByGroupIDForLoanApplication(groupId) async {
//     final db = await this.database;
//     final orderByq = 'id ASC';
//
//     final result = await db!.query(allMemberListTable,
//         where: 'groupInfoId = ?', whereArgs: [groupId]);
//     print("3---------> ${groupId} "+result.toString());
//     return result
//         .map((json) => AllMemberListModel.fromJson(json))
//         .toList();
//   }
//
//
//   //read all duration
//   Future<List<DurationListModel>>
//   readDurationListForLoanApplication() async {
//     final db = await this.database;
//     // final orderByq = 'id ASC';
//
//     final result = await db!.query(allDurationListTable);
//     // print("3---------> ${groupId} "+result.toString());
//     return result
//         .map((json) => DurationListModel.fromJson(json))
//         .toList();
//   }
//
//
//   //read all scheme
//   Future<List<LoanSchemeModel>>
//   readAllScheme() async {
//     final db = await this.database;
//     // final orderByq = 'id ASC';
//
//     final result = await db!.query(allLoanSchemeTable);
//     // print("3---------> ${groupId} "+result.toString());
//     return result
//         .map((json) => LoanSchemeModel.fromJson(json))
//         .toList();
//   }
//
//
//   //read all loan information
//   Future<List<LoanInfoForLoanApplicationModel>>
//   readAllLoanInformation() async {
//     final db = await this.database;
//     // final orderByq = 'id ASC';
//
//     final result = await db!.query(allLoanInformation);
//     // print("3---------> ${groupId} "+result.toString());
//     return result
//         .map((json) => LoanInfoForLoanApplicationModel.fromJson(json))
//         .toList();
//   }
//
//
//   //read all draft loan application
//   Future<List<LoanApplyForSqfModel>>
//   readAllDraftLoanApplication() async {
//     final db = await this.database;
//     // final orderByq = 'id ASC';
//
//     final result = await db!.query(draftLoanApplicationTable);
//     // print("3---------> ${groupId} "+result.toString());
//     return result
//         .map((json) => LoanApplyForSqfModel.fromJson(json))
//         .toList();
//   }
//
//
//   //read all non collection
//   Future<List<NonCollectionModel>>
//   readAllNonCollection() async {
//     final db = await this.database;
//     // final orderByq = 'id ASC';
//
//     final result = await db!.query(draftNonCollectionTable);
//     // print("3---------> ${groupId} "+result.toString());
//     return result
//         .map((json) => NonCollectionModel.fromJson(json))
//         .toList();
//   }
//
//   //read all advance collection
//   Future<List<NonCollectionModel>>
//   readAllAdvanceCollection() async {
//     final db = await this.database;
//     // final orderByq = 'id ASC';
//
//     final result = await db!.query(draftAdvanceCollectionTable);
//     // print("3---------> ${groupId} "+result.toString());
//     return result
//         .map((json) => NonCollectionModel.fromJson(json))
//         .toList();
//   }
//
//
//   //read all non collection list data
//   Future<List<NonCollectionDataModel>>
//   readSpecificNoCollection(id) async {
//     final db = await this.database;
//     // final orderByq = 'id ASC';
//
//     print("[---------> "+id.toString());
//
//     final result = await db!.query(nonCollectionDataListTable, where: 'clientId = ?', whereArgs: [id]);
//     // print("3---------> ${groupId} "+result.toString());
//     return result
//         .map((json) => NonCollectionDataModel.fromJson(json))
//         .toList();
//   }
//
//   //read all non collection list data
//   Future<List<NonCollectionDataModel>>
//   readSpecificAdvanceCollection(id) async {
//     final db = await this.database;
//     // final orderByq = 'id ASC';
//
//     print("[---------> "+id.toString());
//
//     final result = await db!.query(advanceCollectionDataListTable, where: 'clientId = ?', whereArgs: [id]);
//     // print("3---------> ${groupId} "+result.toString());
//     return result
//         .map((json) => NonCollectionDataModel.fromJson(json))
//         .toList();
//   }
//
//
//
//   ///insert Group
//
//   Future<DatumAddGroupForSqf> insertInGroup(DatumAddGroupForSqf datum) async {
//     final db = await this.database;
//     final id = await db!.insert("tableAddGroups", datum.toJson());
//     return datum.copy(id: id);
//   }
//
//   //insert client
//   Future<DatumAddClientForSqf> insertInClient(
//       DatumAddClientForSqf datum) async {
//     final db = await this.database;
//     final aiId = await db!.insert(tableAddMember, datum.toJson());
//     return datum.copy(aiId: aiId);
//   }
//
//   //insert Group List For Member Admission
//   insertGroupListForMemberAdmission(
//       GroupListForClientAddMiniModel datum) async {
//     final db = await this.database;
//     final id =
//     await db!.insert(groupListForMemberAdmissionTable, datum.toJson());
//     return;
//   }
//
//   //insert occupation list
//   insertOccupation(Occupations datum) async {
//     final db = await this.database;
//     final id = await db!.insert(occupationsListTable, datum.toJson());
//     return;
//   }
//
//   //insert all loan list
//   insertAllLoanType(Loan datum) async {
//     final db = await this.database;
//     final id = await db!.insert(allLoanTypeTable, datum.toJson());
//     return;
//   }
//
//   //insert client list for loan for a group
//   insertAllClientsInGroup(ClientListForLoan datum) async {
//     final db = await this.database;
//     final id = await db!.insert(clientListForLoanTable, datum.toJson());
//     return;
//   }
//
//   //insert approved group list
//   insertApprovedGroupList(PendingGroupList datum) async {
//     final db = await this.database;
//     final id = await db!.insert(approvedGroupListTable, datum.toJson());
//     return;
//   }
//
//   //insert Day Group List By UserName list
//   insertDayGroupListByUserName(PendingGroupList datum) async {
//     final db = await this.database;
//     final id = await db!.insert(dayGroupListByUserNameTable, datum.toJson());
//     return;
//   }
//
//   //insert draft Day Group List By UserName list
//   insertDraftDayGroupListByUserName(PendingGroupList datum) async {
//     final db = await this.database;
//     final id =
//     await db!.insert(draftDayGroupListByUserNameTable, datum.toJson());
//     return;
//   }
//
//   //insert loan collection details
//   insertLoanCollectionDetails(CollectionGroupDetailsModel datum) async {
//     final db = await this.database;
//     // print("2.1---------> ");
//     final id = db!.insert(loanCollectionDetailsTable, datum.toJson());
//     // print("2.2---------> "+id.toString());
//     return;
//   }
//
//   //insert draft loan collection details
//   insertDraftLoanCollectionDetails(CollectionGroupDetailsModel datum) async {
//     final db = await this.database;
//     // print("2.1---------> ");
//     final id = db!.insert(draftLoanCollectionDetailsTable, datum.toJson());
//     // print("2.2---------> "+id.toString());
//     return;
//   }
//
//   //insert Loan Amortization By Group Model
//
//   insertLoanAmortizationByGroupTable(LoanAmortizationByGroupModel datum) async {
//     final db = await this.database;
//     // print("2.1---------> ");
//     final id = db!.insert(loanAmortizationByGroupTable, datum.toJson());
//     // print("2.2---------> "+id.toString());
//
//     return;
//   }
//
//   //insert Loan Amortization By Group Model
//
//   insertDraftLoanAmortizationByGroupTable(
//       LoanAmortizationByGroupModel datum) async {
//     final db = await this.database;
//     print("kk 2.1---------> ");
//     final id = db!.insert(draftLoanAmortizationByGroupTable, datum.toJson());
//     print("kk 2.2---------> "+id.toString());
//
//     return;
//   }
//
//
//   //insert Member list for loan application
//
//   insertMemberListForLoanApplication(
//       AllMemberListModel datum) async {
//     final db = await this.database;
//     print("kk 2.1---------> ");
//     final id = db!.insert(allMemberListTable, datum.toJson());
//     print("kk 2.2---------> "+id.toString());
//     return;
//
//   }
//
//
//   //inset all duration list
//   insertAllDurationListForLoanApplication(
//       DurationListModel datum) async {
//     final db = await this.database;
//     print("kk 2.1---------> ");
//     final id = db!.insert(allDurationListTable, datum.toJson());
//     print("kk 2.2---------> "+id.toString());
//     return;
//
//   }
//
//
//   //inset all duration list
//   insertAllScheme(
//       LoanSchemeModel datum) async {
//     final db = await this.database;
//     print("kk 2.1---------> ");
//     final id = db!.insert(allLoanSchemeTable, datum.toJson());
//     print("kk 2.2---------> "+id.toString());
//     return;
//
//   }
//
//   //insert all loan information
//   insertAllLoanInformation(
//       LoanInfoForLoanApplicationModel datum) async {
//     final db = await this.database;
//     print("kk 2.1---------> ");
//     final id = db!.insert(allLoanInformation, datum.toJson());
//     print("kk 2.2---------> "+id.toString());
//     return;
//
//   }
//
//
//
//   //insert draft loan application
//   insertDraftLoanApplication(
//       LoanApplyForSqfModel datum) async {
//     final db = await this.database;
//     print("kk 2.1---------> ");
//     final id = db!.insert(draftLoanApplicationTable, datum.toJson());
//     print("kk 2.2---------> "+id.toString());
//     return;
//
//   }
//
//
//   //insert draft non Collection
//   insertDraftNonCollection(
//       NonCollectionModel datum) async {
//     final db = await this.database;
//     print("kk 2.1---------> ");
//     final id = db!.insert(draftNonCollectionTable, datum.toJson());
//     print("kk 2.2---------> "+id.toString());
//     return;
//
//   }
//
//
//   //insert draft non Collection
//   insertDraftAdvanceCollection(
//       NonCollectionModel datum) async {
//     final db = await this.database;
//     print("kk 2.1---------> ");
//     final id = db!.insert(draftAdvanceCollectionTable, datum.toJson());
//     print("kk 2.2---------> "+id.toString());
//     return;
//
//   }
//
//   //insert draft non Collection list data
//   insertNonCollectionListData(
//       NonCollectionDataModel datum) async {
//     final db = await this.database;
//     print("kk 2.1---------> ");
//     final id = db!.insert(nonCollectionDataListTable, datum.toJson());
//     print("kk 2.2---------> "+id.toString());
//     return;
//
//   }
//
//   //insert draft advance Collection
//   insertAdvanceCollectionListData(
//       NonCollectionDataModel datum) async {
//     final db = await this.database;
//     print("kk 2.1---------> ");
//     final id = db!.insert(advanceCollectionDataListTable, datum.toJson());
//     print("kk 2.2---------> "+id.toString());
//     return;
//
//   }
//
//   ///delete
//
//   //delete from group
//   Future<int> deleteGroup(int id) async {
//     final db = await this.database;
//     return db!.delete("tableAddGroups", where: 'id = ?', whereArgs: [id]);
//   }
//
//   //delete from client
//   Future<int> deleteClient(int id) async {
//     print("called deleted");
//     final db = await this.database;
//
//     return db!.delete(tableAddMember, where: 'id = ?', whereArgs: [id]);
//   }
//
//   //delete all group list for member admission
//   Future<bool> deleteAllGroupListForMemberAdmission() async {
//     print("called deleted");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $groupListForMemberAdmissionTable");
//     return true;
//   }
//
//   //delete all group list for member admission
//   Future<bool> deleteAllOccupation() async {
//     print("called deleted");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $occupationsListTable");
//     return true;
//   }
//
//   //delete all loan type
//   Future<bool> deleteAllLoanType() async {
//     print("called deleted");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $allLoanTypeTable");
//     return true;
//   }
//
//   //delete all client for loan application type
//   Future<bool> deleteAllClientForLoanApplication() async {
//     print("called deleted");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $clientListForLoanTable");
//     return true;
//   }
//
//   //delete all group list for member admission
//   deleteAllApprovedGroupList() async {
//     print("called deleted deleteAllDayGroupListByUserNameTable");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $approvedGroupListTable");
//
//     // print("---> ${what}");
//     return;
//   }
//
//   //delete all group list for member admission
//   deleteAllDayGroupListByUserNameTable() async {
//     print("called deleted deleteAllDayGroupListByUserNameTable");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $dayGroupListByUserNameTable");
//
//     // print("---> ${what}");
//     return;
//   }
//
//   //delete specific group list for member admission
//   deleteSpecificDayGroupListByUserNameTable(groupId) async {
//     print("called deleted deleteAllDayGroupListByUserNameTable");
//     final db = await this.database;
//
//     // var what = db!.rawDelete("delete from $dayGroupListByUserNameTable");
//
//     var what = db!.delete(dayGroupListByUserNameTable,
//         where: 'Id = ?', whereArgs: [groupId]);
//
//     // print("---> ${what}");
//     return;
//   }
//
//   //delete all group list for member admission
//   deleteDraftAllDayGroupListByUserNameTable() async {
//     print("called deleted deleteAllDayGroupListByUserNameTable");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $draftDayGroupListByUserNameTable");
//
//     // print("---> ${what}");
//     return;
//   }
//
//   //delete all group list for member admission
//   deleteDraftSpecificDayGroupListByUserNameTable(groupId) async {
//     print("called deleted deleteAllDayGroupListByUserNameTable");
//     final db = await this.database;
//
//     // var what = db!.rawDelete("delete from $draftDayGroupListByUserNameTable");
//
//     var what = db!.delete(draftDayGroupListByUserNameTable,
//         where: 'Id = ?', whereArgs: [groupId]);
//
//     // print("---> ${what}");
//     return;
//   }
//
//   //delete loan collection details
//   deleteLoanCollectionDetailsTable(groupId) async {
//     print("called deleted deleteAllDayGroupListByUserNameTable");
//     final db = await this.database;
//
//     var what = db!.delete(loanCollectionDetailsTable,
//         where: 'groupId = ?', whereArgs: [groupId]);
//     // print("0--------->"+what.toString());
//     // final result =  db!.query(loanCollectionDetailsTable);
//     // // print("1---------> "+result.toString());
//     // final result2 =  db!.query(loanCollectionDetailsTable, where: 'groupId = ?', whereArgs: [groupId]);
//     // // print("2---------> "+result.toString());
//     return;
//   }
//
//   //delete loan collection details
//   deleteDraftLoanCollectionDetailsTable(groupId) async {
//     print("called deleted deleteAllDayGroupListByUserNameTable");
//     final db = await this.database;
//
//     var what = db!.delete(draftLoanCollectionDetailsTable,
//         where: 'groupId = ?', whereArgs: [groupId]);
//     // print("0--------->"+what.toString());
//     // final result =  db!.query(loanCollectionDetailsTable);
//     // // print("1---------> "+result.toString());
//     // final result2 =  db!.query(loanCollectionDetailsTable, where: 'groupId = ?', whereArgs: [groupId]);
//     // // print("2---------> "+result.toString());
//     return;
//   }
//
//   //delete Loan Amortization By Group Table
//   deleteLoanAmortizationByGroupTable(groupId) async {
//     print("called deleted deleteAllDayGroupListByUserNameTable");
//     final db = await this.database;
//
//     var what = db!.delete(loanAmortizationByGroupTable,
//         where: 'groupInfoId = ?', whereArgs: [groupId]);
//     // print("0--------->"+what.toString());
//     // final result =  db!.query(loanCollectionDetailsTable);
//     // // print("1---------> "+result.toString());
//     // final result2 =  db!.query(loanCollectionDetailsTable, where: 'groupId = ?', whereArgs: [groupId]);
//     // // print("2---------> "+result.toString());
//     return;
//   }
//
//   //delete Loan Amortization By Group Table
//   deleteDraftLoanAmortizationByGroupTable(groupId) async {
//     print("called deleted deleteAllDayGroupListByUserNameTable");
//     final db = await this.database;
//     var what = db!.delete(draftLoanAmortizationByGroupTable,
//         where: 'groupInfoId = ?', whereArgs: [groupId]);
//     // print("0--------->"+what.toString());
//     // final result =  db!.query(loanCollectionDetailsTable);
//     // // print("1---------> "+result.toString());
//     // final result2 =  db!.query(loanCollectionDetailsTable, where: 'groupId = ?', whereArgs: [groupId]);
//     // // print("2---------> "+result.toString());
//     return;
//   }
//
//   //delete all member list for loan application
//   Future<bool> deleteAllMemberListForLoanApplication() async {
//     print("called deleted");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $allMemberListTable");
//     return true;
//   }
//
//   //delete all duration list for loan application
//   Future<bool> deleteAllDurationListForLoanApplication() async {
//     print("called deleted");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $allDurationListTable");
//     return true;
//   }
//
//
//   //delete all loan scheme
//   Future<bool> deleteAllLoanScheme() async {
//     print("called deleted");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $allLoanSchemeTable");
//     return true;
//   }
//
//
//   //delete all loan scheme
//   Future<bool> deleteAllLoanInformation() async {
//     print("called deleted");
//     final db = await this.database;
//
//     var what = db!.rawDelete("delete from $allLoanInformation");
//     return true;
//   }
//
//
//   //delete draft Loan Application
//   Future<bool> deleteSpecificLoanApplication(aiId) async {
//     print("called deleted");
//     final db = await this.database;
//
//     // var what = db!.rawDelete("delete from $allLoanInformation");
//
//     var what = db!.delete(draftLoanApplicationTable, where: 'aiId = ?', whereArgs: [aiId]);
//     return true;
//   }
//
//
//   //delete draft non Collection
//   Future<bool> deleteSpecificNonCollection(aiId) async {
//     print("called deleted");
//     final db = await this.database;
//
//     // var what = db!.rawDelete("delete from $allLoanInformation");
//
//     var what = db!.delete(draftNonCollectionTable, where: 'aiId = ?', whereArgs: [aiId]);
//     return true;
//   }
//
//   //delete draft Advance Collection
//   Future<bool> deleteSpecificAdvanceCollection(aiId) async {
//     print("called deleted");
//     final db = await this.database;
//
//     // var what = db!.rawDelete("delete from $allLoanInformation");
//
//     var what = db!.delete(draftAdvanceCollectionTable, where: 'aiId = ?', whereArgs: [aiId]);
//     return true;
//   }
//
//
//
//   //delete specific non Collection data
//   Future<bool> deleteSpecificNonCollectionData(id) async {
//     print("called deleted");
//     final db = await this.database;
//
//     // var what = db!.rawDelete("delete from $allLoanInformation");
//
//     var what = db!.delete(nonCollectionDataListTable, where: 'clientId = ?', whereArgs: [id]);
//     return true;
//   }
//
//   //delete all non Collection data
//   Future<bool> deleteAllNonCollectionListData() async {
//     print("called deleted");
//     final db = await this.database;
//
//     // var what = db!.rawDelete("delete from $allLoanInformation");
//
//     var what =  db!.rawDelete("delete from $nonCollectionDataListTable");
//     return true;
//   }
//
//
//
//   //delete specific advance Collection data
//   Future<bool> deleteSpecificAdvanceCollectionData(id) async {
//     print("called deleted");
//     final db = await this.database;
//
//     // var what = db!.rawDelete("delete from $allLoanInformation");
//
//     var what = db!.delete(advanceCollectionDataListTable, where: 'clientId = ?', whereArgs: [id]);
//     return true;
//   }
//
//   //delete all advance Collection data
//   Future<bool> deleteAllAdvanceCollectionListData() async {
//     print("called deleted");
//     final db = await this.database;
//
//     // var what = db!.rawDelete("delete from $allLoanInformation");
//
//     var what =  db!.rawDelete("delete from $advanceCollectionDataListTable");
//     return true;
//   }
//
//
//
//   ///update
//
//   //insert draft loan collection details
//   updateDraftLoanCollectionDetails(CollectionGroupDetailsModel datum) async {
//     final db = await this.database;
//     // print("2.1---------> ");
//     final id = db!.insert(draftLoanCollectionDetailsTable, datum.toJson());
//     // print("2.2---------> "+id.toString());
//     return;
//   }
// }