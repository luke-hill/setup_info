Posting my learnings in here about the docker "issues" encountered on master-api. TL;DR - Installing node modules was a pain in "our" setup for docker.

My thoughts:

VOLUMES: When building docker images using compose, often you'll use shared volumes. In essence these are mapping one folder structure (Including files), from your ecosystem (computer), to the docker daemon. This is done at runtime. As such if your build steps contain steps that modify files in a file structure that is mapped by the volume, these will be overwritten at runtime by the shared volume. This is because the volume sharing works like a clobbering system

JS: Node modules are installed using a heightened privilege setting. TL;DR they cause a lot of pain. One way around this is to install them somewhere else and move them. This will then treat you as the owner. However you must ensure this doesn't conflict with VOLUME issues above.

Possible issue:
 We couldn't seem to get node modules to install. After a long and painful triage. I found out this is because the volume and build commands were fighting with each other. But because they both ran successfully, there was no visual representation. The primary issue is JS node modules by default install in ./REPO whereas gems for instance by default install in ~/.rvm/......Which is outside the repo (And the mapping). NB: Some repos will install gems to ./REPO/vendor/bundle - and if we had done this, we would have encountered the same issue with ruby.

Solution Points:

We mount a "series" of smaller volumes. Allowing people to have hotloading of "most" files

We have 2 different dockerfiles, which for the grunt service will npm install and have a small subset of the repo's files and for the regular app it will have all the files but no node modules

We retain everything we have, but then we have a standalone "script" you run as a 1-time arg any time you want to rebuild node modules (When running "inside" a docker container any alterations are propagated throughout the volume, so the local system would then retain and cache the updated modules)

We do nothing, and just change the anonymous volume to a mounted volume.
