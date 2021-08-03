; ModuleID = 'h_index.bc'
source_filename = "original/h_index.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"nums\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"len\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @compute(i32* %nums, i32 %len) #0 !dbg !7 {
entry:
  %nums.addr = alloca i32*, align 8
  %len.addr = alloca i32, align 4
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  %current = alloca i32, align 4
  store i32* %nums, i32** %nums.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %nums.addr, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32*, i32** %nums.addr, align 8, !dbg !16
  %1 = load i32, i32* %len.addr, align 4, !dbg !17
  call void @sort(i32* %0, i32 %1), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %res, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %res, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !23
  %2 = load i32, i32* %len.addr, align 4, !dbg !24
  %sub = sub nsw i32 %2, 1, !dbg !25
  store i32 %sub, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %if.then, %entry
  %3 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp sge i32 %3, 0, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %current, metadata !31, metadata !DIExpression()), !dbg !33
  %4 = load i32, i32* %len.addr, align 4, !dbg !34
  %sub1 = sub nsw i32 %4, 1, !dbg !35
  store i32 %sub1, i32* %current, align 4, !dbg !33
  %5 = load i32*, i32** %nums.addr, align 8, !dbg !36
  %6 = load i32, i32* %i, align 4, !dbg !38
  %idxprom = sext i32 %6 to i64, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !36
  %7 = load i32, i32* %arrayidx, align 4, !dbg !36
  %8 = load i32, i32* %current, align 4, !dbg !39
  %cmp2 = icmp sge i32 %7, %8, !dbg !40
  br i1 %cmp2, label %if.then, label %for.end, !dbg !41

if.then:                                          ; preds = %for.body
  %9 = load i32, i32* %current, align 4, !dbg !42
  store i32 %9, i32* %res, align 4, !dbg !44
  %10 = load i32, i32* %i, align 4, !dbg !45
  %dec = add nsw i32 %10, -1, !dbg !45
  store i32 %dec, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.body, %for.cond
  %11 = load i32, i32* %res, align 4, !dbg !49
  ret i32 %11, !dbg !50
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define void @sort(i32* %nums, i32 %length) #0 !dbg !51 {
entry:
  %nums.addr = alloca i32*, align 8
  %length.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %left = alloca i32, align 4
  %right = alloca i32, align 4
  store i32* %nums, i32** %nums.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %nums.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 %length, i32* %length.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %length.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %i, metadata !58, metadata !DIExpression()), !dbg !60
  store i32 0, i32* %i, align 4, !dbg !60
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i32, i32* %i, align 4, !dbg !62
  %1 = load i32, i32* %length.addr, align 4, !dbg !64
  %cmp = icmp slt i32 %0, %1, !dbg !65
  br i1 %cmp, label %for.body, label %for.end15, !dbg !66

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !67, metadata !DIExpression()), !dbg !70
  store i32 0, i32* %j, align 4, !dbg !70
  br label %for.cond1, !dbg !71

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !72
  %3 = load i32, i32* %length.addr, align 4, !dbg !74
  %4 = load i32, i32* %i, align 4, !dbg !75
  %sub = sub nsw i32 %3, %4, !dbg !76
  %sub2 = sub nsw i32 %sub, 1, !dbg !77
  %cmp3 = icmp slt i32 %2, %sub2, !dbg !78
  br i1 %cmp3, label %for.body4, label %for.inc13, !dbg !79

for.body4:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %left, metadata !80, metadata !DIExpression()), !dbg !82
  %5 = load i32*, i32** %nums.addr, align 8, !dbg !83
  %6 = load i32, i32* %j, align 4, !dbg !84
  %idxprom = sext i32 %6 to i64, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !83
  %7 = load i32, i32* %arrayidx, align 4, !dbg !83
  store i32 %7, i32* %left, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %right, metadata !85, metadata !DIExpression()), !dbg !86
  %8 = load i32*, i32** %nums.addr, align 8, !dbg !87
  %9 = load i32, i32* %j, align 4, !dbg !88
  %add = add nsw i32 %9, 1, !dbg !89
  %idxprom5 = sext i32 %add to i64, !dbg !87
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !87
  %10 = load i32, i32* %arrayidx6, align 4, !dbg !87
  store i32 %10, i32* %right, align 4, !dbg !86
  %11 = load i32, i32* %left, align 4, !dbg !90
  %12 = load i32, i32* %right, align 4, !dbg !92
  %cmp7 = icmp sgt i32 %11, %12, !dbg !93
  br i1 %cmp7, label %if.then, label %for.inc, !dbg !94

