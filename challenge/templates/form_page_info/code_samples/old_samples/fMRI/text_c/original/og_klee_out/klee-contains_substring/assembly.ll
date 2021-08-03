; ModuleID = 'contains_substring.bc'
source_filename = "original/contains_substring.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"string1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"string2\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @compute(i8* %string1, i8* %string2) #0 !dbg !7 {
entry:
  %string1.addr = alloca i8*, align 8
  %string2.addr = alloca i8*, align 8
  %len1 = alloca i32, align 4
  %len2 = alloca i32, align 4
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %string1, i8** %string1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %string1.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i8* %string2, i8** %string2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %string2.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %len1, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i8*, i8** %string1.addr, align 8, !dbg !19
  %call = call i32 @my_strlen(i8* %0), !dbg !20
  store i32 %call, i32* %len1, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %len2, metadata !21, metadata !DIExpression()), !dbg !22
  %1 = load i8*, i8** %string2.addr, align 8, !dbg !23
  %call1 = call i32 @my_strlen(i8* %1), !dbg !24
  store i32 %call1, i32* %len2, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %res, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %res, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !29
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc18, %entry
  %2 = load i32, i32* %i, align 4, !dbg !31
  %3 = load i32, i32* %len1, align 4, !dbg !33
  %cmp = icmp slt i32 %2, %3, !dbg !34
  br i1 %cmp, label %for.body, label %for.end20, !dbg !35

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !36, metadata !DIExpression()), !dbg !39
  store i32 0, i32* %j, align 4, !dbg !39
  br label %for.cond2, !dbg !40

for.cond2:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4, !dbg !41
  %5 = load i32, i32* %len2, align 4, !dbg !43
  %cmp3 = icmp slt i32 %4, %5, !dbg !44
  br i1 %cmp3, label %for.body4, label %for.inc18, !dbg !45

for.body4:                                        ; preds = %for.cond2
  %6 = load i32, i32* %i, align 4, !dbg !46
  %7 = load i32, i32* %j, align 4, !dbg !49
  %add = add nsw i32 %6, %7, !dbg !50
  %8 = load i32, i32* %len1, align 4, !dbg !51
  %cmp5 = icmp sge i32 %add, %8, !dbg !52
  br i1 %cmp5, label %for.inc18, label %if.end, !dbg !53

if.end:                                           ; preds = %for.body4
  %9 = load i8*, i8** %string1.addr, align 8, !dbg !54
  %10 = load i32, i32* %i, align 4, !dbg !56
  %11 = load i32, i32* %j, align 4, !dbg !57
  %add6 = add nsw i32 %10, %11, !dbg !58
  %idxprom = sext i32 %add6 to i64, !dbg !54
  %arrayidx = getelementptr inbounds i8, i8* %9, i64 %idxprom, !dbg !54
  %12 = load i8, i8* %arrayidx, align 1, !dbg !54
  %conv = sext i8 %12 to i32, !dbg !54
  %13 = load i8*, i8** %string2.addr, align 8, !dbg !59
  %14 = load i32, i32* %j, align 4, !dbg !60
  %idxprom7 = sext i32 %14 to i64, !dbg !59
  %arrayidx8 = getelementptr inbounds i8, i8* %13, i64 %idxprom7, !dbg !59
  %15 = load i8, i8* %arrayidx8, align 1, !dbg !59
  %conv9 = sext i8 %15 to i32, !dbg !59
  %cmp10 = icmp ne i32 %conv, %conv9, !dbg !61
  br i1 %cmp10, label %for.inc18, label %if.else, !dbg !62

if.else:                                          ; preds = %if.end
  %16 = load i32, i32* %j, align 4, !dbg !63
  %17 = load i32, i32* %len2, align 4, !dbg !66
  %sub = sub nsw i32 %17, 1, !dbg !67
  %cmp13 = icmp eq i32 %16, %sub, !dbg !68
  br i1 %cmp13, label %if.then15, label %for.inc, !dbg !69

if.then15:                                        ; preds = %if.else
  store i32 1, i32* %res, align 4, !dbg !70
  br label %for.inc18, !dbg !72

for.inc:                                          ; preds = %if.else
  %18 = load i32, i32* %j, align 4, !dbg !73
  %inc = add nsw i32 %18, 1, !dbg !73
  store i32 %inc, i32* %j, align 4, !dbg !73
  br label %for.cond2, !dbg !74, !llvm.loop !75

