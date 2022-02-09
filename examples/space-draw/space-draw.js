function setup(){var cnv=(createCanvas(windowWidth,(windowHeight-50)));((cnv.style)("display","block"));(background(0,0,0));(noStroke());(noFill());(colorMode(HSL));return (changeTool("galaxy"));};
var cur_tool="galaxy";
var shade_hue=0;
function point_in_circle(rad,act_f){return (((theta) => {return (((dist_1) => {return ((() => {return [(dist_1*(cos(theta))),(dist_1*(sin(theta)))];})());})((act_f((random(0,100))))));})((random(0,TWO_PI))));};
function draw_stars(){return (((p) => {return (((size) => {return (((hue_2) => {return (((sat) => {return (((lum) => {return ((() => {(fill(hue_2,sat,lum));return (circle((mouseX+p[0]),(mouseY+p[1]),size));})());})((random(80,90))));})((random(50,100))));})((random(240,400))));})((random(1,4))));})((point_in_circle(200,((x) => {return x;})))));};
function draw_galaxy(){return ((() => {var i=0,t=4000;while((true&&true&&(i<t))){(((idx) => {(((p) => {return (((size) => {return (((hue_3) => {return (((sat) => {return (((alpha_4) => {return ((() => {(fill(hue_3,sat,30,alpha_4));return (circle((mouseX+p[0]),(mouseY+p[1]),size));})());})((random(0.1,0.3))));})((random(30,70))));})((shade_hue+(random(-50,50)))));})((random(2,3))));})((point_in_circle(1000,((x) => {return (randomGaussian(x,1500));})))));return (i+=1);})(i));};undefined;return undefined;})());};
function changeTool(tool){(cur_tool=tool);return (((set_button_underline) => {((["stars","galaxy"]["map"])(((name) => {return (set_button_underline(name,"none"));})));return (set_button_underline(tool,"underline"));})(((name,style) => {return (((select(("#button-"+name)))["style"])("text-decoration",style));})));};
function tryClear(){return (((confirm("really clear canvas?"))===false)?undefined:((() => {return (background(0,0,0));})()));};
function mousePressed(){(((cur_tool==="galaxy")===false)?undefined:((() => {return (shade_hue=(random(0,360)));})()));return (draw_with_cur_tool());};
function mouseDragged(){return (draw_with_cur_tool());};
function draw_with_cur_tool(){return (((t) => {return (((false||(t==="stars"))===false)?(((false||(t==="galaxy"))===false)?undefined:((() => {return (draw_galaxy());})())):((() => {return (draw_stars());})()));})(cur_tool));};

