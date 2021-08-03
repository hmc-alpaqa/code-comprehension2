; ModuleID = 'dumb_sort.bc'
source_filename = "original/dumb_sort.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"d\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32* @compute(i32 %a, i32 %b, i32 %c, i32 %d) #0 !dbg !10 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %res = alloca i32*, align 8
  %temp = alloca i32, align 4
  %temp3 = alloca i32, align 4
  %temp7 = alloca i32, align 4
  %temp11 = alloca i32, align 4
  %temp15 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 %d, i32* %d.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %d.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %res, metadata !21, metadata !DIExpression()), !dbg !22
  %call = call noalias i8* @malloc(i64 16) #4, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %res, align 8, !dbg !22
  %1 = load i32, i32* %a.addr, align 4, !dbg !25
  %2 = load i32, i32* %b.addr, align 4, !dbg !27
  %cmp = icmp sgt i32 %1, %2, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !30, metadata !DIExpression()), !dbg !32
  %3 = load i32, i32* %b.addr, align 4, !dbg !33
  store i32 %3, i32* %temp, align 4, !dbg !32
  %4 = load i32, i32* %a.addr, align 4, !dbg !34
  store i32 %4, i32* %b.addr, align 4, !dbg !35
  %5 = load i32, i32* %temp, align 4, !dbg !36
  store i32 %5, i32* %a.addr, align 4, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %c.addr, align 4, !dbg !39
  %7 = load i32, i32* %d.addr, align 4, !dbg !41
  %cmp1 = icmp sgt i32 %6, %7, !dbg !42
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !43

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %temp3, metadata !44, metadata !DIExpression()), !dbg !46
  %8 = load i32, i32* %d.addr, align 4, !dbg !47
  store i32 %8, i32* %temp3, align 4, !dbg !46
  %9 = load i32, i32* %c.addr, align 4, !dbg !48
  store i32 %9, i32* %d.addr, align 4, !dbg !49
  %10 = load i32, i32* %temp3, align 4, !dbg !50
  store i32 %10, i32* %d.addr, align 4, !dbg !51
  br label %if.end4, !dbg !52

if.end4:                                          ; preds = %if.then2, %if.end
  %11 = load i32, i32* %a.addr, align 4, !dbg !53
  %12 = load i32, i32* %c.addr, align 4, !dbg !55
  %cmp5 = icmp sgt i32 %11, %12, !dbg !56
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !57

if.then6:                                         ; preds = %if.end4
  call void @llvm.dbg.declare(metadata i32* %temp7, metadata !58, metadata !DIExpression()), !dbg !60
  %13 = load i32, i32* %c.addr, align 4, !dbg !61
  store i32 %13, i32* %temp7, align 4, !dbg !60
  %14 = load i32, i32* %a.addr, align 4, !dbg !62
  store i32 %14, i32* %c.addr, align 4, !dbg !63
  %15 = load i32, i32* %temp7, align 4, !dbg !64
  store i32 %15, i32* %a.addr, align 4, !dbg !65
  br label %if.end8, !dbg !66

if.end8:                                          ; preds = %if.then6, %if.end4
  %16 = load i32, i32* %b.addr, align 4, !dbg !67
  %17 = load i32, i32* %d.addr, align 4, !dbg !69
  %cmp9 = icmp sgt i32 %16, %17, !dbg !70
  br i1 %cmp9, label %if.then10, label %if.end12, !dbg !71

if.then10:                                        ; preds = %if.end8
  call void @llvm.dbg.declare(metadata i32* %temp11, metadata !72, metadata !DIExpression()), !dbg !74
  %18 = load i32, i32* %d.addr, align 4, !dbg !75
  store i32 %18, i32* %temp11, align 4, !dbg !74
  %19 = load i32, i32* %b.addr, align 4, !dbg !76
  store i32 %19, i32* %d.addr, align 4, !dbg !77
  %20 = load i32, i32* %temp11, align 4, !dbg !78
  store i32 %20, i32* %b.addr, align 4, !dbg !79
  br label %if.end12, !dbg !80