for.inc18:                                        ; preds = %for.cond2, %if.then15, %for.body4, %if.end
  %19 = load i32, i32* %i, align 4, !dbg !77
  %inc19 = add nsw i32 %19, 1, !dbg !77
  store i32 %inc19, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end20:                                        ; preds = %for.cond
  %20 = load i32, i32* %res, align 4, !dbg !81
  ret i32 %20, !dbg !82
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define i32 @my_strlen(i8* %string) #0 !dbg !83 {
entry:
  %string.addr = alloca i8*, align 8
  %len = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %string.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32* %len, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 0, i32* %len, align 4, !dbg !89
  br label %while.cond, !dbg !90

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i8*, i8** %string.addr, align 8, !dbg !91
  %1 = load i32, i32* %len, align 4, !dbg !92
  %idxprom = sext i32 %1 to i64, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 %idxprom, !dbg !91
  %2 = load i8, i8* %arrayidx, align 1, !dbg !91
  %conv = sext i8 %2 to i32, !dbg !91
  %cmp = icmp ne i32 %conv, 0, !dbg !93
  %3 = load i32, i32* %len, align 4
  br i1 %cmp, label %while.body, label %while.end, !dbg !90

while.body:                                       ; preds = %while.cond
  %inc = add nsw i32 %3, 1, !dbg !94
  store i32 %inc, i32* %len, align 4, !dbg !94
  br label %while.cond, !dbg !90, !llvm.loop !96

while.end:                                        ; preds = %while.cond
  ret i32 %3, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 !dbg !99 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %max_len = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %max_len, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 10, i32* %max_len, align 4, !dbg !108
  %0 = load i32, i32* %max_len, align 4, !dbg !109
  %1 = zext i32 %0 to i64, !dbg !110
  store i8* null, i8** %saved_stack, align 8, !dbg !110
  %vla = alloca i8, i64 %1, align 16, !dbg !110
  call void @llvm.dbg.declare(metadata i8* %vla, metadata !111, metadata !DIExpression()), !dbg !115
  %2 = load i32, i32* %max_len, align 4, !dbg !116
  %3 = zext i32 %2 to i64, !dbg !117
  %vla1 = alloca i8, i64 %3, align 16, !dbg !117
  call void @llvm.dbg.declare(metadata i8* %vla1, metadata !118, metadata !DIExpression()), !dbg !119
  call void @klee_make_symbolic(i8* %vla, i64 %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0)), !dbg !120
  call void @klee_make_symbolic(i8* %vla1, i64 %3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0)), !dbg !121
  %4 = load i32, i32* %max_len, align 4, !dbg !122
  %sub = sub nsw i32 %4, 1, !dbg !123
  %idxprom = sext i32 %sub to i64, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %vla, i64 %idxprom, !dbg !124
  %5 = load i8, i8* %arrayidx, align 1, !dbg !124
  %conv = sext i8 %5 to i32, !dbg !124
  %cmp = icmp eq i32 %conv, 0, !dbg !125
  %conv2 = zext i1 %cmp to i32, !dbg !125
  %conv3 = sext i32 %conv2 to i64, !dbg !124
  call void @klee_assume(i64 %conv3), !dbg !126
  %6 = load i32, i32* %max_len, align 4, !dbg !127
  %sub4 = sub nsw i32 %6, 1, !dbg !128
  %idxprom5 = sext i32 %sub4 to i64, !dbg !129
  %arrayidx6 = getelementptr inbounds i8, i8* %vla1, i64 %idxprom5, !dbg !129
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !129
  %conv7 = sext i8 %7 to i32, !dbg !129
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !130
  %conv9 = zext i1 %cmp8 to i32, !dbg !130
  %conv10 = sext i32 %conv9 to i64, !dbg !129
  call void @klee_assume(i64 %conv10), !dbg !131
  %call = call i32 @compute(i8* %vla, i8* %vla1), !dbg !132
  store i32 0, i32* %retval, align 4, !dbg !133
  %8 = load i8*, i8** %saved_stack, align 8, !dbg !134
  %9 = load i32, i32* %retval, align 4, !dbg !134
  ret i32 %9, !dbg !134
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

