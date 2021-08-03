; ModuleID = 'h_index.bc'
source_filename = "h_index.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"num1\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"num2\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"num3\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @compute(i32 %num1, i32 %num2, i32 %num3) #0 !dbg !7 {
entry:
  %num1.addr = alloca i32, align 4
  %num2.addr = alloca i32, align 4
  %num3.addr = alloca i32, align 4
  %nums = alloca [3 x i32], align 4
  %len = alloca i32, align 4
  %res = alloca i32, align 4
  %i = alloca i32, align 4
  %current = alloca i32, align 4
  store i32 %num1, i32* %num1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num1.addr, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %num2, i32* %num2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num2.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %num3, i32* %num3.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num3.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [3 x i32]* %nums, metadata !17, metadata !DIExpression()), !dbg !21
  %arrayinit.begin = getelementptr inbounds [3 x i32], [3 x i32]* %nums, i64 0, i64 0, !dbg !22
  %0 = load i32, i32* %num1.addr, align 4, !dbg !23
  store i32 %0, i32* %arrayinit.begin, align 4, !dbg !22
  %arrayinit.element = getelementptr inbounds i32, i32* %arrayinit.begin, i64 1, !dbg !22
  %1 = load i32, i32* %num2.addr, align 4, !dbg !24
  store i32 %1, i32* %arrayinit.element, align 4, !dbg !22
  %arrayinit.element1 = getelementptr inbounds i32, i32* %arrayinit.element, i64 1, !dbg !22
  %2 = load i32, i32* %num3.addr, align 4, !dbg !25
  store i32 %2, i32* %arrayinit.element1, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %len, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 3, i32* %len, align 4, !dbg !27
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %nums, i32 0, i32 0, !dbg !28
  %3 = load i32, i32* %len, align 4, !dbg !29
  call void @sort(i32* %arraydecay, i32 %3), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %res, metadata !31, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %res, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %i, metadata !33, metadata !DIExpression()), !dbg !35
  %4 = load i32, i32* %len, align 4, !dbg !36
  %sub = sub nsw i32 %4, 1, !dbg !37
  store i32 %sub, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %if.then, %entry
  %5 = load i32, i32* %i, align 4, !dbg !39
  %cmp = icmp sge i32 %5, 0, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %current, metadata !43, metadata !DIExpression()), !dbg !45
  %6 = load i32, i32* %len, align 4, !dbg !46
  %sub2 = sub nsw i32 %6, 1, !dbg !47
  store i32 %sub2, i32* %current, align 4, !dbg !45
  %7 = load i32, i32* %i, align 4, !dbg !48
  %idxprom = sext i32 %7 to i64, !dbg !50
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %nums, i64 0, i64 %idxprom, !dbg !50
  %8 = load i32, i32* %arrayidx, align 4, !dbg !50
  %9 = load i32, i32* %current, align 4, !dbg !51
  %cmp3 = icmp sge i32 %8, %9, !dbg !52
  br i1 %cmp3, label %if.then, label %for.end, !dbg !53

if.then:                                          ; preds = %for.body
  %10 = load i32, i32* %current, align 4, !dbg !54
  store i32 %10, i32* %res, align 4, !dbg !56
  %11 = load i32, i32* %i, align 4, !dbg !57
  %dec = add nsw i32 %11, -1, !dbg !57
  store i32 %dec, i32* %i, align 4, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.body, %for.cond
  %12 = load i32, i32* %res, align 4, !dbg !61
  ret i32 %12, !dbg !62
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define void @sort(i32* %nums, i32 %length) #0 !dbg !63 {
entry:
  %nums.addr = alloca i32*, align 8
  %length.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %left = alloca i32, align 4
  %right = alloca i32, align 4
  store i32* %nums, i32** %nums.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %nums.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 %length, i32* %length.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %length.addr, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32* %i, metadata !71, metadata !DIExpression()), !dbg !73
  store i32 0, i32* %i, align 4, !dbg !73
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i32, i32* %i, align 4, !dbg !75
  %1 = load i32, i32* %length.addr, align 4, !dbg !77
  %cmp = icmp slt i32 %0, %1, !dbg !78
  br i1 %cmp, label %for.body, label %for.end15, !dbg !79

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !80, metadata !DIExpression()), !dbg !83
  store i32 0, i32* %j, align 4, !dbg !83
  br label %for.cond1, !dbg !84

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !85
  %3 = load i32, i32* %length.addr, align 4, !dbg !87
  %4 = load i32, i32* %i, align 4, !dbg !88
  %sub = sub nsw i32 %3, %4, !dbg !89
  %sub2 = sub nsw i32 %sub, 1, !dbg !90
  %cmp3 = icmp slt i32 %2, %sub2, !dbg !91
  br i1 %cmp3, label %for.body4, label %for.inc13, !dbg !92

