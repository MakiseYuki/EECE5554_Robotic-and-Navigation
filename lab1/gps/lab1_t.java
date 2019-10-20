/* LCM type definition class file
 * This file was automatically generated by lcm-gen
 * DO NOT MODIFY BY HAND!!!!
 */

package gps;
 
import java.io.*;
import java.util.*;
import lcm.lcm.*;
 
public final class lab1_t implements lcm.lcm.LCMEncodable
{
    public double timestamp;
    public double latitude;
    public String lat_direction;
    public double longitude;
    public String long_direction;
    public double altitude;
    public double utmeasting;
    public double utmnorthing;
 
    public lab1_t()
    {
    }
 
    public static final long LCM_FINGERPRINT;
    public static final long LCM_FINGERPRINT_BASE = 0xd174d17ba84832c5L;
 
    static {
        LCM_FINGERPRINT = _hashRecursive(new ArrayList<Class<?>>());
    }
 
    public static long _hashRecursive(ArrayList<Class<?>> classes)
    {
        if (classes.contains(gps.lab1_t.class))
            return 0L;
 
        classes.add(gps.lab1_t.class);
        long hash = LCM_FINGERPRINT_BASE
            ;
        classes.remove(classes.size() - 1);
        return (hash<<1) + ((hash>>63)&1);
    }
 
    public void encode(DataOutput outs) throws IOException
    {
        outs.writeLong(LCM_FINGERPRINT);
        _encodeRecursive(outs);
    }
 
    public void _encodeRecursive(DataOutput outs) throws IOException
    {
        char[] __strbuf = null;
        outs.writeDouble(this.timestamp); 
 
        outs.writeDouble(this.latitude); 
 
        __strbuf = new char[this.lat_direction.length()]; this.lat_direction.getChars(0, this.lat_direction.length(), __strbuf, 0); outs.writeInt(__strbuf.length+1); for (int _i = 0; _i < __strbuf.length; _i++) outs.write(__strbuf[_i]); outs.writeByte(0); 
 
        outs.writeDouble(this.longitude); 
 
        __strbuf = new char[this.long_direction.length()]; this.long_direction.getChars(0, this.long_direction.length(), __strbuf, 0); outs.writeInt(__strbuf.length+1); for (int _i = 0; _i < __strbuf.length; _i++) outs.write(__strbuf[_i]); outs.writeByte(0); 
 
        outs.writeDouble(this.altitude); 
 
        outs.writeDouble(this.utmeasting); 
 
        outs.writeDouble(this.utmnorthing); 
 
    }
 
    public lab1_t(byte[] data) throws IOException
    {
        this(new LCMDataInputStream(data));
    }
 
    public lab1_t(DataInput ins) throws IOException
    {
        if (ins.readLong() != LCM_FINGERPRINT)
            throw new IOException("LCM Decode error: bad fingerprint");
 
        _decodeRecursive(ins);
    }
 
    public static gps.lab1_t _decodeRecursiveFactory(DataInput ins) throws IOException
    {
        gps.lab1_t o = new gps.lab1_t();
        o._decodeRecursive(ins);
        return o;
    }
 
    public void _decodeRecursive(DataInput ins) throws IOException
    {
        char[] __strbuf = null;
        this.timestamp = ins.readDouble();
 
        this.latitude = ins.readDouble();
 
        __strbuf = new char[ins.readInt()-1]; for (int _i = 0; _i < __strbuf.length; _i++) __strbuf[_i] = (char) (ins.readByte()&0xff); ins.readByte(); this.lat_direction = new String(__strbuf);
 
        this.longitude = ins.readDouble();
 
        __strbuf = new char[ins.readInt()-1]; for (int _i = 0; _i < __strbuf.length; _i++) __strbuf[_i] = (char) (ins.readByte()&0xff); ins.readByte(); this.long_direction = new String(__strbuf);
 
        this.altitude = ins.readDouble();
 
        this.utmeasting = ins.readDouble();
 
        this.utmnorthing = ins.readDouble();
 
    }
 
    public gps.lab1_t copy()
    {
        gps.lab1_t outobj = new gps.lab1_t();
        outobj.timestamp = this.timestamp;
 
        outobj.latitude = this.latitude;
 
        outobj.lat_direction = this.lat_direction;
 
        outobj.longitude = this.longitude;
 
        outobj.long_direction = this.long_direction;
 
        outobj.altitude = this.altitude;
 
        outobj.utmeasting = this.utmeasting;
 
        outobj.utmnorthing = this.utmnorthing;
 
        return outobj;
    }
 
}

