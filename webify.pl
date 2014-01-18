#!/usr/bin/perl

# Extract segment of MOV to mp4
# -ss is start time, -t is the duration
# /Users/stuartlowe/ffmpeg/ffmpeg/ffmpeg -y -i MVI_3864.MOV -r 30000/1001 -b 5M -bt 6M -vcodec mpeg4 -ss 424 -t 192 -an output.mp4
#

# Convert to WebM (cropped)
# /Applications/VLC.app/Contents/MacOS/VLC --intf=rc --stop-time=62 output.mp4 --sout "#transcode{vcodec=VP80,vb=500,acodec=vorbis,ab=48,channels=2,afilter="no-audio",vfilter=croppadd{cropright=100,cropleft=100,cropbottom=4},width=800}:std{access=file,mux="ffmpeg{mux=webm}",dst=movie.webm}"

# Convert to MP4 (cropped)
# /Users/stuartlowe/ffmpeg/ffmpeg/ffmpeg -i output.mp4 -b 500k -vf crop=in_w-512:in_h:256:0,scale=600:-1 movie.mp4
#
# MOV -> Wav
# /Users/stuartlowe/ffmpeg/ffmpeg/ffmpeg -i MVI_4139.MOV mvi_4139.wav

# Wav -> Low bandwidth OGG
# /Applications/VLC.app/Contents/MacOS/VLC --intf=rc alyssa.wav --sout "#transcode{acodec=vorb,ab=16,samplerate=11025}:standard{mux=ogg,dst=/Users/stuartlowe/Projects/dotastronomy/talks/goodman/source/alyssatest2.ogg,access=file}" vlc://quit
# Wav -> Low bandwidth MP3
# /Applications/VLC.app/Contents/MacOS/VLC --intf=rc alyssa.wav --sout "#transcode{acodec=mp3,ab=16,channels=2,samplerate=22050}:standard{mux=raw,dst=/Users/stuartlowe/Projects/dotastronomy/talks/goodman/source/alyssatest2.mp3,access=file}" vlc://quit


