string="/hosting/cbj/shared/master/jobs/TAIS/jobs/tais_aem_build/branches/feature-Dev/builds/214/log:[2022-06-23T07:23:56.117Z] ch.qos.logback.classic.log4j 0 1.2.3 com.baml.tais.tais_aem_build:jar:6.4.0"

 
 awk '
   BEGIN{
        OFS=";"; 
        print "SPK","REPO","log4j-version","Timestamp"
   }
   { 
      match($0, /^(\/?[^\/]*\/){5}([^\/]*)(\/?[^\/]*\/)([^\/]*)(\/?[^\/]*\/){4}log:\[(.*)\] [^ ]* [0-9]+ ([^ ]*).*$/, a)
      print a[2],a[4],a[7],a[6]
      print gensub(/^(\/?[^\/]*\/){5}([^\/]*)(\/?[^\/]*\/)([^\/]*)(\/?[^\/]*\/){4}log:\[(.*)\] [^ ]* [0-9]+ ([^ ]*).*$/,"\\2;\\4;\\7;\\6",1)
   }' <<<"$string"