if.then:                                          ; preds = %for.body4
  %13 = load i32, i32* %left, align 4, !dbg !95
  %14 = load i32*, i32** %nums.addr, align 8, !dbg !97
  %15 = load i32, i32* %j, align 4, !dbg !98
  %add8 = add nsw i32 %15, 1, !dbg !99
  %idxprom9 = sext i32 %add8 to i64, !dbg !97
  %arrayidx10 = getelementptr inbounds i32, i32* %14, i64 %idxprom9, !dbg !97
  store i32 %13, i32* %arrayidx10, align 4, !dbg !100
  %16 = load i32, i32* %right, align 4, !dbg !101
  %17 = load i32*, i32** %nums.addr, align 8, !dbg !102
  %18 = load i32, i32* %j, align 4, !dbg !103
  %idxprom11 = sext i32 %18 to i64, !dbg !102
  %arrayidx12 = getelementptr inbounds i32, i32* %17, i64 %idxprom11, !dbg !102
  store i32 %16, i32* %arrayidx12, align 4, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body4, %if.then
  %19 = load i32, i32* %j, align 4, !dbg !106
  %inc = add nsw i32 %19, 1, !dbg !106
  store i32 %inc, i32* %j, align 4, !dbg !106
  br label %for.cond1, !dbg !107, !llvm.loop !108

