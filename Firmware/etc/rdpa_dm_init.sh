#!/bin/sh

echo rdpa_dm_init.sh begin
# Create DS egress_tm objects
bs /bdmf/new egress_tm/dir=ds,index=0,level=queue,mode=sp port/index=lan0
bs /bdmf/new egress_tm/dir=ds,index=1,level=queue,mode=sp port/index=lan1
bs /bdmf/new egress_tm/dir=ds,index=2,level=queue,mode=sp port/index=lan2
bs /bdmf/new egress_tm/dir=ds,index=3,level=queue,mode=sp port/index=lan3

# Configure DS priority queues for LAN emac ports (emac ports schedulers have been already configured)
bs /bdmf/configure egress_tm/dir=ds,index=0 queue_cfg[0]={queue_id=7,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=0 queue_cfg[1]={queue_id=6,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=0 queue_cfg[2]={queue_id=5,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=0 queue_cfg[3]={queue_id=4,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=0 queue_cfg[4]={queue_id=3,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=0 queue_cfg[5]={queue_id=2,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=0 queue_cfg[6]={queue_id=1,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=0 queue_cfg[7]={queue_id=0,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes

bs /bdmf/configure egress_tm/dir=ds,index=1 queue_cfg[0]={queue_id=7,weight=0,drop_alg=dt,drop_threshold=1500,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=1 queue_cfg[1]={queue_id=6,weight=0,drop_alg=dt,drop_threshold=1500,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=1 queue_cfg[2]={queue_id=5,weight=0,drop_alg=dt,drop_threshold=1500,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=1 queue_cfg[3]={queue_id=4,weight=0,drop_alg=dt,drop_threshold=1500,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=1 queue_cfg[4]={queue_id=3,weight=0,drop_alg=dt,drop_threshold=1500,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=1 queue_cfg[5]={queue_id=2,weight=0,drop_alg=dt,drop_threshold=1500,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=1 queue_cfg[6]={queue_id=1,weight=0,drop_alg=dt,drop_threshold=1500,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=1 queue_cfg[7]={queue_id=0,weight=0,drop_alg=dt,drop_threshold=1500,stat_enable=yes},enable=yes

bs /bdmf/configure egress_tm/dir=ds,index=2 queue_cfg[0]={queue_id=7,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=2 queue_cfg[1]={queue_id=6,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=2 queue_cfg[2]={queue_id=5,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=2 queue_cfg[3]={queue_id=4,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=2 queue_cfg[4]={queue_id=3,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=2 queue_cfg[5]={queue_id=2,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=2 queue_cfg[6]={queue_id=1,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=2 queue_cfg[7]={queue_id=0,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes

bs /bdmf/configure egress_tm/dir=ds,index=3 queue_cfg[0]={queue_id=7,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=3 queue_cfg[1]={queue_id=6,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=3 queue_cfg[2]={queue_id=5,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=3 queue_cfg[3]={queue_id=4,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=3 queue_cfg[4]={queue_id=3,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=3 queue_cfg[5]={queue_id=2,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=3 queue_cfg[6]={queue_id=1,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
bs /bdmf/configure egress_tm/dir=ds,index=3 queue_cfg[7]={queue_id=0,weight=0,drop_alg=dt,drop_threshold=128,stat_enable=yes},enable=yes