for.body4:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %left, metadata !93, metadata !DIExpression()), !dbg !95
  %5 = load i32*, i32** %nums.addr, align 8, !dbg !96
  %6 = load i32, i32* %j, align 4, !dbg !97
  %idxprom = sext i32 %6 to i64, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !96
  %7 = load i32, i32* %arrayidx, align 4, !dbg !96
  store i32 %7, i32* %left, align 4, !dbg !95
  call void @llvm.dbg.declare(metadata i32* %right, metadata !98, metadata !DIExpression()), !dbg !99
  %8 = load i32*, i32** %nums.addr, align 8, !dbg !100
  %9 = load i32, i32* %j, align 4, !dbg !101
  %add = add nsw i32 %9, 1, !dbg !102
  %idxprom5 = sext i32 %add to i64, !dbg !100
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !100
  %10 = load i32, i32* %arrayidx6, align 4, !dbg !100
  store i32 %10, i32* %right, align 4, !dbg !99
  %11 = load i32, i32* %left, align 4, !dbg !103
  %12 = load i32, i32* %right, align 4, !dbg !105
  %cmp7 = icmp sgt i32 %11, %12, !dbg !106
  br i1 %cmp7, label %if.then, label %for.inc, !dbg !107

if.then:                                          ; preds = %for.body4
  %13 = load i32, i32* %left, align 4, !dbg !108
  %14 = load i32*, i32** %nums.addr, align 8, !dbg !110
  %15 = load i32, i32* %j, align 4, !dbg !111
  %add8 = add nsw i32 %15, 1, !dbg !112
  %idxprom9 = sext i32 %add8 to i64, !dbg !110
  %arrayidx10 = getelementptr inbounds i32, i32* %14, i64 %idxprom9, !dbg !110
  store i32 %13, i32* %arrayidx10, align 4, !dbg !113
  %16 = load i32, i32* %right, align 4, !dbg !114
  %17 = load i32*, i32** %nums.addr, align 8, !dbg !115
  %18 = load i32, i32* %j, align 4, !dbg !116
  %idxprom11 = sext i32 %18 to i64, !dbg !115
  %arrayidx12 = getelementptr inbounds i32, i32* %17, i64 %idxprom11, !dbg !115
  store i32 %16, i32* %arrayidx12, align 4, !dbg !117
  br label %for.inc, !dbg !118

for.inc:                                          ; preds = %for.body4, %if.then
  %19 = load i32, i32* %j, align 4, !dbg !119
  %inc = add nsw i32 %19, 1, !dbg !119
  store i32 %inc, i32* %j, align 4, !dbg !119
  br label %for.cond1, !dbg !120, !llvm.loop !121

for.inc13:                                        ; preds = %for.cond1
  %20 = load i32, i32* %i, align 4, !dbg !123
  %inc14 = add nsw i32 %20, 1, !dbg !123
  store i32 %inc14, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !124, !llvm.loop !125

for.end15:                                        ; preds = %for.cond
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 !dbg !128 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %num1 = alloca i32, align 4
  %num2 = alloca i32, align 4
  %num3 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !134, metadata !DIExpression()), !dbg !135
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i32* %num1, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i32* %num2, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32* %num3, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = bitcast i32* %num1 to i8*, !dbg !144
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0)), !dbg !145
  %1 = bitcast i32* %num2 to i8*, !dbg !146
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0)), !dbg !147
  %2 = bitcast i32* %num3 to i8*, !dbg !148
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0)), !dbg !149
  %3 = load i32, i32* %num1, align 4, !dbg !150
  %4 = load i32, i32* %num2, align 4, !dbg !151
  %5 = load i32, i32* %num3, align 4, !dbg !152
  %call = call i32 @compute(i32 %3, i32 %4, i32 %5), !dbg !153
  ret i32 0, !dbg !154
}

