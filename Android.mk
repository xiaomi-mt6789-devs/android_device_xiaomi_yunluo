#
# Copyright (C) 2023 LineageOS
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),yunluo)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

# Libraries / Binaries linked to <dir>/<platform>/<lib>.so
VENDOR_PLATFORM_LINKS := \
	$(TARGET_OUT_VENDOR)/bin/jpegtool \
	$(TARGET_OUT_VENDOR)/bin/v3avpud.mt6789 \
	$(TARGET_OUT_VENDOR)/bin/hw/android.hardware.graphics.allocator@4.0-service-mediatek.mt6789 \
	$(TARGET_OUT_VENDOR)/bin/hw/camerahalserver \
	$(TARGET_OUT_VENDOR)/lib/arm.graphics-V1-ndk_platform.so \
	$(TARGET_OUT_VENDOR)/lib/egl/libGLES_mali.so \
    $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so \
    $(TARGET_OUT_VENDOR)/lib/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so \
	$(TARGET_OUT_VENDOR)/lib/hw/gralloc.common.so \
	$(TARGET_OUT_VENDOR)/lib/hw/vendor.mediatek.hardware.camera.atms@1.0-impl.so \
	$(TARGET_OUT_VENDOR)/lib/hw/vendor.mediatek.hardware.camera.bgservice@1.1-impl.so \
	$(TARGET_OUT_VENDOR)/lib/hw/vendor.mediatek.hardware.pq@2.15-impl.so \
	$(TARGET_OUT_VENDOR)/lib/hw/vulkan.mali.so \
	$(TARGET_OUT_VENDOR)/lib/libaal_cust_func.so \
	$(TARGET_OUT_VENDOR)/lib/libaalservice.so \
	$(TARGET_OUT_VENDOR)/lib/libaiselector.so \
	$(TARGET_OUT_VENDOR)/lib/libcam.hal3a.log.so \
	$(TARGET_OUT_VENDOR)/lib/libcam.halsensor.hwintegration.so \
	$(TARGET_OUT_VENDOR)/lib/libcamalgo.platform2.so \
	$(TARGET_OUT_VENDOR)/lib/libcameracustom.lens.so \
	$(TARGET_OUT_VENDOR)/lib/libcameracustom.so \
	$(TARGET_OUT_VENDOR)/lib/libdpframework.so \
	$(TARGET_OUT_VENDOR)/lib/libgpudataproducer.so \
	$(TARGET_OUT_VENDOR)/lib/libmtk_drvb.so \
	$(TARGET_OUT_VENDOR)/lib/libnir_neon_driver.so \
	$(TARGET_OUT_VENDOR)/lib/libpq_cust_base.so \
	$(TARGET_OUT_VENDOR)/lib/libpq_prot.so \
	$(TARGET_OUT_VENDOR)/lib/libpqparamparser.so \
	$(TARGET_OUT_VENDOR)/lib/libvcodec_utility.so \
	$(TARGET_OUT_VENDOR)/lib/libvcodec_utility_v3a.so \
	$(TARGET_OUT_VENDOR)/lib/libvcodecdrv.so \
	$(TARGET_OUT_VENDOR)/lib/libvcodecdrv_v3a.so \
	$(TARGET_OUT_VENDOR)/lib/libvpudv3a_vcodec.so \
	$(TARGET_OUT_VENDOR)/lib64/arm.graphics-V1-ndk_platform.so \
	$(TARGET_OUT_VENDOR)/lib64/egl/libGLES_mali.so \
	$(TARGET_OUT_VENDOR)/lib64/gc08a3_mipi_raw_IdxMgr.so \
	$(TARGET_OUT_VENDOR)/lib64/gc08a3_mipi_raw_tuning.so \
	$(TARGET_OUT_VENDOR)/lib64/hi846_mipi_raw_IdxMgr.so \
	$(TARGET_OUT_VENDOR)/lib64/hi846_mipi_raw_tuning.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.camera.provider@2.6-impl-mediatek.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/gralloc.common.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.camera.atms@1.0-impl.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.camera.bgservice@1.1-impl.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.camera.ccap@1.0-impl.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.camera.isphal@1.0-impl.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.camera.isphal@1.1-impl.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.camera.lomoeffect@1.0-impl.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.pq@2.15-impl.so \
	$(TARGET_OUT_VENDOR)/lib64/hw/vulkan.mali.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.ae.core.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.ae.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.ae.stat.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.af.assist.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.af.assist.utils.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.af.core.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.af.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.alsflicker.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.awb.core.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.ccudrv.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.ccuif.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.custom.ae.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.dce.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.flash.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.flicker.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.gma.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.lce.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.log.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.n3d3a.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.sensors.color.so \
	$(TARGET_OUT_VENDOR)/lib64/lib3a.sensors.flicker.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_gc08a3mipiraw_Face_Capture.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_gc08a3mipiraw_Scene_Capture.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_gc08a3mipiraw_Scene_Capture_4cell.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_gc08a3mipiraw_Scene_Preview.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_gc08a3mipiraw_Scene_Preview_4k.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_gc08a3mipiraw_Video_1080.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_gc08a3mipiraw_Video_4k.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_hi846mipiraw_Face_Capture.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_hi846mipiraw_Scene_Capture.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_hi846mipiraw_Scene_Capture_4cell.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_hi846mipiraw_Scene_Preview.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_hi846mipiraw_Scene_Preview_4k.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_hi846mipiraw_Video_1080.so \
	$(TARGET_OUT_VENDOR)/lib64/libCamera_hi846mipiraw_Video_4k.so \
	$(TARGET_OUT_VENDOR)/lib64/libDR.so \
	$(TARGET_OUT_VENDOR)/lib64/libSonyIMX230PdafLibrary.so \
	$(TARGET_OUT_VENDOR)/lib64/libSonyIMX230PdafLibraryWrapper.so \
	$(TARGET_OUT_VENDOR)/lib64/libSonyIMX338PdafLibrary.so \
	$(TARGET_OUT_VENDOR)/lib64/libSonyIMX338PdafLibraryWrapper.so \
	$(TARGET_OUT_VENDOR)/lib64/libSonyIMX386PdafLibrary.so \
	$(TARGET_OUT_VENDOR)/lib64/libSonyIMX386PdafLibraryWrapper.so \
	$(TARGET_OUT_VENDOR)/lib64/libSonyIMX519PdafLibrary.so \
	$(TARGET_OUT_VENDOR)/lib64/libSonyIMX519PdafLibraryWrapper.so \
	$(TARGET_OUT_VENDOR)/lib64/libaaa_ltm.so \
	$(TARGET_OUT_VENDOR)/lib64/libaaa_ltmx.so \
	$(TARGET_OUT_VENDOR)/lib64/libaal_cust_func.so \
	$(TARGET_OUT_VENDOR)/lib64/libaalservice.so \
	$(TARGET_OUT_VENDOR)/lib64/libacdk.so \
	$(TARGET_OUT_VENDOR)/lib64/libaiawb_moon.so \
	$(TARGET_OUT_VENDOR)/lib64/libaiawb_p1ggm.so \
	$(TARGET_OUT_VENDOR)/lib64/libaiawb_sun.so \
	$(TARGET_OUT_VENDOR)/lib64/libaibc_tuning.so \
	$(TARGET_OUT_VENDOR)/lib64/libaibc_tuning_p2.so \
	$(TARGET_OUT_VENDOR)/lib64/libaibc_tuning_p3.so \
	$(TARGET_OUT_VENDOR)/lib64/libaibc_tuning_p4.so \
	$(TARGET_OUT_VENDOR)/lib64/libaidepth_tuning.so \
	$(TARGET_OUT_VENDOR)/lib64/libaiselector.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.afhal.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.chdr.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.feature_utils.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.cctsvr.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.log.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.ae.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.ai3a.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.awb.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.dng.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.fsmgr.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.lscMgr.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.lsctbl.50.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.nvram.50.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.platform.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.resultpool.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.hal3a.v3.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.halisp.buf.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.halisp.common.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.halisp.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.halsensor.hwintegration.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.halsensor.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.iopipe.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.isptuning.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.pdtblgen.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.tuning.cache.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.utils.sensorprovider.so \
	$(TARGET_OUT_VENDOR)/lib64/libcam.vhdr.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamalgo.ispfeature.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamalgo.lsc.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamalgo.platform2.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamalgo.rotate.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamalgo.vsf.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamdrv_isp.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamdrv_tuning_mgr.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamdrv_twin.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamera.custom.pd_buf_mgr.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamera.customae.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamera.customaf.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamera.customawb.so \
	$(TARGET_OUT_VENDOR)/lib64/libcamera.customflk.so \
	$(TARGET_OUT_VENDOR)/lib64/libcameracustom.camera.3a.so \
	$(TARGET_OUT_VENDOR)/lib64/libcameracustom.camera.isp.so \
	$(TARGET_OUT_VENDOR)/lib64/libcameracustom.camera.sensors.so \
	$(TARGET_OUT_VENDOR)/lib64/libcameracustom.camera_exif.so \
	$(TARGET_OUT_VENDOR)/lib64/libcameracustom.eis.so \
	$(TARGET_OUT_VENDOR)/lib64/libcameracustom.flashlight.so \
	$(TARGET_OUT_VENDOR)/lib64/libcameracustom.lens.so \
	$(TARGET_OUT_VENDOR)/lib64/libcameracustom.plugin.so \
	$(TARGET_OUT_VENDOR)/lib64/libcameracustom.so \
	$(TARGET_OUT_VENDOR)/lib64/libdip_drv.so \
	$(TARGET_OUT_VENDOR)/lib64/libdip_postproc.so \
	$(TARGET_OUT_VENDOR)/lib64/libdpframework.so \
	$(TARGET_OUT_VENDOR)/lib64/libeffecthal.base.so \
	$(TARGET_OUT_VENDOR)/lib64/libfeature.face.so \
	$(TARGET_OUT_VENDOR)/lib64/libfeature.stereo.provider.so \
	$(TARGET_OUT_VENDOR)/lib64/libfeature.vsdof.hal.so \
	$(TARGET_OUT_VENDOR)/lib64/libfeature_3dnr.so \
	$(TARGET_OUT_VENDOR)/lib64/libfeature_eis.so \
	$(TARGET_OUT_VENDOR)/lib64/libfeature_fsc.so \
	$(TARGET_OUT_VENDOR)/lib64/libfeature_lmv.so \
	$(TARGET_OUT_VENDOR)/lib64/libfeature_rss.so \
	$(TARGET_OUT_VENDOR)/lib64/libfeatureiodrv_mem.so \
	$(TARGET_OUT_VENDOR)/lib64/libgpudataproducer.so \
	$(TARGET_OUT_VENDOR)/lib64/libimageio.so \
	$(TARGET_OUT_VENDOR)/lib64/libimageio_plat_drv.so \
	$(TARGET_OUT_VENDOR)/lib64/libimageio_plat_pipe.so \
	$(TARGET_OUT_VENDOR)/lib64/liblpcnr.so \
	$(TARGET_OUT_VENDOR)/lib64/libmnl.so \
	$(TARGET_OUT_VENDOR)/lib64/libmsnr.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtk_drvb.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam.atmseventmgr.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam.eventcallback.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam.featurepipe.capture.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam.featurepipe.depthmap.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam.featurepipe.streaming.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam.featurepipe.vsdof_util.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam.logicalmodule.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_3rdparty.core.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_3rdparty.customer.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_3rdparty.mtk.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_3rdparty.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_calibration_convertor.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_calibration_provider.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_debugutils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_device3_app.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_device3_hal.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_device3_hidl.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_device3_hidlutils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_device3_utils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_devicesessionpolicy.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_diputils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_exif.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_fdvt.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_featurepolicy.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_featureutils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_fwkutils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_grallocutils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_hwnode.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_hwutils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_imem.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_imgbuf.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_mapping_mgr.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_metadata.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_metastore.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_mfb.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_modulefactory_aaa.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_modulefactory_custom.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_modulefactory_drv.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_modulefactory_utils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_modulehelper.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_owe.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipeline.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipeline_fbm.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinemodel.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinemodel_adapter.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinemodel_capture.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinemodel_isp.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinemodel_session.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinemodel_utils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinemodel_zsl.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinepolicy-security.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinepolicy-smvr.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinepolicy.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_pipelinepolicy_factory.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_prerelease.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_rsc.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_scenariorecorder.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_stdutils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_streamutils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_synchelper.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_sysutils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_tuning_utils.so \
	$(TARGET_OUT_VENDOR)/lib64/libmtkcam_ulog.so \
	$(TARGET_OUT_VENDOR)/lib64/libneuralnetworks_sl_driver_mtk_prebuilt.so \
	$(TARGET_OUT_VENDOR)/lib64/libneuron_adapter_mgvi.so \
	$(TARGET_OUT_VENDOR)/lib64/libneuron_runtime.5.so \
	$(TARGET_OUT_VENDOR)/lib64/libnir_neon_driver.so \
	$(TARGET_OUT_VENDOR)/lib64/libpq_cust_base.so \
	$(TARGET_OUT_VENDOR)/lib64/libpq_prot.so \
	$(TARGET_OUT_VENDOR)/lib64/libpqparamparser.so \
	$(TARGET_OUT_VENDOR)/lib64/libstereoinfoaccessor_vsdof.so \
	$(TARGET_OUT_VENDOR)/lib64/libvainr_model.so \
	$(TARGET_OUT_VENDOR)/lib64/mtkcam/libmtkcam_streaminfo_plugin-p1stt.so

