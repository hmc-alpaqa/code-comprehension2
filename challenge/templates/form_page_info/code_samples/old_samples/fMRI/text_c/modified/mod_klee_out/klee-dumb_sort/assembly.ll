; ModuleID = 'dumb_sort.bc'
source_filename = "dumb_sort.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"c\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32* @compute(i32 %a, i32 %b, i32 %c) #0 !dbg !10 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %res = alloca i32*, align 8
  %a_addr = alloca i32*, align 8
  %b_addr = alloca i32*, align 8
  %c_addr = alloca i32*, align 8
  %temp = alloca i32, align 4
  %temp3 = alloca i32, align 4
  %temp7 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %res, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call noalias i8* @malloc(i64 12) #4, !dbg !21
  %0 = bitcast i8* %call to i32*, !dbg !22
  store i32* %0, i32** %res, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %a_addr, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* %a.addr, i32** %a_addr, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %b_addr, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* %b.addr, i32** %b_addr, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32** %c_addr, metadata !27, metadata !DIExpression()), !dbg !28
  store i32* %c.addr, i32** %c_addr, align 8, !dbg !28
  %1 = load i32*, i32** %a_addr, align 8, !dbg !29
  %2 = load i32, i32* %1, align 4, !dbg !31
  %3 = load i32*, i32** %b_addr, align 8, !dbg !32
  %4 = load i32, i32* %3, align 4, !dbg !33
  %cmp = icmp sgt i32 %2, %4, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !36, metadata !DIExpression()), !dbg !38
  %5 = load i32*, i32** %b_addr, align 8, !dbg !39
  %6 = load i32, i32* %5, align 4, !dbg !40
  store i32 %6, i32* %temp, align 4, !dbg !38
  %7 = load i32*, i32** %a_addr, align 8, !dbg !41
  %8 = load i32, i32* %7, align 4, !dbg !42
  %9 = load i32*, i32** %b_addr, align 8, !dbg !43
  store i32 %8, i32* %9, align 4, !dbg !44
  %10 = load i32, i32* %temp, align 4, !dbg !45
  %11 = load i32*, i32** %a_addr, align 8, !dbg !46
  store i32 %10, i32* %11, align 4, !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  %12 = load i32*, i32** %a_addr, align 8, !dbg !49
  %13 = load i32, i32* %12, align 4, !dbg !51
  %14 = load i32*, i32** %c_addr, align 8, !dbg !52
  %15 = load i32, i32* %14, align 4, !dbg !53
  %cmp1 = icmp sgt i32 %13, %15, !dbg !54
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !55

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %temp3, metadata !56, metadata !DIExpression()), !dbg !58
  %16 = load i32*, i32** %c_addr, align 8, !dbg !59
  %17 = load i32, i32* %16, align 4, !dbg !60
  store i32 %17, i32* %temp3, align 4, !dbg !58
  %18 = load i32*, i32** %a_addr, align 8, !dbg !61
  %19 = load i32, i32* %18, align 4, !dbg !62
  %20 = load i32*, i32** %c_addr, align 8, !dbg !63
  store i32 %19, i32* %20, align 4, !dbg !64
  %21 = load i32, i32* %temp3, align 4, !dbg !65
  %22 = load i32*, i32** %a_addr, align 8, !dbg !66
  store i32 %21, i32* %22, align 4, !dbg !67
  br label %if.end4, !dbg !68

if.end4:                                          ; preds = %if.then2, %if.end
  %23 = load i32*, i32** %b_addr, align 8, !dbg !69
  %24 = load i32, i32* %23, align 4, !dbg !71
  %25 = load i32*, i32** %c_addr, align 8, !dbg !72
  %26 = load i32, i32* %25, align 4, !dbg !73
  %cmp5 = icmp sgt i32 %24, %26, !dbg !74
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !75

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %temp7, metadata !76, metadata !DIExpression()), !dbg !78
  %27 = load i32*, i32** %c_addr, align 8, !dbg !79
  %28 = load i32, i32* %27, align 4, !dbg !80
  store i32 %28, i32* %temp7, align 4, !dbg !78
  %29 = load i32*, i32** %b_addr, align 8, !dbg !81
  %30 = load i32, i32* %29, align 4, !dbg !82
  %31 = load i32*, i32** %c_addr, align 8, !dbg !83
  store i32 %30, i32* %31, align 4, !dbg !84
  %32 = load i32, i32* %temp7, align 4, !dbg !85
  %33 = load i32*, i32** %b_addr, align 8, !dbg !86
  store i32 %32, i32* %33, align 4, !dbg !87
  br label %if.end8, !dbg !88