# USAGE:
#
# perl webify.pl <dir> [makepics] [makeaudio]
#
# where:
#  * dir = Directory for the presentation. This directory should contain:
#          * source/setup.txt file containing details of the presentation
#          * source/<dir>.wav - the presentation audio
#          * source/<images> - each of the images referenced in setup.txt
#          * source/<videos> - each of the movies referenced in setup.txt
#          * source/tweets.txt - the tweets, 1 per line e.g. {"place":null,"text":"good :: intentional choices in data viz -- data, designer, reader: \"it's not about YOU\" (the scientist) #dotastro","id_str":"222967019451064320","favorited":false,"coordinates":null,"geo":null,"created_at":"Wed Jul 11 08:14:14 +0000 2012","in_reply_to_status_id_str":null,"contributors":null,"in_reply_to_screen_name":null,"source":"\u003Ca href=\"http:\/\/twitter.com\/#!\/download\/ipad\" rel=\"nofollow\"\u003ETwitter for iPad\u003C\/a\u003E","in_reply_to_user_id_str":null,"in_reply_to_user_id":null,"in_reply_to_status_id":null,"retweeted":false,"retweet_count":0,"truncated":false,"user":{"is_translator":false,"profile_use_background_image":true,"profile_image_url_https":"https:\/\/si0.twimg.com\/profile_images\/2170807289\/twitter_normal.jpg","id_str":"16890327","profile_text_color":"53777A","statuses_count":3441,"following":null,"profile_background_image_url":"http:\/\/a0.twimg.com\/profile_background_images\/130022541\/x0772cc6c941c080a0be8854dbc49f6b.png","followers_count":337,"profile_image_url":"http:\/\/a0.twimg.com\/profile_images\/2170807289\/twitter_normal.jpg","default_profile_image":false,"created_at":"Tue Oct 21 18:01:26 +0000 2008","profile_link_color":"C02942","description":"watching a virtual sky, reading at a digital library, tweeting to the ghosts in the machine.","time_zone":"Eastern Time (US & Canada)","favourites_count":1131,"friends_count":395,"url":"http:\/\/www.google.com\/profiles\/august.fly","verified":false,"profile_background_color":"D95B43","profile_background_tile":true,"profile_background_image_url_https":"https:\/\/si0.twimg.com\/profile_background_images\/130022541\/x0772cc6c941c080a0be8854dbc49f6b.png","contributors_enabled":false,"geo_enabled":false,"notifications":null,"profile_sidebar_fill_color":"ECD078","protected":false,"location":"lincoln, ma","listed_count":24,"follow_request_sent":null,"name":"August Muench","profile_sidebar_border_color":"542437","id":16890327,"default_profile":false,"show_all_inline_media":true,"lang":"en","utc_offset":-18000,"screen_name":"augustmuench"},"id":222967019451064320,"entities":{"urls":[],"hashtags":[{"text":"dotastro","indices":[104,113]}],"user_mentions":[]}}{"place":null,"text":"RT @augustmuench: good :: intentional choices in data viz -- data, designer, reader: \"it's not about YOU\" (the scientist) #dotastro","id_str":"222967250578194432","favorited":false,"coordinates":null,"geo":null,"created_at":"Wed Jul 11 08:15:09 +0000 2012","in_reply_to_status_id_str":null,"contributors":null,"in_reply_to_screen_name":null,"source":"\u003Ca href=\"http:\/\/www.tweetdeck.com\" rel=\"nofollow\"\u003ETweetDeck\u003C\/a\u003E","in_reply_to_user_id_str":null,"in_reply_to_user_id":null,"in_reply_to_status_id":null,"retweeted":false,"retweet_count":0,"truncated":false,"user":{"is_translator":false,"profile_use_background_image":false,"profile_image_url_https":"https:\/\/si0.twimg.com\/profile_images\/2225116000\/paper_sa_normal.jpg","id_str":"15099133","profile_text_color":"000000","statuses_count":23314,"following":null,"profile_background_image_url":"http:\/\/a0.twimg.com\/images\/themes\/theme1\/bg.png","followers_count":3959,"profile_image_url":"http:\/\/a0.twimg.com\/profile_images\/2225116000\/paper_sa_normal.jpg","default_profile_image":false,"created_at":"Thu Jun 12 17:59:04 +0000 2008","profile_link_color":"0000ff","description":"Astronomer. Educator. Maker of tiny comets. Finished my Ph.D, and now working on http:\/\/cosmoquest.org\/","time_zone":"Eastern Time (US & Canada)","favourites_count":54,"friends_count":886,"url":"http:\/\/noisyastronomer.com","verified":false,"profile_background_color":"5916AF","profile_background_tile":false,"profile_background_image_url_https":"https:\/\/si0.twimg.com\/images\/themes\/theme1\/bg.png","contributors_enabled":false,"geo_enabled":false,"notifications":null,"profile_sidebar_fill_color":"8BA4E1","protected":false,"location":"Edwardsville, IL","listed_count":543,"follow_request_sent":null,"name":"Nicole","profile_sidebar_border_color":"02239B","id":15099133,"default_profile":false,"show_all_inline_media":false,"lang":"en","utc_offset":-18000,"screen_name":"NoisyAstronomer"},"id":222967250578194432,"entities":{"urls":[],"hashtags":[{"text":"dotastro","indices":[122,131]}],"user_mentions":[{"indices":[3,16],"id_str":"16890327","name":"August Muench","id":16890327,"screen_name":"augustmuench"}]}}
#  * makepics = [true] if you want to (re-)generate the stills
#  * makeaudio = [true] if you want to (re-)generate the audio
# There should also be a template.html file in the working directory

$app{'VLC'} = "/Applications/VLC.app/Contents/MacOS/VLC";
$app{'ffmpeg'} = "/Users/stuartlowe/ffmpeg/ffmpeg/ffmpeg";
$app{'convert'} = "convert";

use Time::Local;