for.inc13:                                        ; preds = %for.cond1
  %20 = load i32, i32* %i, align 4, !dbg !110
  %inc14 = add nsw i32 %20, 1, !dbg !110
  store i32 %inc14, i32* %i, align 4, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end15:                                        ; preds = %for.cond
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 !dbg !115 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %max_len = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  %len = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32* %max_len, metadata !125, metadata !DIExpression()), !dbg !126
  store i32 10, i32* %max_len, align 4, !dbg !126
  %0 = load i32, i32* %max_len, align 4, !dbg !127
  %1 = zext i32 %0 to i64, !dbg !128
  store i8* null, i8** %saved_stack, align 8, !dbg !128
  %vla = alloca i32, i64 %1, align 16, !dbg !128
  call void @llvm.dbg.declare(metadata i32* %vla, metadata !129, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i32* %len, metadata !134, metadata !DIExpression()), !dbg !135
  %2 = bitcast i32* %vla to i8*, !dbg !136
  %3 = mul nuw i64 4, %1, !dbg !137
  call void @klee_make_symbolic(i8* %2, i64 %3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)), !dbg !138
  %4 = bitcast i32* %len to i8*, !dbg !139
  call void @klee_make_symbolic(i8* %4, i64 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0)), !dbg !140
  %5 = load i32, i32* %len, align 4, !dbg !141
  %6 = load i32, i32* %max_len, align 4, !dbg !142
  %cmp = icmp sle i32 %5, %6, !dbg !143
  %conv = zext i1 %cmp to i32, !dbg !143
  %conv1 = sext i32 %conv to i64, !dbg !141
  call void @klee_assume(i64 %conv1), !dbg !144
  %7 = load i32, i32* %len, align 4, !dbg !145
  %call = call i32 @compute(i32* %vla, i32 %7), !dbg !146
  store i32 0, i32* %retval, align 4, !dbg !147
  %8 = load i8*, i8** %saved_stack, align 8, !dbg !148
  %9 = load i32, i32* %retval, align 4, !dbg !148
  ret i32 %9, !dbg !148
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
!1 = !DIFile(filename: "original/h_index.c", directory: "/home/klee/text_c")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.1 "}
!7 = distinct !DISubprogram(name: "compute", scope: !1, file: !1, line: 9, type: !8, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!12 = !DILocalVariable(name: "nums", arg: 1, scope: !7, file: !1, line: 9, type: !11)
!13 = !DILocation(line: 9, column: 17, scope: !7)
!14 = !DILocalVariable(name: "len", arg: 2, scope: !7, file: !1, line: 9, type: !10)
!15 = !DILocation(line: 9, column: 29, scope: !7)
!16 = !DILocation(line: 10, column: 8, scope: !7)
!17 = !DILocation(line: 10, column: 14, scope: !7)
!18 = !DILocation(line: 10, column: 3, scope: !7)
!19 = !DILocalVariable(name: "res", scope: !7, file: !1, line: 12, type: !10)
!20 = !DILocation(line: 12, column: 7, scope: !7)
!21 = !DILocalVariable(name: "i", scope: !22, file: !1, line: 13, type: !10)
!22 = distinct !DILexicalBlock(scope: !7, file: !1, line: 13, column: 3)
!23 = !DILocation(line: 13, column: 11, scope: !22)
!24 = !DILocation(line: 13, column: 15, scope: !22)
!25 = !DILocation(line: 13, column: 19, scope: !22)
!26 = !DILocation(line: 13, column: 7, scope: !22)
!27 = !DILocation(line: 13, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !1, line: 13, column: 3)
!29 = !DILocation(line: 13, column: 26, scope: !28)
!30 = !DILocation(line: 13, column: 3, scope: !22)
!31 = !DILocalVariable(name: "current", scope: !32, file: !1, line: 14, type: !10)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 13, column: 37)
!33 = !DILocation(line: 14, column: 9, scope: !32)
!34 = !DILocation(line: 14, column: 19, scope: !32)
!35 = !DILocation(line: 14, column: 23, scope: !32)
!36 = !DILocation(line: 15, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !1, line: 15, column: 8)
!38 = !DILocation(line: 15, column: 13, scope: !37)
!39 = !DILocation(line: 15, column: 19, scope: !37)
!40 = !DILocation(line: 15, column: 16, scope: !37)
!41 = !DILocation(line: 15, column: 8, scope: !32)
!42 = !DILocation(line: 16, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 15, column: 28)
!44 = !DILocation(line: 16, column: 11, scope: !43)
!45 = !DILocation(line: 13, column: 33, scope: !28)
!46 = !DILocation(line: 13, column: 3, scope: !28)
!47 = distinct !{!47, !30, !48}
!48 = !DILocation(line: 20, column: 3, scope: !22)
!49 = !DILocation(line: 22, column: 10, scope: !7)
!50 = !DILocation(line: 22, column: 3, scope: !7)
!51 = distinct !DISubprogram(name: "sort", scope: !1, file: !1, line: 26, type: !52, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{null, !11, !10}
!54 = !DILocalVariable(name: "nums", arg: 1, scope: !51, file: !1, line: 26, type: !11)
!55 = !DILocation(line: 26, column: 15, scope: !51)
!56 = !DILocalVariable(name: "length", arg: 2, scope: !51, file: !1, line: 26, type: !10)
!57 = !DILocation(line: 26, column: 27, scope: !51)
!58 = !DILocalVariable(name: "i", scope: !59, file: !1, line: 27, type: !10)
!59 = distinct !DILexicalBlock(scope: !51, file: !1, line: 27, column: 3)
!60 = !DILocation(line: 27, column: 11, scope: !59)
!61 = !DILocation(line: 27, column: 7, scope: !59)
!62 = !DILocation(line: 27, column: 18, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !1, line: 27, column: 3)
!64 = !DILocation(line: 27, column: 22, scope: !63)
!65 = !DILocation(line: 27, column: 20, scope: !63)
!66 = !DILocation(line: 27, column: 3, scope: !59)
!67 = !DILocalVariable(name: "j", scope: !68, file: !1, line: 28, type: !10)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 28, column: 5)
!69 = distinct !DILexicalBlock(scope: !63, file: !1, line: 27, column: 35)
!70 = !DILocation(line: 28, column: 13, scope: !68)
!71 = !DILocation(line: 28, column: 9, scope: !68)
!72 = !DILocation(line: 28, column: 20, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !1, line: 28, column: 5)
!74 = !DILocation(line: 28, column: 24, scope: !73)
!75 = !DILocation(line: 28, column: 31, scope: !73)
!76 = !DILocation(line: 28, column: 30, scope: !73)
!77 = !DILocation(line: 28, column: 32, scope: !73)
!78 = !DILocation(line: 28, column: 22, scope: !73)
!79 = !DILocation(line: 28, column: 5, scope: !68)
!80 = !DILocalVariable(name: "left", scope: !81, file: !1, line: 29, type: !10)
!81 = distinct !DILexicalBlock(scope: !73, file: !1, line: 28, column: 41)
!82 = !DILocation(line: 29, column: 11, scope: !81)
!83 = !DILocation(line: 29, column: 18, scope: !81)
!84 = !DILocation(line: 29, column: 23, scope: !81)
!85 = !DILocalVariable(name: "right", scope: !81, file: !1, line: 30, type: !10)
!86 = !DILocation(line: 30, column: 11, scope: !81)
!87 = !DILocation(line: 30, column: 19, scope: !81)
!88 = !DILocation(line: 30, column: 24, scope: !81)
!89 = !DILocation(line: 30, column: 25, scope: !81)
!90 = !DILocation(line: 31, column: 10, scope: !91)
!91 = distinct !DILexicalBlock(scope: !81, file: !1, line: 31, column: 10)
!92 = !DILocation(line: 31, column: 17, scope: !91)
!93 = !DILocation(line: 31, column: 15, scope: !91)
!94 = !DILocation(line: 31, column: 10, scope: !81)
!95 = !DILocation(line: 32, column: 14, scope: !96)
!96 = distinct !DILexicalBlock(scope: !91, file: !1, line: 31, column: 24)
!97 = !DILocation(line: 32, column: 2, scope: !96)
!98 = !DILocation(line: 32, column: 7, scope: !96)
!99 = !DILocation(line: 32, column: 8, scope: !96)
!100 = !DILocation(line: 32, column: 12, scope: !96)
!101 = !DILocation(line: 33, column: 12, scope: !96)
!102 = !DILocation(line: 33, column: 2, scope: !96)
!103 = !DILocation(line: 33, column: 7, scope: !96)
!104 = !DILocation(line: 33, column: 10, scope: !96)
!105 = !DILocation(line: 34, column: 7, scope: !96)
!106 = !DILocation(line: 28, column: 37, scope: !73)
!107 = !DILocation(line: 28, column: 5, scope: !73)
!108 = distinct !{!108, !79, !109}
!109 = !DILocation(line: 35, column: 5, scope: !68)
!110 = !DILocation(line: 27, column: 31, scope: !63)
!111 = !DILocation(line: 27, column: 3, scope: !63)
!112 = distinct !{!112, !66, !113}
!113 = !DILocation(line: 36, column: 3, scope: !59)
!114 = !DILocation(line: 37, column: 1, scope: !51)
!115 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 39, type: !116, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!116 = !DISubroutineType(types: !117)
!117 = !{!10, !10, !118}
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!121 = !DILocalVariable(name: "argc", arg: 1, scope: !115, file: !1, line: 39, type: !10)
!122 = !DILocation(line: 39, column: 14, scope: !115)
!123 = !DILocalVariable(name: "argv", arg: 2, scope: !115, file: !1, line: 39, type: !118)
!124 = !DILocation(line: 39, column: 26, scope: !115)
!125 = !DILocalVariable(name: "max_len", scope: !115, file: !1, line: 40, type: !10)
!126 = !DILocation(line: 40, column: 7, scope: !115)
!127 = !DILocation(line: 41, column: 12, scope: !115)
!128 = !DILocation(line: 41, column: 3, scope: !115)
!129 = !DILocalVariable(name: "nums", scope: !115, file: !1, line: 41, type: !130)
!130 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, elements: !131)
!131 = !{!132}
!132 = !DISubrange(count: -1)
!133 = !DILocation(line: 41, column: 7, scope: !115)
!134 = !DILocalVariable(name: "len", scope: !115, file: !1, line: 42, type: !10)
!135 = !DILocation(line: 42, column: 7, scope: !115)
!136 = !DILocation(line: 44, column: 22, scope: !115)
!137 = !DILocation(line: 44, column: 29, scope: !115)
!138 = !DILocation(line: 44, column: 3, scope: !115)
!139 = !DILocation(line: 45, column: 22, scope: !115)
!140 = !DILocation(line: 45, column: 3, scope: !115)
!141 = !DILocation(line: 47, column: 15, scope: !115)
!142 = !DILocation(line: 47, column: 22, scope: !115)
!143 = !DILocation(line: 47, column: 19, scope: !115)
!144 = !DILocation(line: 47, column: 3, scope: !115)
!145 = !DILocation(line: 49, column: 17, scope: !115)
!146 = !DILocation(line: 49, column: 3, scope: !115)
!147 = !DILocation(line: 50, column: 3, scope: !115)
!148 = !DILocation(line: 51, column: 1, scope: !115)