# Gatekeeper symlinks
GATEKEEPER_SYMLINKS := \
	$(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so

# Sensors links
SENSORS_SYMLINKS := \
	$(TARGET_OUT_VENDOR)/lib64/hw/sensors.$(TARGET_BOARD_PLATFORM).so

# Audio symlinks
AUDIO_SYMLINKS := \
	$(TARGET_OUT_VENDOR)/lib64/hw/audio.primary.$(TARGET_BOARD_PLATFORM).so \
	$(TARGET_OUT_VENDOR)/lib64/hw/audio.r_submix.$(TARGET_BOARD_PLATFORM).so

# VPUD symlink
VPUD_SYMLINKS := \
    $(TARGET_OUT_VENDOR)/bin/v3avpud

$(VENDOR_PLATFORM_LINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $(notdir $@)"
	@ln -sf $(TARGET_BOARD_PLATFORM)/$(notdir $@) $@

$(GATEKEEPER_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $@"
	@ln -sf libSoftGatekeeper.so $@

$(SENSORS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $@"
	@ln -sf sensors.mediatek.V2.0.so $@

$(AUDIO_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $@"
	@ln -sf $(subst $(TARGET_BOARD_PLATFORM),mediatek,$(notdir $@)) $@

$(VPUD_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $@"
	@ln -sf $(notdir $@).$(TARGET_BOARD_PLATFORM) $@

ALL_DEFAULT_INSTALLED_MODULES += $(VENDOR_PLATFORM_LINKS) $(GATEKEEPER_SYMLINKS) $(SENSORS_SYMLINKS) $(AUDIO_SYMLINKS) $(VPUD_SYMLINKS)

endif
