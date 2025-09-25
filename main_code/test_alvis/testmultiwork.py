# -*- coding: utf-8 -*-
"""
Created on Wed Apr 10 16:14:25 2024

@author: andre
"""
import tensorflow as tf

# build multi-worker environment from Slurm variables
cluster_resolver = tf.distribute.cluster_resolver.SlurmClusterResolver(port_base=12345)           
 
# use NCCL communication protocol
implementation = tf.distribute.experimental.CommunicationImplementation.NCCL
communication_options = tf.distribute.experimental.CommunicationOptions(implementation=implementation)
 
#declare distribution strategy
strategy = tf.distribute.MultiWorkerMirroredStrategy(cluster_resolver=cluster_resolver,
                                                     communication_options=communication_options)