if.end8:                                          ; preds = %if.then6, %if.end4
  %34 = load i32, i32* %a.addr, align 4, !dbg !89
  %35 = load i32*, i32** %res, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %35, i64 0, !dbg !90
  store i32 %34, i32* %arrayidx, align 4, !dbg !91
  %36 = load i32, i32* %b.addr, align 4, !dbg !92
  %37 = load i32*, i32** %res, align 8, !dbg !93
  %arrayidx9 = getelementptr inbounds i32, i32* %37, i64 1, !dbg !93
  store i32 %36, i32* %arrayidx9, align 4, !dbg !94
  %38 = load i32, i32* %c.addr, align 4, !dbg !95
  %39 = load i32*, i32** %res, align 8, !dbg !96
  %arrayidx10 = getelementptr inbounds i32, i32* %39, i64 2, !dbg !96
  store i32 %38, i32* %arrayidx10, align 4, !dbg !97
  %40 = load i32*, i32** %res, align 8, !dbg !98
  ret i32* %40, !dbg !99
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %a, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32* %b, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32* %c, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = bitcast i32* %a to i8*, !dbg !116
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)), !dbg !117
  %1 = bitcast i32* %b to i8*, !dbg !118
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !119
  %2 = bitcast i32* %c to i8*, !dbg !120
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !121
  %3 = load i32, i32* %a, align 4, !dbg !122
  %4 = load i32, i32* %b, align 4, !dbg !123
  %5 = load i32, i32* %c, align 4, !dbg !124
  %call = call i32* @compute(i32 %3, i32 %4, i32 %5), !dbg !125
  ret i32 0, !dbg !126
}