$dir = $ARGV[0];
$dir =~ s/\/$//g;
$makepics = 0;
$makeaudio = 0;
if($ARGV[1]){ $makepics = 1; }
if($ARGV[2]){ $makeaudio = 1; }

if(!-d $dir){
	print "No directory\n";
	exit;
}

if($makepics == 1){
	print "Moving screenshots.\n";
	opendir my($dh), $dir or die "Couldn't open dir '$dir': $!";
	my @files = readdir $dh;
	closedir $dh;
	$j = 0;
	for($i = 0; $ i < (@files) ; $i++){
		if($files[$i] =~ /^Screen.*.png/){
			$j++;
			`mv '$dir/$files[$i]' $dir/$j.png`;
		}
	}
}

if($makeaudio == 1){
	print "Encoding audio...\n";
	opendir my($dh), $dir."/source/" or die "Couldn't open dir '$dir/source/': $!";
	my @files = readdir $dh;
	closedir $dh;
	for($i = 0; $ i < (@files) ; $i++){
		if($files[$i] =~ /^$dir.wav$/){

			print "  - Low bandwidth OGG\n";
			$dst = "$dir/$dir\_low.ogg";
			if(!-e $dst){ `$app{'VLC'} --intf=rc $dir/source/$files[$i] --sout "#transcode{acodec=vorb,ab=16,samplerate=11025}:standard{mux=ogg,dst=$dst,access=file}" vlc://quit`; }
			print "done\n";

			print "  - High bandwidth OGG\n";
			$dst = "$dir/$dir.ogg";
			if(!-e $dst){ `$app{'VLC'} --intf=rc $dir/source/$files[$i] --sout "#transcode{acodec=vorb,ab=64,samplerate=22050}:standard{mux=ogg,dst=$dst,access=file}" vlc://quit`; }
			print "done\n";

			print "  - Low bandwidth MP3\n";
			$dst = "$dir/$dir\_low.mp3";
			if(!-e $dst){ `$app{'VLC'} --intf=rc $dir/source/$files[$i] --sout "#transcode{acodec=mp3,ab=16,channels=2,samplerate=22050}:standard{mux=raw,dst=$dst,access=file}" vlc://quit` };
			print "done\n";

			print "  - High bandwidth MP3...\n";
			$dst = "$dir/$dir.mp3";
			if(!-e $dst){ `$app{'VLC'} --intf=rc $dir/source/$files[$i] --sout "#transcode{acodec=mp3,ab=64,channels=2,samplerate=22050}:standard{mux=raw,dst=$dst,access=file}" vlc://quit` };
			print "done\n";
		}
	}	
# $app{'VLC'} --intf=rc alyssa.wav --sout "#transcode{acodec=vorb,ab=16,samplerate=11025}:standard{mux=ogg,dst=/Users/stuartlowe/Projects/dotastronomy/talks/goodman/source/alyssatest2.ogg,access=file}" vlc://quit
# Wav -> Low bandwidth MP3
# $app{'VLC'} --intf=rc alyssa.wav --sout "#transcode{acodec=mp3,ab=16,channels=2,samplerate=22050}:standard{mux=raw,dst=/Users/stuartlowe/Projects/dotastronomy/talks/goodman/source/alyssatest2.mp3,access=file}" vlc://quit

}

# Load the setup
open(FILE,"$dir/setup.txt");
@lines = <FILE>;
close(FILE);
$photographer = "Dotastronomy";

