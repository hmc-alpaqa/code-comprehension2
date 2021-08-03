; ModuleID = 'contains_substring.bc'
source_filename = "contains_substring.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"input_1\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"input_2\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @compute(i8* %string1, i8* %string2) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %string1.addr = alloca i8*, align 8
  %string2.addr = alloca i8*, align 8
  %max_len = alloca i32, align 4
  %len1 = alloca i32, align 4
  %len2 = alloca i32, align 4
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %string1, i8** %string1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %string1.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i8* %string2, i8** %string2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %string2.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %max_len, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 3, i32* %max_len, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %len1, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i8*, i8** %string1.addr, align 8, !dbg !21
  %1 = load i32, i32* %max_len, align 4, !dbg !22
  %call = call i32 @my_strlen(i8* %0, i32 %1), !dbg !23
  store i32 %call, i32* %len1, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %len2, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i8*, i8** %string2.addr, align 8, !dbg !26
  %3 = load i32, i32* %max_len, align 4, !dbg !27
  %call1 = call i32 @my_strlen(i8* %2, i32 %3), !dbg !28
  store i32 %call1, i32* %len2, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %res, metadata !29, metadata !DIExpression()), !dbg !30
  store i32 0, i32* %res, align 4, !dbg !30
  %4 = load i32, i32* %len1, align 4, !dbg !31
  %5 = load i32, i32* %max_len, align 4, !dbg !33
  %cmp = icmp sgt i32 %4, %5, !dbg !34
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !35

lor.lhs.false:                                    ; preds = %entry
  %6 = load i32, i32* %len2, align 4, !dbg !36
  %7 = load i32, i32* %max_len, align 4, !dbg !37
  %cmp2 = icmp sgt i32 %6, %7, !dbg !38
  br i1 %cmp2, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %lor.lhs.false, %entry
  %8 = load i32, i32* %res, align 4, !dbg !40
  store i32 %8, i32* %retval, align 4, !dbg !42
  br label %return, !dbg !42

if.end:                                           ; preds = %lor.lhs.false
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !45
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc22, %if.end
  %9 = load i32, i32* %i, align 4, !dbg !47
  %10 = load i32, i32* %len1, align 4, !dbg !49
  %cmp3 = icmp slt i32 %9, %10, !dbg !50
  br i1 %cmp3, label %for.body, label %for.end24, !dbg !51

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !52, metadata !DIExpression()), !dbg !55
  store i32 0, i32* %j, align 4, !dbg !55
  br label %for.cond4, !dbg !56

for.cond4:                                        ; preds = %for.inc, %for.body
  %11 = load i32, i32* %j, align 4, !dbg !57
  %12 = load i32, i32* %len2, align 4, !dbg !59
  %cmp5 = icmp slt i32 %11, %12, !dbg !60
  br i1 %cmp5, label %for.body6, label %for.inc22, !dbg !61

for.body6:                                        ; preds = %for.cond4
  %13 = load i32, i32* %i, align 4, !dbg !62
  %14 = load i32, i32* %j, align 4, !dbg !65
  %add = add nsw i32 %13, %14, !dbg !66
  %15 = load i32, i32* %len1, align 4, !dbg !67
  %cmp7 = icmp sge i32 %add, %15, !dbg !68
  br i1 %cmp7, label %for.inc22, label %if.end9, !dbg !69

if.end9:                                          ; preds = %for.body6
  %16 = load i8*, i8** %string1.addr, align 8, !dbg !70
  %17 = load i32, i32* %i, align 4, !dbg !72
  %18 = load i32, i32* %j, align 4, !dbg !73
  %add10 = add nsw i32 %17, %18, !dbg !74
  %idxprom = sext i32 %add10 to i64, !dbg !70
  %arrayidx = getelementptr inbounds i8, i8* %16, i64 %idxprom, !dbg !70
  %19 = load i8, i8* %arrayidx, align 1, !dbg !70
  %conv = sext i8 %19 to i32, !dbg !70
  %20 = load i8*, i8** %string2.addr, align 8, !dbg !75
  %21 = load i32, i32* %j, align 4, !dbg !76
  %idxprom11 = sext i32 %21 to i64, !dbg !75
  %arrayidx12 = getelementptr inbounds i8, i8* %20, i64 %idxprom11, !dbg !75
  %22 = load i8, i8* %arrayidx12, align 1, !dbg !75
  %conv13 = sext i8 %22 to i32, !dbg !75
  %cmp14 = icmp ne i32 %conv, %conv13, !dbg !77
  br i1 %cmp14, label %for.inc22, label %if.else, !dbg !78

