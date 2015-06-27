#include <linux/module.h>
#include <linux/keyboard.h>

int keycount = 0;
module_param(keycount, int, 0444);

int key_notifier(struct notifier_block *nblock,
				 unsigned long code, void *param);

struct notifier_block cnt_notifier = {
  .notifier_call = key_notifier
};

int key_notifier(struct notifier_block *nblock,
				 unsigned long code, void *_param)
{
  struct keyboard_notifier_param *param = _param;
  if(code == KBD_KEYCODE && param -> down)
	keycount ++;

  return NOTIFY_OK;
}

static int init_fingermarathon(void)
{
  keycount = 0;

  register_keyboard_notifier(&cnt_notifier);
  return 0;
}

static void cleanup_fingermarathon(void)
{
  unregister_keyboard_notifier(&cnt_notifier);
}

module_init(init_fingermarathon);
module_exit(cleanup_fingermarathon);

MODULE_LICENSE("GPL");