declare void @klee_make_symbolic(i8*, i64, i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "dumb_sort.c", directory: "/home/klee/text_c/modified")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 2, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{!"clang version 6.0.1 "}
!10 = distinct !DISubprogram(name: "compute", scope: !1, file: !1, line: 8, type: !11, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!4, !5, !5, !5}
!13 = !DILocalVariable(name: "a", arg: 1, scope: !10, file: !1, line: 8, type: !5)
!14 = !DILocation(line: 8, column: 18, scope: !10)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !10, file: !1, line: 8, type: !5)
!16 = !DILocation(line: 8, column: 25, scope: !10)
!17 = !DILocalVariable(name: "c", arg: 3, scope: !10, file: !1, line: 8, type: !5)
!18 = !DILocation(line: 8, column: 32, scope: !10)
!19 = !DILocalVariable(name: "res", scope: !10, file: !1, line: 9, type: !4)
!20 = !DILocation(line: 9, column: 8, scope: !10)
!21 = !DILocation(line: 9, column: 21, scope: !10)
!22 = !DILocation(line: 9, column: 14, scope: !10)
!23 = !DILocalVariable(name: "a_addr", scope: !10, file: !1, line: 11, type: !4)
!24 = !DILocation(line: 11, column: 8, scope: !10)
!25 = !DILocalVariable(name: "b_addr", scope: !10, file: !1, line: 12, type: !4)
!26 = !DILocation(line: 12, column: 8, scope: !10)
!27 = !DILocalVariable(name: "c_addr", scope: !10, file: !1, line: 13, type: !4)
!28 = !DILocation(line: 13, column: 8, scope: !10)
!29 = !DILocation(line: 17, column: 7, scope: !30)
!30 = distinct !DILexicalBlock(scope: !10, file: !1, line: 17, column: 6)
!31 = !DILocation(line: 17, column: 6, scope: !30)
!32 = !DILocation(line: 17, column: 17, scope: !30)
!33 = !DILocation(line: 17, column: 16, scope: !30)
!34 = !DILocation(line: 17, column: 14, scope: !30)
!35 = !DILocation(line: 17, column: 6, scope: !10)
!36 = !DILocalVariable(name: "temp", scope: !37, file: !1, line: 18, type: !5)
!37 = distinct !DILexicalBlock(scope: !30, file: !1, line: 17, column: 25)
!38 = !DILocation(line: 18, column: 9, scope: !37)
!39 = !DILocation(line: 18, column: 17, scope: !37)
!40 = !DILocation(line: 18, column: 16, scope: !37)
!41 = !DILocation(line: 19, column: 16, scope: !37)
!42 = !DILocation(line: 19, column: 15, scope: !37)
!43 = !DILocation(line: 19, column: 6, scope: !37)
!44 = !DILocation(line: 19, column: 13, scope: !37)
!45 = !DILocation(line: 20, column: 15, scope: !37)
!46 = !DILocation(line: 20, column: 6, scope: !37)
!47 = !DILocation(line: 20, column: 13, scope: !37)
!48 = !DILocation(line: 21, column: 3, scope: !37)
!49 = !DILocation(line: 23, column: 7, scope: !50)
!50 = distinct !DILexicalBlock(scope: !10, file: !1, line: 23, column: 6)
!51 = !DILocation(line: 23, column: 6, scope: !50)
!52 = !DILocation(line: 23, column: 17, scope: !50)
!53 = !DILocation(line: 23, column: 16, scope: !50)
!54 = !DILocation(line: 23, column: 14, scope: !50)
!55 = !DILocation(line: 23, column: 6, scope: !10)
!56 = !DILocalVariable(name: "temp", scope: !57, file: !1, line: 24, type: !5)
!57 = distinct !DILexicalBlock(scope: !50, file: !1, line: 23, column: 25)
!58 = !DILocation(line: 24, column: 9, scope: !57)
!59 = !DILocation(line: 24, column: 17, scope: !57)
!60 = !DILocation(line: 24, column: 16, scope: !57)
!61 = !DILocation(line: 25, column: 16, scope: !57)
!62 = !DILocation(line: 25, column: 15, scope: !57)
!63 = !DILocation(line: 25, column: 6, scope: !57)
!64 = !DILocation(line: 25, column: 13, scope: !57)
!65 = !DILocation(line: 26, column: 15, scope: !57)
!66 = !DILocation(line: 26, column: 6, scope: !57)
!67 = !DILocation(line: 26, column: 13, scope: !57)
!68 = !DILocation(line: 27, column: 3, scope: !57)
!69 = !DILocation(line: 29, column: 7, scope: !70)
!70 = distinct !DILexicalBlock(scope: !10, file: !1, line: 29, column: 6)
!71 = !DILocation(line: 29, column: 6, scope: !70)
!72 = !DILocation(line: 29, column: 17, scope: !70)
!73 = !DILocation(line: 29, column: 16, scope: !70)
!74 = !DILocation(line: 29, column: 14, scope: !70)
!75 = !DILocation(line: 29, column: 6, scope: !10)
!76 = !DILocalVariable(name: "temp", scope: !77, file: !1, line: 30, type: !5)
!77 = distinct !DILexicalBlock(scope: !70, file: !1, line: 29, column: 25)
!78 = !DILocation(line: 30, column: 9, scope: !77)
!79 = !DILocation(line: 30, column: 17, scope: !77)
!80 = !DILocation(line: 30, column: 16, scope: !77)
!81 = !DILocation(line: 31, column: 16, scope: !77)
!82 = !DILocation(line: 31, column: 15, scope: !77)
!83 = !DILocation(line: 31, column: 6, scope: !77)
!84 = !DILocation(line: 31, column: 13, scope: !77)
!85 = !DILocation(line: 32, column: 15, scope: !77)
!86 = !DILocation(line: 32, column: 6, scope: !77)
!87 = !DILocation(line: 32, column: 13, scope: !77)
!88 = !DILocation(line: 33, column: 3, scope: !77)
!89 = !DILocation(line: 35, column: 12, scope: !10)
!90 = !DILocation(line: 35, column: 3, scope: !10)
!91 = !DILocation(line: 35, column: 10, scope: !10)
!92 = !DILocation(line: 36, column: 12, scope: !10)
!93 = !DILocation(line: 36, column: 3, scope: !10)
!94 = !DILocation(line: 36, column: 10, scope: !10)
!95 = !DILocation(line: 37, column: 12, scope: !10)
!96 = !DILocation(line: 37, column: 3, scope: !10)
!97 = !DILocation(line: 37, column: 10, scope: !10)
!98 = !DILocation(line: 38, column: 10, scope: !10)
!99 = !DILocation(line: 38, column: 3, scope: !10)
!100 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !101, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!5, !5, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !1, line: 42, type: !5)
!107 = !DILocation(line: 42, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !1, line: 42, type: !103)
!109 = !DILocation(line: 42, column: 26, scope: !100)
!110 = !DILocalVariable(name: "a", scope: !100, file: !1, line: 43, type: !5)
!111 = !DILocation(line: 43, column: 7, scope: !100)
!112 = !DILocalVariable(name: "b", scope: !100, file: !1, line: 44, type: !5)
!113 = !DILocation(line: 44, column: 7, scope: !100)
!114 = !DILocalVariable(name: "c", scope: !100, file: !1, line: 45, type: !5)
!115 = !DILocation(line: 45, column: 7, scope: !100)
!116 = !DILocation(line: 46, column: 22, scope: !100)
!117 = !DILocation(line: 46, column: 3, scope: !100)
!118 = !DILocation(line: 47, column: 22, scope: !100)
!119 = !DILocation(line: 47, column: 3, scope: !100)
!120 = !DILocation(line: 48, column: 22, scope: !100)
!121 = !DILocation(line: 48, column: 3, scope: !100)
!122 = !DILocation(line: 50, column: 11, scope: !100)
!123 = !DILocation(line: 50, column: 14, scope: !100)
!124 = !DILocation(line: 50, column: 17, scope: !100)
!125 = !DILocation(line: 50, column: 3, scope: !100)
!126 = !DILocation(line: 51, column: 3, scope: !100)