declare void @klee_make_symbolic(i8*, i64, i8*) #3

declare void @klee_assume(i64) #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "original/contains_substring.c", directory: "/home/klee/text_c")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.1 "}
!7 = distinct !DISubprogram(name: "compute", scope: !1, file: !1, line: 10, type: !8, isLocal: false, isDefinition: true, scopeLine: 10, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DILocalVariable(name: "string1", arg: 1, scope: !7, file: !1, line: 10, type: !11)
!14 = !DILocation(line: 10, column: 18, scope: !7)
!15 = !DILocalVariable(name: "string2", arg: 2, scope: !7, file: !1, line: 10, type: !11)
!16 = !DILocation(line: 10, column: 34, scope: !7)
!17 = !DILocalVariable(name: "len1", scope: !7, file: !1, line: 11, type: !10)
!18 = !DILocation(line: 11, column: 7, scope: !7)
!19 = !DILocation(line: 11, column: 24, scope: !7)
!20 = !DILocation(line: 11, column: 14, scope: !7)
!21 = !DILocalVariable(name: "len2", scope: !7, file: !1, line: 12, type: !10)
!22 = !DILocation(line: 12, column: 7, scope: !7)
!23 = !DILocation(line: 12, column: 24, scope: !7)
!24 = !DILocation(line: 12, column: 14, scope: !7)
!25 = !DILocalVariable(name: "res", scope: !7, file: !1, line: 14, type: !10)
!26 = !DILocation(line: 14, column: 7, scope: !7)
!27 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 15, type: !10)
!28 = distinct !DILexicalBlock(scope: !7, file: !1, line: 15, column: 3)
!29 = !DILocation(line: 15, column: 11, scope: !28)
!30 = !DILocation(line: 15, column: 7, scope: !28)
!31 = !DILocation(line: 15, column: 18, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 15, column: 3)
!33 = !DILocation(line: 15, column: 22, scope: !32)
!34 = !DILocation(line: 15, column: 20, scope: !32)
!35 = !DILocation(line: 15, column: 3, scope: !28)
!36 = !DILocalVariable(name: "j", scope: !37, file: !1, line: 16, type: !10)
!37 = distinct !DILexicalBlock(scope: !38, file: !1, line: 16, column: 5)
!38 = distinct !DILexicalBlock(scope: !32, file: !1, line: 15, column: 33)
!39 = !DILocation(line: 16, column: 13, scope: !37)
!40 = !DILocation(line: 16, column: 9, scope: !37)
!41 = !DILocation(line: 16, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !37, file: !1, line: 16, column: 5)
!43 = !DILocation(line: 16, column: 24, scope: !42)
!44 = !DILocation(line: 16, column: 22, scope: !42)
!45 = !DILocation(line: 16, column: 5, scope: !37)
!46 = !DILocation(line: 17, column: 10, scope: !47)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 17, column: 10)
!48 = distinct !DILexicalBlock(scope: !42, file: !1, line: 16, column: 35)
!49 = !DILocation(line: 17, column: 14, scope: !47)
!50 = !DILocation(line: 17, column: 12, scope: !47)
!51 = !DILocation(line: 17, column: 19, scope: !47)
!52 = !DILocation(line: 17, column: 16, scope: !47)
!53 = !DILocation(line: 17, column: 10, scope: !48)
!54 = !DILocation(line: 19, column: 10, scope: !55)
!55 = distinct !DILexicalBlock(scope: !48, file: !1, line: 19, column: 10)
!56 = !DILocation(line: 19, column: 18, scope: !55)
!57 = !DILocation(line: 19, column: 22, scope: !55)
!58 = !DILocation(line: 19, column: 20, scope: !55)
!59 = !DILocation(line: 19, column: 28, scope: !55)
!60 = !DILocation(line: 19, column: 36, scope: !55)
!61 = !DILocation(line: 19, column: 25, scope: !55)
!62 = !DILocation(line: 19, column: 10, scope: !48)
!63 = !DILocation(line: 22, column: 5, scope: !64)
!64 = distinct !DILexicalBlock(scope: !65, file: !1, line: 22, column: 5)
!65 = distinct !DILexicalBlock(scope: !55, file: !1, line: 21, column: 14)
!66 = !DILocation(line: 22, column: 10, scope: !64)
!67 = !DILocation(line: 22, column: 15, scope: !64)
!68 = !DILocation(line: 22, column: 7, scope: !64)
!69 = !DILocation(line: 22, column: 5, scope: !65)
!70 = !DILocation(line: 23, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !64, file: !1, line: 22, column: 20)
!72 = !DILocation(line: 24, column: 4, scope: !71)
!73 = !DILocation(line: 16, column: 31, scope: !42)
!74 = !DILocation(line: 16, column: 5, scope: !42)
!75 = distinct !{!75, !45, !76}
!76 = !DILocation(line: 27, column: 5, scope: !37)
!77 = !DILocation(line: 15, column: 29, scope: !32)
!78 = !DILocation(line: 15, column: 3, scope: !32)
!79 = distinct !{!79, !35, !80}
!80 = !DILocation(line: 28, column: 3, scope: !28)
!81 = !DILocation(line: 30, column: 10, scope: !7)
!82 = !DILocation(line: 30, column: 3, scope: !7)
!83 = distinct !DISubprogram(name: "my_strlen", scope: !1, file: !1, line: 33, type: !84, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!10, !11}
!86 = !DILocalVariable(name: "string", arg: 1, scope: !83, file: !1, line: 33, type: !11)
!87 = !DILocation(line: 33, column: 20, scope: !83)
!88 = !DILocalVariable(name: "len", scope: !83, file: !1, line: 34, type: !10)
!89 = !DILocation(line: 34, column: 7, scope: !83)
!90 = !DILocation(line: 35, column: 3, scope: !83)
!91 = !DILocation(line: 35, column: 9, scope: !83)
!92 = !DILocation(line: 35, column: 16, scope: !83)
!93 = !DILocation(line: 35, column: 21, scope: !83)
!94 = !DILocation(line: 36, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !1, line: 35, column: 30)
!96 = distinct !{!96, !90, !97}
!97 = !DILocation(line: 37, column: 3, scope: !83)
!98 = !DILocation(line: 38, column: 3, scope: !83)
!99 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 41, type: !100, isLocal: false, isDefinition: true, scopeLine: 41, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!10, !10, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !1, line: 41, type: !10)
!104 = !DILocation(line: 41, column: 14, scope: !99)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !99, file: !1, line: 41, type: !102)
!106 = !DILocation(line: 41, column: 26, scope: !99)
!107 = !DILocalVariable(name: "max_len", scope: !99, file: !1, line: 43, type: !10)
!108 = !DILocation(line: 43, column: 7, scope: !99)
!109 = !DILocation(line: 44, column: 16, scope: !99)
!110 = !DILocation(line: 44, column: 3, scope: !99)
!111 = !DILocalVariable(name: "string1", scope: !99, file: !1, line: 44, type: !112)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, elements: !113)
!113 = !{!114}
!114 = !DISubrange(count: -1)
!115 = !DILocation(line: 44, column: 8, scope: !99)
!116 = !DILocation(line: 45, column: 16, scope: !99)
!117 = !DILocation(line: 45, column: 3, scope: !99)
!118 = !DILocalVariable(name: "string2", scope: !99, file: !1, line: 45, type: !112)
!119 = !DILocation(line: 45, column: 8, scope: !99)
!120 = !DILocation(line: 47, column: 3, scope: !99)
!121 = !DILocation(line: 48, column: 3, scope: !99)
!122 = !DILocation(line: 50, column: 23, scope: !99)
!123 = !DILocation(line: 50, column: 30, scope: !99)
!124 = !DILocation(line: 50, column: 15, scope: !99)
!125 = !DILocation(line: 50, column: 34, scope: !99)
!126 = !DILocation(line: 50, column: 3, scope: !99)
!127 = !DILocation(line: 51, column: 23, scope: !99)
!128 = !DILocation(line: 51, column: 30, scope: !99)
!129 = !DILocation(line: 51, column: 15, scope: !99)
!130 = !DILocation(line: 51, column: 34, scope: !99)
!131 = !DILocation(line: 51, column: 3, scope: !99)
!132 = !DILocation(line: 53, column: 3, scope: !99)
!133 = !DILocation(line: 54, column: 3, scope: !99)
!134 = !DILocation(line: 55, column: 1, scope: !99)
