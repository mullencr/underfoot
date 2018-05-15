///clean_instances
while (ds_list_size(self.links) > 0) {
    instance_destroy(self.links[| 0]);
    ds_list_delete(self.links, 0);
}