if.else:                                          ; preds = %if.end9
  %23 = load i32, i32* %j, align 4, !dbg !79
  %24 = load i32, i32* %len2, align 4, !dbg !82
  %sub = sub nsw i32 %24, 1, !dbg !83
  %cmp17 = icmp eq i32 %23, %sub, !dbg !84
  br i1 %cmp17, label %if.then19, label %for.inc, !dbg !85

if.then19:                                        ; preds = %if.else
  store i32 1, i32* %res, align 4, !dbg !86
  br label %for.inc22, !dbg !88

for.inc:                                          ; preds = %if.else
  %25 = load i32, i32* %j, align 4, !dbg !89
  %inc = add nsw i32 %25, 1, !dbg !89
  store i32 %inc, i32* %j, align 4, !dbg !89
  br label %for.cond4, !dbg !90, !llvm.loop !91

for.inc22:                                        ; preds = %for.cond4, %if.then19, %for.body6, %if.end9
  %26 = load i32, i32* %i, align 4, !dbg !93
  %inc23 = add nsw i32 %26, 1, !dbg !93
  store i32 %inc23, i32* %i, align 4, !dbg !93
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end24:                                        ; preds = %for.cond
  %27 = load i32, i32* %res, align 4, !dbg !97
  store i32 %27, i32* %retval, align 4, !dbg !98
  br label %return, !dbg !98

return:                                           ; preds = %for.end24, %if.then
  %28 = load i32, i32* %retval, align 4, !dbg !99
  ret i32 %28, !dbg !99
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define i32 @my_strlen(i8* %string, i32 %max_len) #0 !dbg !100 {
entry:
  %string.addr = alloca i8*, align 8
  %max_len.addr = alloca i32, align 4
  %len = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %string.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 %max_len, i32* %max_len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max_len.addr, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %len, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 0, i32* %len, align 4, !dbg !108
  br label %while.cond, !dbg !109

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i8*, i8** %string.addr, align 8, !dbg !110
  %1 = load i32, i32* %len, align 4, !dbg !111
  %idxprom = sext i32 %1 to i64, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 %idxprom, !dbg !110
  %2 = load i8, i8* %arrayidx, align 1, !dbg !110
  %conv = sext i8 %2 to i32, !dbg !110
  %cmp = icmp ne i32 %conv, 0, !dbg !112
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !113

land.rhs:                                         ; preds = %while.cond
  %3 = load i32, i32* %len, align 4, !dbg !114
  %4 = load i32, i32* %max_len.addr, align 4, !dbg !115
  %cmp2 = icmp sle i32 %3, %4, !dbg !116
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %5 = phi i1 [ false, %while.cond ], [ %cmp2, %land.rhs ]
  %6 = load i32, i32* %len, align 4
  br i1 %5, label %while.body, label %while.end, !dbg !109

while.body:                                       ; preds = %land.end
  %inc = add nsw i32 %6, 1, !dbg !117
  store i32 %inc, i32* %len, align 4, !dbg !117
  br label %while.cond, !dbg !109, !llvm.loop !119

