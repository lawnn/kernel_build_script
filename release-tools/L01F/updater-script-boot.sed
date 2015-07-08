ui_print("");
ui_print("");
ui_print("------------------------------------------------");
ui_print("@VERSION");
ui_print("  KBC Developers:");
ui_print("    lawn");
ui_print("------------------------------------------------");
ui_print("");
show_progress(0.500000, 0);

#copy loki flash files
package_extract_dir("loki", "/tmp");

#copy boot.img (for loki flash method)
package_extract_file("boot.img", "/tmp/loki/boot.img");

#set loki permissions
set_perm(0, 1000, 0755, "/tmp/loki.sh");
set_perm_recursive(0, 1000, 0755, 0755, "/tmp/loki");

#run loki flash
ui_print("Installing kernel");
assert(run_program("/tmp/loki.sh") == 0);

#mount system
mount("ext4", "EMMC", "/dev/block/platform/msm_sdcc.1/by-name/system", "/system");

#load system stuff
delete_recursive("/system/lib/modules");
package_extract_dir("system", "/system");
set_perm_recursive(0, 0, 0755, 0755, "/system/lib/modules");



#cleanup
delete("/tmp/loki.sh");
unmount("/system");
show_progress(0.100000, 0);

ui_print("flash complete. Enjoy!");
set_progress(1.000000);
