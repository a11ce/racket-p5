function setup(){var cnv=(createCanvas(windowWidth,windowHeight));((cnv.style)("display","block"));((console.log)(windowHeight));(background(0,18,29));(stroke(255,255,255));return (fill(0,18,29));};
function windowResized(){(resizeCanvas(windowWidth,windowHeight));return (background(0,18,29));};
function map_range(x,in_min,in_max,out_min,out_max){return (out_min+((x-in_min)*((out_max-out_min)/(in_max-in_min))));};
function looping_noise(seed,radius,t_1){return (((theta) => {return (((x) => {return (((y) => {return ((() => {return (noise((seed+x),(seed+y),(100*seed)));})());})((radius*((Math.sin)(theta)))));})((radius*((Math.cos)(theta)))));})((2*Math["PI"]*t_1)));};
function peak_eq(x){return ((Math.max)((2*(x*x*x)),(0.5*x)));};
function two_val_seeded_random(a,b){return (noise((100*a),(100*b)));};
function shape_eq(x,seed){return ((Math.max)(((Math.min)((10*(0.1+(-((Math.pow)((x/(1.5+(0.5*(noise((100*seed)))))),2))))),1)),0.1));};
var t=0,num_lines=50,num_peaks=30;
function draw(){(background(0,18,29));(((left_x) => {return (((right_x) => {return (((min_y) => {return (((max_y) => {return ((() => {return ((() => {var i=0,t_2=num_lines;while((true&&true&&(i<t_2))){(((idy) => {var cury=(map_range(idy,0,(num_lines-1),min_y,max_y));(beginShape());{var i_4=0,t_3=num_peaks;while((true&&true&&(i_4<t_3))){(((idx) => {var curx=((map_range(idx,0,(num_peaks-1),left_x,right_x))+(two_val_seeded_random(idx,idy)));(vertex(curx,(cury-((windowHeight*0.15)*(shape_eq((map_range(idx,0,29,-1,1)),idy))*(peak_eq((looping_noise((two_val_seeded_random(idx,idy)),1,t))))))));return (i_4+=1);})(i_4));};undefined;}(endShape());return (i+=1);})(i));};undefined;return undefined;})());})());})((windowHeight-min_y)));})((windowHeight/5)));})((windowWidth-left_x)));})((windowWidth/4)));return (t+=0.001);};