@ls = ();
$precrop = "";
foreach $line (@lines){
	$line =~ s/[\n\r]//g;
	if($line =~ /Title: (.*)$/){
		$title = $1;
	}elsif($line =~ /Audio: (.*)$/){
		$audio = $1;
	}elsif($line =~ /Picture: (.*)$/){
		$picture = $1;
	}elsif($line =~ /Photographer: (.*)$/){
		$photographer = $1;
	}elsif($line =~ /Fullname: (.*)$/){
		$fullname = $1;
	}elsif($line =~ /Date: (.*)$/){
		$date = $1;
	}elsif($line =~ /Width: (.*)$/){
		$width = $1;
	}elsif($line =~ /Height: (.*)$/){
		$height = $1;
	}elsif($line =~ /Start: (.*)$/){
		$talkstart = $1;
	}elsif($line =~ /More: (.*)$/){
		$more = $1;
	}elsif($line =~ /About: (.*)$/){
		$about = "\t\t\t\t\t<div class=\"about\">\n\t\t\t\t\t\t".$1."\n\t\t\t\t\t</div>";
	}elsif($line =~ /Crop: (.*)$/){
		$precrop = "-gravity center -crop $1\+0\+0 \+repage";
	}elsif($line =~ /Expand: (.*)$/){
		$preexpand = "-gravity center -resize $1\+0\+0 -extent $1\+0\+0";
	}else{
		push(@ls,$line);
	}	
}

if(!$width){ $width = 1024; }
if(!$height){ $height = 768; }

if($makepics == 1){
	print "Converting images to jpg.\n";
	opendir my($dh), $dir or die "Couldn't open dir '$dir': $!";
	my @files = readdir $dh;
	closedir $dh;
	for($i = 0; $ i < (@files) ; $i++){
		if($files[$i] =~ /.png$/ || $files[$i] =~ /.jpeg$/){
			$files[$i] =~ s/.(png|jpeg)$//;
			$ext = $1;
			$wh = $width."x".$height;
			`$app{'convert'} $dir/$files[$i].$ext $preexpand $precrop -resize $wh\^ -gravity center -crop $wh\+0\+0\^ +repage -quality 80 $dir/$files[$i].jpg`;
			`$app{'convert'} $dir/$files[$i].jpg -quality 60 -resize 400x $dir/$files[$i]_medium.jpg`;
			`$app{'convert'} $dir/$files[$i].jpg -quality 60 -resize 168x $dir/$files[$i]_small.jpg`;
		}
	}
}

$tstart = parse_datetime($talkstart);
$tzoffset = 2;

open(TMPL,"template.html");
@lines = <TMPL>;
close(TMPL);



$slides = "";
%messages = ();
$i = 0;
$s = 0;
foreach $l (@ls){
	if($l){
		($timestamp,$t,$rest) = split('\t',$l);
		if($t eq "slide"){
			$s++;
		}
	}
}

