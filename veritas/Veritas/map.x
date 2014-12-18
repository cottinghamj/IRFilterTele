#include "std.x"
#include "ipc.x"
block Dup3 {
    input UNSIGNED16 S1;
    output UNSIGNED16 S2;
    output UNSIGNED16 S3;
    output UNSIGNED16 S4;
};
platform HDL {
    impl Dup3(base="Dup3");
};
block PrimaryFilter {
    config UNSIGNED32 outputCount = 1000
    config UNSIGNED32 width = 40
    config UNSIGNED32 height = 40
    input UNSIGNED16 pixelIn;
    input UNSIGNED16 lowThreshIn;
    input UNSIGNED16 highThreshIn;
    output UNSIGNED16 pixelOut;
};
platform HDL {
    impl PrimaryFilter(base="PrimaryFilter");
};
block BorderExtInput {
    config UNSIGNED32 width = 40
    config UNSIGNED32 height = 40
    input UNSIGNED16 S1;
    output UNSIGNED16 S2;
};
platform HDL {
    impl BorderExtInput(base="BorderExtInput");
};
block StdDev {
    config UNSIGNED32 outputCount = 1
    input FLOAT32 S1;
    input UNSIGNED16 S2;
    output FLOAT32 S3;
};
platform HDL {
    impl StdDev(base="StdDev");
};
block Dup2 {
    input FLOAT32 S1;
    output FLOAT32 S2;
    output FLOAT32 S3;
};
platform HDL {
    impl Dup2(base="Dup2");
};
block BorderExtLoThreshold {
    config UNSIGNED32 width = 40
    config UNSIGNED32 height = 40
    input UNSIGNED16 S1;
    output UNSIGNED16 S2;
};
platform HDL {
    impl BorderExtLoThreshold(base="BorderExtLoThreshold");
};
block Mean {
    config UNSIGNED32 outputCount = 1
    input UNSIGNED16 S1;
    output FLOAT32 S2;
};
platform HDL {
    impl Mean(base="Mean");
};
block Threshold {
    input FLOAT32 S1;
    input FLOAT32 S2;
    output UNSIGNED16 S3;
    output UNSIGNED16 S4;
};
platform HDL {
    impl Threshold(base="Threshold");
};
block BorderExtHiThreshold {
    config UNSIGNED32 width = 40
    config UNSIGNED32 height = 40
    input UNSIGNED16 S1;
    output UNSIGNED16 S2;
};
platform HDL {
    impl BorderExtHiThreshold(base="BorderExtHiThreshold");
};
block _output {
    input UNSIGNED16 S1;
};
platform C {
    impl _output(base="_output");
};
block _input {
    config UNSIGNED32 iterations = 0
    output UNSIGNED16 S1;
};
platform C {
    impl _input(base="_input");
};
block RunLengthEncode {
    config UNSIGNED16 pixelCount = 1600
    input UNSIGNED16 S1;
    output UNSIGNED16 S2;
};
platform HDL {
    impl RunLengthEncode(base="RunLengthEncode");
};

block top {

    Dup3 instance2;
    PrimaryFilter instance10(outputCount=1,width=40,height=40);
    BorderExtInput instance3;
    StdDev instance6;
    Dup2 instance5;
    BorderExtLoThreshold instance8;
    Mean instance4;
    Threshold instance7;
    BorderExtHiThreshold instance9;
    _output instance12;
    _input instance1(iterations=1);
    RunLengthEncode instance11;


edge8: instance6.S3 -> instance7.S2;
edge1: instance1.S1 -> instance2.S1;
edge3: instance2.S3 -> instance4.S1;
edge15: instance11.S2 -> instance12.S1;
edge5: instance5.S2 -> instance6.S1;
edge12: instance8.S2 -> instance10.lowThreshIn;
edge4: instance4.S2 -> instance5.S1;
edge6: instance2.S4 -> instance6.S2;
edge7: instance5.S3 -> instance7.S1;
edge13: instance9.S2 -> instance10.highThreshIn;
edge14: instance10.pixelOut -> instance11.S1;
edge9: instance7.S3 -> instance8.S1;
edge11: instance3.S2 -> instance10.pixelIn;
edge2: instance2.S2 -> instance3.S1;
edge10: instance7.S4 -> instance9.S1;

};
use top app;
map device2[1] = { app.edge15 };
map device1[1] = { app.edge1 };



