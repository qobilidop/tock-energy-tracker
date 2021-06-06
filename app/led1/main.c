#include <led.h>
#include <timer.h>

int main(void) {
  int i_led = 0;

  // Wait for some time before start
  delay_ms(15000);

  // Turn the LED on and off
  for (int i = 0; i < 10; i++) {
    led_on(i_led);
    delay_ms(1000);
    led_off(i_led);
    delay_ms(1000);
  }
}