foreach $l (@ls){
	if($l){
		$full = "";
		($timestamp,$t,$rest) = split('\t',$l);
		if($t eq "slide"){
			$i++;
			if($rest !~ /.jpe?g/){ $full .= $rest.".jpg"; }
			else{ $full = $rest; }
			$small = $full;
			$small =~ s/(.jpg)$/\_small$1/;
			$prevnext = "";
			if($i > 1){ $prevnext .= "<a href=\"#".($i-1)."\">previous</a>"; }
			if($i > 1 && $i < $s){ $prevnext .= " | "; }
			if($i < $s){ $prevnext .= "<a href=\"#".($i+1)."\">next</a>"; }
			$extra = ($i % 3 == 0) ? " last" : "";
			$slides .= "							<li class=\"slide one-fourth".($extra)."\" id=\"".($i)."\"><div class=\"pic\"><a href=\"$full\" class=\"big_slide\"><img src=\"$small\" alt=\"Slide $i\" /></a></div><div class=\"timestamp\">Time: <time>$timestamp</time>. $prevnext</div></li>\n";
		}
		if($t eq "video"){
			$i++;
			$prevnext = "";
			if($i > 1){ $prevnext .= "<a href=\"#".($i-1)."\">previous</a>"; }
			if($i > 1 && $i < $s){ $prevnext .= " | "; }
			if($i < $s){ $prevnext .= "<a href=\"#".($i+1)."\">next</a>"; }
			$prevnext = "<a href=\"#slide-".($i)."\">previous</a> | <a href=\"#".($i+1)."\">next</a>";
			$extra = ($i % 3 == 0) ? " last" : "";
			$slides .= "							<li class=\"slide slide-video one-fourth".($extra)."\" id=\"".($i)."\"><div class=\"pic\"><video id=\"video$i\" width=\"100%\" poster=\"$rest.jpg\"><source src=\"$rest.webm\" type=\"video/webm\" /><source src=\"$rest.mp4\" type=\"video/mp4\" /></video></div><div class=\"timestamp\">Time: <time>$timestamp</time></div></li>\n";
		}
		if($t eq "message"){
			($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($tstart+parse_timestamp($timestamp)+$tzoffset*3600);
			$keep = $timestamp;
			$timestamp = format_times($hour,$min,$sec);
			$messages{$timestamp."_note"} = "<div class=\"bubble bubble-east\"><div class=\"bubble-inner\"><div class=\"timestamp\" data=\"$keep\"><time>$timestamp</time></div> $rest</div></div>";
		}
		if($t eq "end"){
			$end = $timestamp;
		}
	}
}
if($slides){ $slides = "\t\t\t\t\t\t<ul class=\"speakers\">\n".$slides."\t\t\t\t\t\t</ul>"; }

if($more){
	@moretalks = split(/,/,$more);
	$more = "				<div class=\"hr\"></div>\n";
	$more .= "				<h2>More talks...</h2>\n";
	$more .= "				<ul class=\"other-speakers\">\n";
	$i = 0;
	foreach $talk (@moretalks){
		open(ALTN,"$talk/setup.txt") || print "Can't open file\n";
		@altlines = <ALTN>;
		close(ALTN);

		foreach $line (@altlines){

			$line =~ s/[\n\r]//g;
			if($line =~ /Title: (.*)$/){
				$alttitle = $1;
			}elsif($line =~ /Fullname: (.*)$/){
				$altname = $1;
			}
		}
		$extra = ($i == 3) ? " last" : "";
		$more .= "					<li class=\"one-fourth".$extra."\"><a href=\"../$talk/index.html\"><img src=\"../$talk\/0_small.jpg\" alt=\"$alttitle\" title=\"$alttitle\" \/><\/a><div class=\"text\"><p><a href=\"..\/$talk\/index.html\">$alttitle<\/a><br />by $altname<\/p><\/div><\/li>\n";
		$i++;
	}
	$more .= "				</ul>\n";
}	


open(TW,"$dir/tweets.txt");
@tweets = <TW>;
close(TW);

foreach $tweet (@tweets){
	$tweet =~ s/\\\//\//g;
	if($tweet =~ /"url":"([^\"]*)","expanded_url":"([^\"]*)"/){
		$expander{$1} = $2;
	}
}

foreach $tweet (@tweets){
	$tweet =~ s/\\\"/&quot;/g;
	$tweet =~ s/\\u201[cd]/&quot;/g;
	$tweet =~ s/\\u2026/\&#8230;/g;
	if($tweet =~ /\"name\":\"([^\"]*)"/){ $name = $1; }
	if($tweet =~ /\"screen_name\":\"([^\"]*)"/){ $screen_name = $1; }
	if($tweet =~ /\"screen_name\":\"[^\"]*"},"id":(\d+),/){ $statusid = $1; }
	if($tweet =~ /\"profile_image_url\":\"([^\"]*)"/){ $profile_image_url = $1; $profile_image_url =~ s/\\//g; }
	$text = "";
	if($tweet =~ /\"text\":\"([^\"]+)\"/){
		$text = $1;
	}
	if($text =~ /^RT/ && $tweet =~ /\"retweeted_status\"[^\}]+\"text\":\"([^\"]*)\"/){
		$text = $1;
	}
	if($text){
		$text =~ s/RT \@$name//g;
		$text =~ s/\\\//\//g;
		$text =~ s/(https?:\/\/[^\s]*)/$expander{$1}/g;
		$text =~ s/(https?:\/\/)([^\s]*)/\<a href='$1$2'\>$2\<\/a\>/g;
		$text =~ s/\@([a-zA-Z0-9\_]*)/\@\<a href='http:\/\/twitter.com\/$1'\>$1\<\/a\>/g;
	}
	if($tweet =~ /\"created_at\":\"([^\"]*)"/){ $created_at = parse_datetime($1); }
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($created_at+$tzoffset*3600);
	$diff = $created_at-$tstart;
	if($diff > 0){
		$timestamp = format_times($hour,$min,$sec);
		$messages{$timestamp."_tweet"} = "<div class=\"bubble bubble-north\"><div class=\"bubble-inner\"><div class=\"timestamp\" data=\"".format_timestamp($diff)."\"><time>$timestamp<\/time><\/div> $text</div></div><div class=\"tweeter\"><div class=\"profile_image\"><a href=\"http://twitter.com/$screen_name/statuses/$statusid\"><img src=\"".$profile_image_url."\" alt=\"$screen_name\" title=\"$screen_name\" \/></a></div></div>";
	}
}

$n = keys %messages;

if($n > 0){
	$messages = "\t\t\t\t\t\t<ul>\n";
	foreach $key (sort keys %messages){
		($ts,$t) = split(/\_/,$key);
		$messages .= "							<li class=\"$t\">$messages{$key}</li>\n";
	}	
	$messages .= "\t\t\t\t\t\t</ul>";
}

$oggsize = sprintf("%0.1f",(-s "$dir/$dir.ogg")/(1024*1024))." MB";
$mp3size = sprintf("%0.1f",(-s "$dir/$dir.mp3")/(1024*1024))." MB";

@pics = split(/ /,$picture);
if(@pics > 1){
	$pic = "";
	for($i = 0; $i < @pics ; $i++){
		$pic .= "<div class=\"avatar\"><img src=\"$pics[$i]\" alt=\"Avatar\" /></div>";
	}
}else{
	$pic = "<div class=\"avatar\"><img src=\"$picture\" alt=\"Avatar\" /></div>";
}


open(HTML,">","$dir/index.html");
foreach $line (@lines){
	$line =~ s/\{\% TITLE \%\}/$title/g;
	$line =~ s/\{\% AUDIO \%\}/$audio/g;
	$line =~ s/\{\% AUDIO_OGG_SIZE \%\}/$oggsize/g;
	$line =~ s/\{\% AUDIO_MP3_SIZE \%\}/$mp3size/g;
	$line =~ s/\{\% PICTURE \%\}/$pic/g;
	$line =~ s/\{\% PHOTOGRAPHER \%\}/$photographer/g;
	$line =~ s/\{\% FULLNAME \%\}/$fullname/g;
	$line =~ s/\{\% DATE \%\}/$date/g;
	$line =~ s/\{\% TOTAL \%\}/$end/g;
	$line =~ s/\{\% ABOUT \%\}/$about/g;
	$line =~ s/\{\% SLIDES \%\}/$slides/g;
	$line =~ s/\{\% MESSAGES \%\}/$messages/g;
	$line =~ s/\{\% MORE \%\}/$more/g;
	print HTML $line;
}
close(HTML);


sub parse_timestamp {
	local ($t,$min,$sec,$i);
	($min,$sec) = split(":",$_[0]);
	return (int($min)*60 + int($sec));
}
sub format_times {
	local ($t,$hour,$min,$sec,$i);
	$hour = $_[0];
	$min = $_[1];
	$sec = $_[2];
	return sprintf('%02d:%02d:%02d',$hour,$min,$sec);
}
sub format_timestamp {
	local ($t,$hour,$min,$sec,$i);
	$t = $_[0];
	$min = int(($t)/60);
	$sec = $t - ($min*60);
	return sprintf('%02d:%02d',$min,$sec);
}
sub parse_datetime {
	local ($day,$mon,$mday,$t,$tz,$y,$hour,$min,$sec,@months,$i);
	$d = $_[0];
	# Mon Jul 09 08:59:33 +0000 2012
	($day,$mon,$mday,$t,$tz,$year) = split(/ /,$d);
	($hour,$min,$sec) = split(/\:/,$t);
	@months = ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');

	for($i = 0 ; $i < @months ; $i++){
		if($months[$i] eq $mon){ $mon = $i; }
	}
	return timelocal($sec,$min,$hour,$mday,$mon,$year);
}