declare void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "h_index.c", directory: "/home/klee/text_c/modified")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.1 "}
!7 = distinct !DISubprogram(name: "compute", scope: !1, file: !1, line: 9, type: !8, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "num1", arg: 1, scope: !7, file: !1, line: 9, type: !10)
!12 = !DILocation(line: 9, column: 17, scope: !7)
!13 = !DILocalVariable(name: "num2", arg: 2, scope: !7, file: !1, line: 9, type: !10)
!14 = !DILocation(line: 9, column: 27, scope: !7)
!15 = !DILocalVariable(name: "num3", arg: 3, scope: !7, file: !1, line: 9, type: !10)
!16 = !DILocation(line: 9, column: 37, scope: !7)
!17 = !DILocalVariable(name: "nums", scope: !7, file: !1, line: 10, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 96, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 3)
!21 = !DILocation(line: 10, column: 7, scope: !7)
!22 = !DILocation(line: 10, column: 16, scope: !7)
!23 = !DILocation(line: 10, column: 17, scope: !7)
!24 = !DILocation(line: 10, column: 23, scope: !7)
!25 = !DILocation(line: 10, column: 29, scope: !7)
!26 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 11, type: !10)
!27 = !DILocation(line: 11, column: 7, scope: !7)
!28 = !DILocation(line: 12, column: 8, scope: !7)
!29 = !DILocation(line: 12, column: 14, scope: !7)
!30 = !DILocation(line: 12, column: 3, scope: !7)
!31 = !DILocalVariable(name: "res", scope: !7, file: !1, line: 15, type: !10)
!32 = !DILocation(line: 15, column: 7, scope: !7)
!33 = !DILocalVariable(name: "i", scope: !34, file: !1, line: 16, type: !10)
!34 = distinct !DILexicalBlock(scope: !7, file: !1, line: 16, column: 3)
!35 = !DILocation(line: 16, column: 11, scope: !34)
!36 = !DILocation(line: 16, column: 15, scope: !34)
!37 = !DILocation(line: 16, column: 19, scope: !34)
!38 = !DILocation(line: 16, column: 7, scope: !34)
!39 = !DILocation(line: 16, column: 24, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 16, column: 3)
!41 = !DILocation(line: 16, column: 26, scope: !40)
!42 = !DILocation(line: 16, column: 3, scope: !34)
!43 = !DILocalVariable(name: "current", scope: !44, file: !1, line: 17, type: !10)
!44 = distinct !DILexicalBlock(scope: !40, file: !1, line: 16, column: 37)
!45 = !DILocation(line: 17, column: 9, scope: !44)
!46 = !DILocation(line: 17, column: 19, scope: !44)
!47 = !DILocation(line: 17, column: 23, scope: !44)
!48 = !DILocation(line: 18, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !44, file: !1, line: 18, column: 8)
!50 = !DILocation(line: 18, column: 8, scope: !49)
!51 = !DILocation(line: 18, column: 19, scope: !49)
!52 = !DILocation(line: 18, column: 16, scope: !49)
!53 = !DILocation(line: 18, column: 8, scope: !44)
!54 = !DILocation(line: 19, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !1, line: 18, column: 28)
!56 = !DILocation(line: 19, column: 11, scope: !55)
!57 = !DILocation(line: 16, column: 33, scope: !40)
!58 = !DILocation(line: 16, column: 3, scope: !40)
!59 = distinct !{!59, !42, !60}
!60 = !DILocation(line: 23, column: 3, scope: !34)
!61 = !DILocation(line: 25, column: 10, scope: !7)
!62 = !DILocation(line: 25, column: 3, scope: !7)
!63 = distinct !DISubprogram(name: "sort", scope: !1, file: !1, line: 28, type: !64, isLocal: false, isDefinition: true, scopeLine: 28, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !66, !10}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!67 = !DILocalVariable(name: "nums", arg: 1, scope: !63, file: !1, line: 28, type: !66)
!68 = !DILocation(line: 28, column: 15, scope: !63)
!69 = !DILocalVariable(name: "length", arg: 2, scope: !63, file: !1, line: 28, type: !10)
!70 = !DILocation(line: 28, column: 27, scope: !63)
!71 = !DILocalVariable(name: "i", scope: !72, file: !1, line: 29, type: !10)
!72 = distinct !DILexicalBlock(scope: !63, file: !1, line: 29, column: 3)
!73 = !DILocation(line: 29, column: 11, scope: !72)
!74 = !DILocation(line: 29, column: 7, scope: !72)
!75 = !DILocation(line: 29, column: 18, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !1, line: 29, column: 3)
!77 = !DILocation(line: 29, column: 22, scope: !76)
!78 = !DILocation(line: 29, column: 20, scope: !76)
!79 = !DILocation(line: 29, column: 3, scope: !72)
!80 = !DILocalVariable(name: "j", scope: !81, file: !1, line: 30, type: !10)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 30, column: 5)
!82 = distinct !DILexicalBlock(scope: !76, file: !1, line: 29, column: 35)
!83 = !DILocation(line: 30, column: 13, scope: !81)
!84 = !DILocation(line: 30, column: 9, scope: !81)
!85 = !DILocation(line: 30, column: 20, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !1, line: 30, column: 5)
!87 = !DILocation(line: 30, column: 24, scope: !86)
!88 = !DILocation(line: 30, column: 31, scope: !86)
!89 = !DILocation(line: 30, column: 30, scope: !86)
!90 = !DILocation(line: 30, column: 32, scope: !86)
!91 = !DILocation(line: 30, column: 22, scope: !86)
!92 = !DILocation(line: 30, column: 5, scope: !81)
!93 = !DILocalVariable(name: "left", scope: !94, file: !1, line: 31, type: !10)
!94 = distinct !DILexicalBlock(scope: !86, file: !1, line: 30, column: 41)
!95 = !DILocation(line: 31, column: 11, scope: !94)
!96 = !DILocation(line: 31, column: 18, scope: !94)
!97 = !DILocation(line: 31, column: 23, scope: !94)
!98 = !DILocalVariable(name: "right", scope: !94, file: !1, line: 32, type: !10)
!99 = !DILocation(line: 32, column: 11, scope: !94)
!100 = !DILocation(line: 32, column: 19, scope: !94)
!101 = !DILocation(line: 32, column: 24, scope: !94)
!102 = !DILocation(line: 32, column: 25, scope: !94)
!103 = !DILocation(line: 33, column: 10, scope: !104)
!104 = distinct !DILexicalBlock(scope: !94, file: !1, line: 33, column: 10)
!105 = !DILocation(line: 33, column: 17, scope: !104)
!106 = !DILocation(line: 33, column: 15, scope: !104)
!107 = !DILocation(line: 33, column: 10, scope: !94)
!108 = !DILocation(line: 34, column: 14, scope: !109)
!109 = distinct !DILexicalBlock(scope: !104, file: !1, line: 33, column: 24)
!110 = !DILocation(line: 34, column: 2, scope: !109)
!111 = !DILocation(line: 34, column: 7, scope: !109)
!112 = !DILocation(line: 34, column: 8, scope: !109)
!113 = !DILocation(line: 34, column: 12, scope: !109)
!114 = !DILocation(line: 35, column: 12, scope: !109)
!115 = !DILocation(line: 35, column: 2, scope: !109)
!116 = !DILocation(line: 35, column: 7, scope: !109)
!117 = !DILocation(line: 35, column: 10, scope: !109)
!118 = !DILocation(line: 36, column: 7, scope: !109)
!119 = !DILocation(line: 30, column: 37, scope: !86)
!120 = !DILocation(line: 30, column: 5, scope: !86)
!121 = distinct !{!121, !92, !122}
!122 = !DILocation(line: 37, column: 5, scope: !81)
!123 = !DILocation(line: 29, column: 31, scope: !76)
!124 = !DILocation(line: 29, column: 3, scope: !76)
!125 = distinct !{!125, !79, !126}
!126 = !DILocation(line: 38, column: 3, scope: !72)
!127 = !DILocation(line: 39, column: 1, scope: !63)
!128 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 41, type: !129, isLocal: false, isDefinition: true, scopeLine: 41, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!129 = !DISubroutineType(types: !130)
!130 = !{!10, !10, !131}
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !133, size: 64)
!133 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!134 = !DILocalVariable(name: "argc", arg: 1, scope: !128, file: !1, line: 41, type: !10)
!135 = !DILocation(line: 41, column: 14, scope: !128)
!136 = !DILocalVariable(name: "argv", arg: 2, scope: !128, file: !1, line: 41, type: !131)
!137 = !DILocation(line: 41, column: 26, scope: !128)
!138 = !DILocalVariable(name: "num1", scope: !128, file: !1, line: 42, type: !10)
!139 = !DILocation(line: 42, column: 7, scope: !128)
!140 = !DILocalVariable(name: "num2", scope: !128, file: !1, line: 43, type: !10)
!141 = !DILocation(line: 43, column: 7, scope: !128)
!142 = !DILocalVariable(name: "num3", scope: !128, file: !1, line: 44, type: !10)
!143 = !DILocation(line: 44, column: 7, scope: !128)
!144 = !DILocation(line: 46, column: 22, scope: !128)
!145 = !DILocation(line: 46, column: 3, scope: !128)
!146 = !DILocation(line: 47, column: 22, scope: !128)
!147 = !DILocation(line: 47, column: 3, scope: !128)
!148 = !DILocation(line: 48, column: 22, scope: !128)
!149 = !DILocation(line: 48, column: 3, scope: !128)
!150 = !DILocation(line: 50, column: 11, scope: !128)
!151 = !DILocation(line: 50, column: 17, scope: !128)
!152 = !DILocation(line: 50, column: 23, scope: !128)
!153 = !DILocation(line: 50, column: 3, scope: !128)
!154 = !DILocation(line: 51, column: 3, scope: !128)