while.end:                                        ; preds = %land.end
  ret i32 %6, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 !dbg !122 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %max_size = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !126, metadata !DIExpression()), !dbg !127
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i32* %max_size, metadata !130, metadata !DIExpression()), !dbg !131
  store i32 10, i32* %max_size, align 4, !dbg !131
  %0 = load i32, i32* %max_size, align 4, !dbg !132
  %1 = zext i32 %0 to i64, !dbg !133
  store i8* null, i8** %saved_stack, align 8, !dbg !133
  %vla = alloca i8, i64 %1, align 16, !dbg !133
  call void @llvm.dbg.declare(metadata i8* %vla, metadata !134, metadata !DIExpression()), !dbg !138
  %2 = load i32, i32* %max_size, align 4, !dbg !139
  %3 = zext i32 %2 to i64, !dbg !140
  %vla1 = alloca i8, i64 %3, align 16, !dbg !140
  call void @llvm.dbg.declare(metadata i8* %vla1, metadata !141, metadata !DIExpression()), !dbg !142
  call void @klee_make_symbolic(i8* %vla, i64 %1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0)), !dbg !143
  %4 = load i32, i32* %max_size, align 4, !dbg !144
  %sub = sub nsw i32 %4, 1, !dbg !145
  %idxprom = sext i32 %sub to i64, !dbg !146
  %arrayidx = getelementptr inbounds i8, i8* %vla, i64 %idxprom, !dbg !146
  %5 = load i8, i8* %arrayidx, align 1, !dbg !146
  %conv = sext i8 %5 to i32, !dbg !146
  %cmp = icmp eq i32 %conv, 0, !dbg !147
  %conv2 = zext i1 %cmp to i32, !dbg !147
  %conv3 = sext i32 %conv2 to i64, !dbg !146
  call void @klee_assume(i64 %conv3), !dbg !148
  call void @klee_make_symbolic(i8* %vla1, i64 %3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0)), !dbg !149
  %6 = load i32, i32* %max_size, align 4, !dbg !150
  %sub4 = sub nsw i32 %6, 1, !dbg !151
  %idxprom5 = sext i32 %sub4 to i64, !dbg !152
  %arrayidx6 = getelementptr inbounds i8, i8* %vla1, i64 %idxprom5, !dbg !152
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !152
  %conv7 = sext i8 %7 to i32, !dbg !152
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !153
  %conv9 = zext i1 %cmp8 to i32, !dbg !153
  %conv10 = sext i32 %conv9 to i64, !dbg !152
  call void @klee_assume(i64 %conv10), !dbg !154
  %call = call i32 @compute(i8* %vla, i8* %vla1), !dbg !155
  store i32 0, i32* %retval, align 4, !dbg !156
  %8 = load i8*, i8** %saved_stack, align 8, !dbg !157
  %9 = load i32, i32* %retval, align 4, !dbg !157
  ret i32 %9, !dbg !157
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
!1 = !DIFile(filename: "contains_substring.c", directory: "/home/klee/text_c/modified")
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
!17 = !DILocalVariable(name: "max_len", scope: !7, file: !1, line: 11, type: !10)
!18 = !DILocation(line: 11, column: 7, scope: !7)
!19 = !DILocalVariable(name: "len1", scope: !7, file: !1, line: 13, type: !10)
!20 = !DILocation(line: 13, column: 7, scope: !7)
!21 = !DILocation(line: 13, column: 24, scope: !7)
!22 = !DILocation(line: 13, column: 33, scope: !7)
!23 = !DILocation(line: 13, column: 14, scope: !7)
!24 = !DILocalVariable(name: "len2", scope: !7, file: !1, line: 14, type: !10)
!25 = !DILocation(line: 14, column: 7, scope: !7)
!26 = !DILocation(line: 14, column: 24, scope: !7)
!27 = !DILocation(line: 14, column: 33, scope: !7)
!28 = !DILocation(line: 14, column: 14, scope: !7)
!29 = !DILocalVariable(name: "res", scope: !7, file: !1, line: 15, type: !10)
!30 = !DILocation(line: 15, column: 7, scope: !7)
!31 = !DILocation(line: 17, column: 6, scope: !32)
!32 = distinct !DILexicalBlock(scope: !7, file: !1, line: 17, column: 6)
!33 = !DILocation(line: 17, column: 13, scope: !32)
!34 = !DILocation(line: 17, column: 11, scope: !32)
!35 = !DILocation(line: 17, column: 21, scope: !32)
!36 = !DILocation(line: 17, column: 24, scope: !32)
!37 = !DILocation(line: 17, column: 31, scope: !32)
!38 = !DILocation(line: 17, column: 29, scope: !32)
!39 = !DILocation(line: 17, column: 6, scope: !7)
!40 = !DILocation(line: 18, column: 12, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !1, line: 17, column: 40)
!42 = !DILocation(line: 18, column: 5, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !44, file: !1, line: 21, type: !10)
!44 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 3)
!45 = !DILocation(line: 21, column: 11, scope: !44)
!46 = !DILocation(line: 21, column: 7, scope: !44)
!47 = !DILocation(line: 21, column: 18, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 21, column: 3)
!49 = !DILocation(line: 21, column: 22, scope: !48)
!50 = !DILocation(line: 21, column: 20, scope: !48)
!51 = !DILocation(line: 21, column: 3, scope: !44)
!52 = !DILocalVariable(name: "j", scope: !53, file: !1, line: 22, type: !10)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 22, column: 5)
!54 = distinct !DILexicalBlock(scope: !48, file: !1, line: 21, column: 33)
!55 = !DILocation(line: 22, column: 13, scope: !53)
!56 = !DILocation(line: 22, column: 9, scope: !53)
!57 = !DILocation(line: 22, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !1, line: 22, column: 5)
!59 = !DILocation(line: 22, column: 24, scope: !58)
!60 = !DILocation(line: 22, column: 22, scope: !58)
!61 = !DILocation(line: 22, column: 5, scope: !53)
!62 = !DILocation(line: 23, column: 10, scope: !63)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 23, column: 10)
!64 = distinct !DILexicalBlock(scope: !58, file: !1, line: 22, column: 35)
!65 = !DILocation(line: 23, column: 14, scope: !63)
!66 = !DILocation(line: 23, column: 12, scope: !63)
!67 = !DILocation(line: 23, column: 19, scope: !63)
!68 = !DILocation(line: 23, column: 16, scope: !63)
!69 = !DILocation(line: 23, column: 10, scope: !64)
!70 = !DILocation(line: 25, column: 10, scope: !71)
!71 = distinct !DILexicalBlock(scope: !64, file: !1, line: 25, column: 10)
!72 = !DILocation(line: 25, column: 18, scope: !71)
!73 = !DILocation(line: 25, column: 22, scope: !71)
!74 = !DILocation(line: 25, column: 20, scope: !71)
!75 = !DILocation(line: 25, column: 28, scope: !71)
!76 = !DILocation(line: 25, column: 36, scope: !71)
!77 = !DILocation(line: 25, column: 25, scope: !71)
!78 = !DILocation(line: 25, column: 10, scope: !64)
!79 = !DILocation(line: 28, column: 5, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 28, column: 5)
!81 = distinct !DILexicalBlock(scope: !71, file: !1, line: 27, column: 14)
!82 = !DILocation(line: 28, column: 10, scope: !80)
!83 = !DILocation(line: 28, column: 15, scope: !80)
!84 = !DILocation(line: 28, column: 7, scope: !80)
!85 = !DILocation(line: 28, column: 5, scope: !81)
!86 = !DILocation(line: 29, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !1, line: 28, column: 20)
!88 = !DILocation(line: 30, column: 4, scope: !87)
!89 = !DILocation(line: 22, column: 31, scope: !58)
!90 = !DILocation(line: 22, column: 5, scope: !58)
!91 = distinct !{!91, !61, !92}
!92 = !DILocation(line: 33, column: 5, scope: !53)
!93 = !DILocation(line: 21, column: 29, scope: !48)
!94 = !DILocation(line: 21, column: 3, scope: !48)
!95 = distinct !{!95, !51, !96}
!96 = !DILocation(line: 34, column: 3, scope: !44)
!97 = !DILocation(line: 36, column: 10, scope: !7)
!98 = !DILocation(line: 36, column: 3, scope: !7)
!99 = !DILocation(line: 37, column: 1, scope: !7)
!100 = distinct !DISubprogram(name: "my_strlen", scope: !1, file: !1, line: 39, type: !101, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!10, !11, !10}
!103 = !DILocalVariable(name: "string", arg: 1, scope: !100, file: !1, line: 39, type: !11)
!104 = !DILocation(line: 39, column: 20, scope: !100)
!105 = !DILocalVariable(name: "max_len", arg: 2, scope: !100, file: !1, line: 39, type: !10)
!106 = !DILocation(line: 39, column: 34, scope: !100)
!107 = !DILocalVariable(name: "len", scope: !100, file: !1, line: 40, type: !10)
!108 = !DILocation(line: 40, column: 7, scope: !100)
!109 = !DILocation(line: 41, column: 3, scope: !100)
!110 = !DILocation(line: 41, column: 9, scope: !100)
!111 = !DILocation(line: 41, column: 16, scope: !100)
!112 = !DILocation(line: 41, column: 21, scope: !100)
!113 = !DILocation(line: 41, column: 29, scope: !100)
!114 = !DILocation(line: 41, column: 32, scope: !100)
!115 = !DILocation(line: 41, column: 39, scope: !100)
!116 = !DILocation(line: 41, column: 36, scope: !100)
!117 = !DILocation(line: 42, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !100, file: !1, line: 41, column: 48)
!119 = distinct !{!119, !109, !120}
!120 = !DILocation(line: 43, column: 3, scope: !100)
!121 = !DILocation(line: 44, column: 3, scope: !100)
!122 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 48, type: !123, isLocal: false, isDefinition: true, scopeLine: 48, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!123 = !DISubroutineType(types: !124)
!124 = !{!10, !10, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!126 = !DILocalVariable(name: "argc", arg: 1, scope: !122, file: !1, line: 48, type: !10)
!127 = !DILocation(line: 48, column: 14, scope: !122)
!128 = !DILocalVariable(name: "argv", arg: 2, scope: !122, file: !1, line: 48, type: !125)
!129 = !DILocation(line: 48, column: 26, scope: !122)
!130 = !DILocalVariable(name: "max_size", scope: !122, file: !1, line: 50, type: !10)
!131 = !DILocation(line: 50, column: 7, scope: !122)
!132 = !DILocation(line: 51, column: 16, scope: !122)
!133 = !DILocation(line: 51, column: 3, scope: !122)
!134 = !DILocalVariable(name: "input_1", scope: !122, file: !1, line: 51, type: !135)
!135 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, elements: !136)
!136 = !{!137}
!137 = !DISubrange(count: -1)
!138 = !DILocation(line: 51, column: 8, scope: !122)
!139 = !DILocation(line: 52, column: 16, scope: !122)
!140 = !DILocation(line: 52, column: 3, scope: !122)
!141 = !DILocalVariable(name: "input_2", scope: !122, file: !1, line: 52, type: !135)
!142 = !DILocation(line: 52, column: 8, scope: !122)
!143 = !DILocation(line: 54, column: 3, scope: !122)
!144 = !DILocation(line: 55, column: 23, scope: !122)
!145 = !DILocation(line: 55, column: 31, scope: !122)
!146 = !DILocation(line: 55, column: 15, scope: !122)
!147 = !DILocation(line: 55, column: 35, scope: !122)
!148 = !DILocation(line: 55, column: 3, scope: !122)
!149 = !DILocation(line: 57, column: 3, scope: !122)
!150 = !DILocation(line: 58, column: 23, scope: !122)
!151 = !DILocation(line: 58, column: 31, scope: !122)
!152 = !DILocation(line: 58, column: 15, scope: !122)
!153 = !DILocation(line: 58, column: 35, scope: !122)
!154 = !DILocation(line: 58, column: 3, scope: !122)
!155 = !DILocation(line: 60, column: 3, scope: !122)
!156 = !DILocation(line: 61, column: 3, scope: !122)
!157 = !DILocation(line: 62, column: 1, scope: !122)
