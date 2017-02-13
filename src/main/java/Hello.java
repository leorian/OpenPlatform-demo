/**
 * Created by Administrator on 2017/2/10 0010.
 */
public class Hello {
    public static void main(String args[]) {
        //System.out.println(System.getProperties());
        String i = "0";
        System.out.println(i.getClass().getName());
        Integer i2 = 0;
        System.out.println(i2.getClass().getName());
        Long i3 = 0l;
        System.out.println(i3.getClass().getName());

        Integer integer = new Integer("1");
    }
}