if.end12:                                         ; preds = %if.then10, %if.end8
  %21 = load i32, i32* %b.addr, align 4, !dbg !81
  %22 = load i32, i32* %c.addr, align 4, !dbg !83
  %cmp13 = icmp sgt i32 %21, %22, !dbg !84
  br i1 %cmp13, label %if.then14, label %if.end16, !dbg !85

if.then14:                                        ; preds = %if.end12
  call void @llvm.dbg.declare(metadata i32* %temp15, metadata !86, metadata !DIExpression()), !dbg !88
  %23 = load i32, i32* %c.addr, align 4, !dbg !89
  store i32 %23, i32* %temp15, align 4, !dbg !88
  %24 = load i32, i32* %b.addr, align 4, !dbg !90
  store i32 %24, i32* %c.addr, align 4, !dbg !91
  %25 = load i32, i32* %temp15, align 4, !dbg !92
  store i32 %25, i32* %b.addr, align 4, !dbg !93
  br label %if.end16, !dbg !94

if.end16:                                         ; preds = %if.then14, %if.end12
  %26 = load i32, i32* %a.addr, align 4, !dbg !95
  %27 = load i32*, i32** %res, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %27, i64 0, !dbg !96
  store i32 %26, i32* %arrayidx, align 4, !dbg !97
  %28 = load i32, i32* %b.addr, align 4, !dbg !98
  %29 = load i32*, i32** %res, align 8, !dbg !99
  %arrayidx17 = getelementptr inbounds i32, i32* %29, i64 1, !dbg !99
  store i32 %28, i32* %arrayidx17, align 4, !dbg !100
  %30 = load i32, i32* %c.addr, align 4, !dbg !101
  %31 = load i32*, i32** %res, align 8, !dbg !102
  %arrayidx18 = getelementptr inbounds i32, i32* %31, i64 2, !dbg !102
  store i32 %30, i32* %arrayidx18, align 4, !dbg !103
  %32 = load i32, i32* %d.addr, align 4, !dbg !104
  %33 = load i32*, i32** %res, align 8, !dbg !105
  %arrayidx19 = getelementptr inbounds i32, i32* %33, i64 3, !dbg !105
  store i32 %32, i32* %arrayidx19, align 4, !dbg !106
  %34 = load i32*, i32** %res, align 8, !dbg !107
  ret i32* %34, !dbg !108
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 !dbg !109 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32* %a, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32* %b, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32* %c, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32* %d, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = bitcast i32* %a to i8*, !dbg !127
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)), !dbg !128
  %1 = bitcast i32* %b to i8*, !dbg !129
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !130
  %2 = bitcast i32* %c to i8*, !dbg !131
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !132
  %3 = bitcast i32* %d to i8*, !dbg !133
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0)), !dbg !134
  %4 = load i32, i32* %a, align 4, !dbg !135
  %5 = load i32, i32* %b, align 4, !dbg !136
  %6 = load i32, i32* %c, align 4, !dbg !137
  %7 = load i32, i32* %d, align 4, !dbg !138
  %call = call i32* @compute(i32 %4, i32 %5, i32 %6, i32 %7), !dbg !139
  ret i32 0, !dbg !140
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
!1 = !DIFile(filename: "original/dumb_sort.c", directory: "/home/klee/text_c")
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
!12 = !{!4, !5, !5, !5, !5}
!13 = !DILocalVariable(name: "a", arg: 1, scope: !10, file: !1, line: 8, type: !5)
!14 = !DILocation(line: 8, column: 18, scope: !10)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !10, file: !1, line: 8, type: !5)
!16 = !DILocation(line: 8, column: 25, scope: !10)
!17 = !DILocalVariable(name: "c", arg: 3, scope: !10, file: !1, line: 8, type: !5)
!18 = !DILocation(line: 8, column: 32, scope: !10)
!19 = !DILocalVariable(name: "d", arg: 4, scope: !10, file: !1, line: 8, type: !5)
!20 = !DILocation(line: 8, column: 39, scope: !10)
!21 = !DILocalVariable(name: "res", scope: !10, file: !1, line: 9, type: !4)
!22 = !DILocation(line: 9, column: 8, scope: !10)
!23 = !DILocation(line: 9, column: 21, scope: !10)
!24 = !DILocation(line: 9, column: 14, scope: !10)
!25 = !DILocation(line: 11, column: 6, scope: !26)
!26 = distinct !DILexicalBlock(scope: !10, file: !1, line: 11, column: 6)
!27 = !DILocation(line: 11, column: 10, scope: !26)
!28 = !DILocation(line: 11, column: 8, scope: !26)
!29 = !DILocation(line: 11, column: 6, scope: !10)
!30 = !DILocalVariable(name: "temp", scope: !31, file: !1, line: 11, type: !5)
!31 = distinct !DILexicalBlock(scope: !26, file: !1, line: 11, column: 13)
!32 = !DILocation(line: 11, column: 18, scope: !31)
!33 = !DILocation(line: 11, column: 25, scope: !31)
!34 = !DILocation(line: 11, column: 32, scope: !31)
!35 = !DILocation(line: 11, column: 30, scope: !31)
!36 = !DILocation(line: 11, column: 39, scope: !31)
!37 = !DILocation(line: 11, column: 37, scope: !31)
!38 = !DILocation(line: 11, column: 44, scope: !31)
!39 = !DILocation(line: 12, column: 6, scope: !40)
!40 = distinct !DILexicalBlock(scope: !10, file: !1, line: 12, column: 6)
!41 = !DILocation(line: 12, column: 10, scope: !40)
!42 = !DILocation(line: 12, column: 8, scope: !40)
!43 = !DILocation(line: 12, column: 6, scope: !10)
!44 = !DILocalVariable(name: "temp", scope: !45, file: !1, line: 12, type: !5)
!45 = distinct !DILexicalBlock(scope: !40, file: !1, line: 12, column: 13)
!46 = !DILocation(line: 12, column: 18, scope: !45)
!47 = !DILocation(line: 12, column: 25, scope: !45)
!48 = !DILocation(line: 12, column: 32, scope: !45)
!49 = !DILocation(line: 12, column: 30, scope: !45)
!50 = !DILocation(line: 12, column: 39, scope: !45)
!51 = !DILocation(line: 12, column: 37, scope: !45)
!52 = !DILocation(line: 12, column: 44, scope: !45)
!53 = !DILocation(line: 13, column: 6, scope: !54)
!54 = distinct !DILexicalBlock(scope: !10, file: !1, line: 13, column: 6)
!55 = !DILocation(line: 13, column: 10, scope: !54)
!56 = !DILocation(line: 13, column: 8, scope: !54)
!57 = !DILocation(line: 13, column: 6, scope: !10)
!58 = !DILocalVariable(name: "temp", scope: !59, file: !1, line: 13, type: !5)
!59 = distinct !DILexicalBlock(scope: !54, file: !1, line: 13, column: 13)
!60 = !DILocation(line: 13, column: 18, scope: !59)
!61 = !DILocation(line: 13, column: 25, scope: !59)
!62 = !DILocation(line: 13, column: 32, scope: !59)
!63 = !DILocation(line: 13, column: 30, scope: !59)
!64 = !DILocation(line: 13, column: 39, scope: !59)
!65 = !DILocation(line: 13, column: 37, scope: !59)
!66 = !DILocation(line: 13, column: 44, scope: !59)
!67 = !DILocation(line: 14, column: 6, scope: !68)
!68 = distinct !DILexicalBlock(scope: !10, file: !1, line: 14, column: 6)
!69 = !DILocation(line: 14, column: 10, scope: !68)
!70 = !DILocation(line: 14, column: 8, scope: !68)
!71 = !DILocation(line: 14, column: 6, scope: !10)
!72 = !DILocalVariable(name: "temp", scope: !73, file: !1, line: 14, type: !5)
!73 = distinct !DILexicalBlock(scope: !68, file: !1, line: 14, column: 13)
!74 = !DILocation(line: 14, column: 18, scope: !73)
!75 = !DILocation(line: 14, column: 25, scope: !73)
!76 = !DILocation(line: 14, column: 32, scope: !73)
!77 = !DILocation(line: 14, column: 30, scope: !73)
!78 = !DILocation(line: 14, column: 39, scope: !73)
!79 = !DILocation(line: 14, column: 37, scope: !73)
!80 = !DILocation(line: 14, column: 44, scope: !73)
!81 = !DILocation(line: 15, column: 6, scope: !82)
!82 = distinct !DILexicalBlock(scope: !10, file: !1, line: 15, column: 6)
!83 = !DILocation(line: 15, column: 10, scope: !82)
!84 = !DILocation(line: 15, column: 8, scope: !82)
!85 = !DILocation(line: 15, column: 6, scope: !10)
!86 = !DILocalVariable(name: "temp", scope: !87, file: !1, line: 15, type: !5)
!87 = distinct !DILexicalBlock(scope: !82, file: !1, line: 15, column: 13)
!88 = !DILocation(line: 15, column: 18, scope: !87)
!89 = !DILocation(line: 15, column: 25, scope: !87)
!90 = !DILocation(line: 15, column: 32, scope: !87)
!91 = !DILocation(line: 15, column: 30, scope: !87)
!92 = !DILocation(line: 15, column: 39, scope: !87)
!93 = !DILocation(line: 15, column: 37, scope: !87)
!94 = !DILocation(line: 15, column: 44, scope: !87)
!95 = !DILocation(line: 17, column: 12, scope: !10)
!96 = !DILocation(line: 17, column: 3, scope: !10)
!97 = !DILocation(line: 17, column: 10, scope: !10)
!98 = !DILocation(line: 18, column: 12, scope: !10)
!99 = !DILocation(line: 18, column: 3, scope: !10)
!100 = !DILocation(line: 18, column: 10, scope: !10)
!101 = !DILocation(line: 19, column: 12, scope: !10)
!102 = !DILocation(line: 19, column: 3, scope: !10)
!103 = !DILocation(line: 19, column: 10, scope: !10)
!104 = !DILocation(line: 20, column: 12, scope: !10)
!105 = !DILocation(line: 20, column: 3, scope: !10)
!106 = !DILocation(line: 20, column: 10, scope: !10)
!107 = !DILocation(line: 21, column: 10, scope: !10)
!108 = !DILocation(line: 21, column: 3, scope: !10)
!109 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 25, type: !110, isLocal: false, isDefinition: true, scopeLine: 25, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!110 = !DISubroutineType(types: !111)
!111 = !{!5, !5, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !1, line: 25, type: !5)
!116 = !DILocation(line: 25, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !1, line: 25, type: !112)
!118 = !DILocation(line: 25, column: 26, scope: !109)
!119 = !DILocalVariable(name: "a", scope: !109, file: !1, line: 26, type: !5)
!120 = !DILocation(line: 26, column: 7, scope: !109)
!121 = !DILocalVariable(name: "b", scope: !109, file: !1, line: 26, type: !5)
!122 = !DILocation(line: 26, column: 10, scope: !109)
!123 = !DILocalVariable(name: "c", scope: !109, file: !1, line: 26, type: !5)
!124 = !DILocation(line: 26, column: 13, scope: !109)
!125 = !DILocalVariable(name: "d", scope: !109, file: !1, line: 26, type: !5)
!126 = !DILocation(line: 26, column: 16, scope: !109)
!127 = !DILocation(line: 27, column: 22, scope: !109)
!128 = !DILocation(line: 27, column: 3, scope: !109)
!129 = !DILocation(line: 28, column: 22, scope: !109)
!130 = !DILocation(line: 28, column: 3, scope: !109)
!131 = !DILocation(line: 29, column: 22, scope: !109)
!132 = !DILocation(line: 29, column: 3, scope: !109)
!133 = !DILocation(line: 30, column: 22, scope: !109)
!134 = !DILocation(line: 30, column: 3, scope: !109)
!135 = !DILocation(line: 33, column: 11, scope: !109)
!136 = !DILocation(line: 33, column: 14, scope: !109)
!137 = !DILocation(line: 33, column: 17, scope: !109)
!138 = !DILocation(line: 33, column: 20, scope: !109)
!139 = !DILocation(line: 33, column: 3, scope: !109)
!140 = !DILocation(line: 34, column: 3, scope: !109)
